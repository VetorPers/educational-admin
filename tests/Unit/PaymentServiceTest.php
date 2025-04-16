<?php

namespace Tests\Unit;

use App\Services\Pay\OmiseService;
use Tests\TestCase;
use OmiseLink;
use Illuminate\Support\Facades\Log;
use App\Exceptions\BusinessException;
use Mockery;

class PaymentServiceTest extends TestCase
{
    private $paymentService;
    private $omiseLinkMock;

    protected function setUp(): void
    {
        parent::setUp();

        $this->paymentService = new OmiseService();
        $this->omiseLinkMock = Mockery::mock('alias:OmiseLink');

        // 设置默认配置
        $this->paymentService->setCurrency('THB');
        $this->paymentService->setMultiple(false);
    }

    protected function tearDown(): void
    {
        Mockery::close();
        parent::tearDown();
    }

    /**
     * 测试成功创建支付链接
     */
    public function testCreateLinkSuccessfully()
    {
        $expectedResponse = [
            'id' => 'link_test_123',
            'amount' => '1000',
            'title' => 'Test Product',
            'currency' => 'THB',
            'multiple' => false,
            'description' => 'Test Product'
        ];

        $this->omiseLinkMock->shouldReceive('create')
            ->once()
            ->with([
                'amount' => '1000',
                'title' => 'Test Product',
                'currency' => 'THB',
                'multiple' => false,
                'description' => 'Test Product',
            ])
            ->andReturnSelf();

        $this->omiseLinkMock->shouldReceive('toArray')
            ->once()
            ->andReturn($expectedResponse);

        $result = $this->paymentService->createLink('1000', 'Test Product');

        $this->assertEquals($expectedResponse, $result);
    }

    /**
     * 测试带有自定义描述的支付链接创建
     */
    public function testCreateLinkWithCustomDescription()
    {
        $expectedResponse = [
            'id' => 'link_test_456',
            'amount' => '2000',
            'title' => 'Premium Product',
            'currency' => 'THB',
            'multiple' => false,
            'description' => 'Custom description'
        ];

        $this->omiseLinkMock->shouldReceive('create')
            ->once()
            ->with([
                'amount' => '2000',
                'title' => 'Premium Product',
                'currency' => 'THB',
                'multiple' => false,
                'description' => 'Custom description',
            ])
            ->andReturnSelf();

        $this->omiseLinkMock->shouldReceive('toArray')
            ->once()
            ->andReturn($expectedResponse);

        $result = $this->paymentService->createLink('2000', 'Premium Product', [
            'description' => 'Custom description'
        ]);

        $this->assertEquals($expectedResponse, $result);
    }

    /**
     * 测试创建支付链接失败时的异常处理
     */
    public function testCreateLinkFailureThrowsBusinessException()
    {
        $this->expectException(BusinessException::class);
        $this->expectExceptionMessage('创建支付链接失败');

        Log::shouldReceive('channel')
            ->once()
            ->with('pay')
            ->andReturnSelf();

        Log::shouldReceive('error')
            ->once()
            ->with('创建支付链接失败', Mockery::type('array'));

        $this->omiseLinkMock->shouldReceive('create')
            ->once()
            ->andThrow(new \Exception('API Error'));

        $this->paymentService->createLink('1000', 'Failing Product');
    }

    /**
     * 测试使用不同货币和multiple设置
     */
    public function testCreateLinkWithDifferentCurrencyAndMultiple()
    {
        $this->paymentService->setCurrency('USD');
        $this->paymentService->setMultiple(true);

        $expectedResponse = [
            'id' => 'link_test_789',
            'amount' => '5000',
            'title' => 'USD Product',
            'currency' => 'USD',
            'multiple' => true,
            'description' => 'USD Product'
        ];

        $this->omiseLinkMock->shouldReceive('create')
            ->once()
            ->with([
                'amount' => '5000',
                'title' => 'USD Product',
                'currency' => 'USD',
                'multiple' => true,
                'description' => 'USD Product',
            ])
            ->andReturnSelf();

        $this->omiseLinkMock->shouldReceive('toArray')
            ->once()
            ->andReturn($expectedResponse);

        $result = $this->paymentService->createLink('5000', 'USD Product');

        $this->assertEquals($expectedResponse, $result);
    }
}
