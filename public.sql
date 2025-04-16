/*
 Navicat Premium Data Transfer

 Source Server         : local-postgres
 Source Server Type    : PostgreSQL
 Source Server Version : 170004 (170004)
 Source Host           : localhost:5432
 Source Catalog        : teaching-admin
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 170004 (170004)
 File Encoding         : 65001

 Date: 14/04/2025 15:45:04
*/


-- ----------------------------
-- Sequence structure for admin_menu_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."admin_menu_id_seq";
CREATE SEQUENCE "public"."admin_menu_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for admin_operation_log_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."admin_operation_log_id_seq";
CREATE SEQUENCE "public"."admin_operation_log_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for admin_permissions_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."admin_permissions_id_seq";
CREATE SEQUENCE "public"."admin_permissions_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for admin_roles_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."admin_roles_id_seq";
CREATE SEQUENCE "public"."admin_roles_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for admin_users_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."admin_users_id_seq";
CREATE SEQUENCE "public"."admin_users_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for course_student_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."course_student_id_seq";
CREATE SEQUENCE "public"."course_student_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for courses_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."courses_id_seq";
CREATE SEQUENCE "public"."courses_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for failed_jobs_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."failed_jobs_id_seq";
CREATE SEQUENCE "public"."failed_jobs_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for migrations_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."migrations_id_seq";
CREATE SEQUENCE "public"."migrations_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for oauth_clients_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."oauth_clients_id_seq";
CREATE SEQUENCE "public"."oauth_clients_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for oauth_personal_access_clients_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."oauth_personal_access_clients_id_seq";
CREATE SEQUENCE "public"."oauth_personal_access_clients_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for orders_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."orders_id_seq";
CREATE SEQUENCE "public"."orders_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for students_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."students_id_seq";
CREATE SEQUENCE "public"."students_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Table structure for admin_menu
-- ----------------------------
DROP TABLE IF EXISTS "public"."admin_menu";
CREATE TABLE "public"."admin_menu" (
  "id" int4 NOT NULL DEFAULT nextval('admin_menu_id_seq'::regclass),
  "parent_id" int4 NOT NULL DEFAULT 0,
  "order" int4 NOT NULL DEFAULT 0,
  "title" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "icon" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "uri" varchar(255) COLLATE "pg_catalog"."default",
  "permission" varchar(255) COLLATE "pg_catalog"."default",
  "created_at" timestamp(0),
  "updated_at" timestamp(0)
)
;

-- ----------------------------
-- Records of admin_menu
-- ----------------------------
INSERT INTO "public"."admin_menu" VALUES (1, 0, 1, 'Dashboard', 'fa-bar-chart', '/', NULL, NULL, NULL);
INSERT INTO "public"."admin_menu" VALUES (11, 0, 2, '教师管理', 'fa-user-secret', 'teachers', NULL, '2025-04-09 15:32:16', '2025-04-09 15:32:56');
INSERT INTO "public"."admin_menu" VALUES (12, 0, 3, '学生管理', 'fa-user-md', 'students', NULL, '2025-04-09 15:32:52', '2025-04-09 15:32:56');
INSERT INTO "public"."admin_menu" VALUES (2, 0, 4, 'Admin', 'fa-tasks', '', NULL, NULL, '2025-04-09 15:32:56');
INSERT INTO "public"."admin_menu" VALUES (3, 2, 5, 'Users', 'fa-users', 'auth/users', NULL, NULL, '2025-04-09 15:32:56');
INSERT INTO "public"."admin_menu" VALUES (4, 2, 6, 'Roles', 'fa-user', 'auth/roles', NULL, NULL, '2025-04-09 15:32:56');
INSERT INTO "public"."admin_menu" VALUES (5, 2, 7, 'Permission', 'fa-ban', 'auth/permissions', NULL, NULL, '2025-04-09 15:32:56');
INSERT INTO "public"."admin_menu" VALUES (6, 2, 8, 'Menu', 'fa-bars', 'auth/menu', NULL, NULL, '2025-04-09 15:32:56');
INSERT INTO "public"."admin_menu" VALUES (7, 2, 9, 'Operation log', 'fa-history', 'auth/logs', NULL, NULL, '2025-04-09 15:32:56');

-- ----------------------------
-- Table structure for admin_operation_log
-- ----------------------------
DROP TABLE IF EXISTS "public"."admin_operation_log";
CREATE TABLE "public"."admin_operation_log" (
  "id" int4 NOT NULL DEFAULT nextval('admin_operation_log_id_seq'::regclass),
  "user_id" int4 NOT NULL,
  "path" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "method" varchar(10) COLLATE "pg_catalog"."default" NOT NULL,
  "ip" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "input" text COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamp(0),
  "updated_at" timestamp(0)
)
;

-- ----------------------------
-- Records of admin_operation_log
-- ----------------------------
INSERT INTO "public"."admin_operation_log" VALUES (1, 1, 'admin', 'GET', '172.21.0.1', '[]', '2025-04-08 15:12:40', '2025-04-08 15:12:40');
INSERT INTO "public"."admin_operation_log" VALUES (2, 1, 'admin/auth/menu', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-08 16:46:41', '2025-04-08 16:46:41');
INSERT INTO "public"."admin_operation_log" VALUES (3, 1, 'admin/auth/menu', 'POST', '172.21.0.1', '{"parent_id":"0","title":"\u7528\u6237\u7ba1\u7406","icon":"fa-users","uri":null,"roles":[null],"permission":null,"_token":"UFMJar0WANYCEytgvVO836zUPUHS7mhDdrGiQpf4"}', '2025-04-08 16:47:26', '2025-04-08 16:47:26');
INSERT INTO "public"."admin_operation_log" VALUES (4, 1, 'admin/auth/menu', 'GET', '172.21.0.1', '[]', '2025-04-08 16:47:26', '2025-04-08 16:47:26');
INSERT INTO "public"."admin_operation_log" VALUES (5, 1, 'admin/auth/menu', 'GET', '172.21.0.1', '[]', '2025-04-08 16:47:49', '2025-04-08 16:47:49');
INSERT INTO "public"."admin_operation_log" VALUES (6, 1, 'admin/auth/menu', 'POST', '172.21.0.1', '{"_token":"UFMJar0WANYCEytgvVO836zUPUHS7mhDdrGiQpf4","_order":"[{\"id\":1},{\"id\":8},{\"id\":2,\"children\":[{\"id\":3},{\"id\":4},{\"id\":5},{\"id\":6},{\"id\":7}]}]"}', '2025-04-08 16:48:01', '2025-04-08 16:48:01');
INSERT INTO "public"."admin_operation_log" VALUES (7, 1, 'admin/auth/menu', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-08 16:48:01', '2025-04-08 16:48:01');
INSERT INTO "public"."admin_operation_log" VALUES (8, 1, 'admin/auth/menu', 'GET', '172.21.0.1', '[]', '2025-04-08 16:48:02', '2025-04-08 16:48:02');
INSERT INTO "public"."admin_operation_log" VALUES (9, 1, 'admin/auth/menu', 'POST', '172.21.0.1', '{"parent_id":"8","title":"\u6559\u5e08\u7ba1\u7406","icon":"fa-user-secret","uri":"teachers","roles":[null],"permission":null,"_token":"UFMJar0WANYCEytgvVO836zUPUHS7mhDdrGiQpf4"}', '2025-04-08 16:48:37', '2025-04-08 16:48:37');
INSERT INTO "public"."admin_operation_log" VALUES (10, 1, 'admin/auth/menu', 'GET', '172.21.0.1', '[]', '2025-04-08 16:48:37', '2025-04-08 16:48:37');
INSERT INTO "public"."admin_operation_log" VALUES (11, 1, 'admin/auth/menu', 'GET', '172.21.0.1', '[]', '2025-04-08 16:48:39', '2025-04-08 16:48:39');
INSERT INTO "public"."admin_operation_log" VALUES (12, 1, 'admin/teachers', 'GET', '172.21.0.1', '[]', '2025-04-08 16:48:52', '2025-04-08 16:48:52');
INSERT INTO "public"."admin_operation_log" VALUES (13, 1, 'admin/auth/setting', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-08 16:50:04', '2025-04-08 16:50:04');
INSERT INTO "public"."admin_operation_log" VALUES (14, 1, 'admin/teachers', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-08 16:50:13', '2025-04-08 16:50:13');
INSERT INTO "public"."admin_operation_log" VALUES (15, 1, 'admin/teachers', 'GET', '172.21.0.1', '[]', '2025-04-08 16:50:51', '2025-04-08 16:50:51');
INSERT INTO "public"."admin_operation_log" VALUES (16, 1, 'admin/auth/setting', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-08 16:50:54', '2025-04-08 16:50:54');
INSERT INTO "public"."admin_operation_log" VALUES (17, 1, 'admin/teachers', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-08 16:50:56', '2025-04-08 16:50:56');
INSERT INTO "public"."admin_operation_log" VALUES (18, 1, 'admin/teachers', 'GET', '172.21.0.1', '[]', '2025-04-08 16:51:48', '2025-04-08 16:51:48');
INSERT INTO "public"."admin_operation_log" VALUES (19, 1, 'admin/teachers', 'GET', '172.21.0.1', '[]', '2025-04-08 16:51:49', '2025-04-08 16:51:49');
INSERT INTO "public"."admin_operation_log" VALUES (20, 1, 'admin/teachers', 'GET', '172.21.0.1', '[]', '2025-04-08 16:52:07', '2025-04-08 16:52:07');
INSERT INTO "public"."admin_operation_log" VALUES (21, 1, 'admin/teachers', 'GET', '172.21.0.1', '[]', '2025-04-08 16:52:08', '2025-04-08 16:52:08');
INSERT INTO "public"."admin_operation_log" VALUES (22, 1, 'admin/teachers', 'GET', '172.21.0.1', '[]', '2025-04-08 16:52:08', '2025-04-08 16:52:08');
INSERT INTO "public"."admin_operation_log" VALUES (23, 1, 'admin/teachers', 'GET', '172.21.0.1', '[]', '2025-04-08 16:54:34', '2025-04-08 16:54:34');
INSERT INTO "public"."admin_operation_log" VALUES (24, 1, 'admin/teachers', 'GET', '172.21.0.1', '[]', '2025-04-08 16:56:19', '2025-04-08 16:56:19');
INSERT INTO "public"."admin_operation_log" VALUES (25, 1, 'admin/teachers', 'GET', '172.21.0.1', '[]', '2025-04-08 16:56:20', '2025-04-08 16:56:20');
INSERT INTO "public"."admin_operation_log" VALUES (26, 1, 'admin/teachers/create', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-08 16:57:11', '2025-04-08 16:57:11');
INSERT INTO "public"."admin_operation_log" VALUES (27, 1, 'admin/teachers', 'GET', '172.21.0.1', '[]', '2025-04-08 16:57:11', '2025-04-08 16:57:11');
INSERT INTO "public"."admin_operation_log" VALUES (28, 1, 'admin/teachers', 'GET', '172.21.0.1', '[]', '2025-04-08 16:58:04', '2025-04-08 16:58:04');
INSERT INTO "public"."admin_operation_log" VALUES (29, 1, 'admin/teachers', 'GET', '172.21.0.1', '[]', '2025-04-08 17:01:02', '2025-04-08 17:01:02');
INSERT INTO "public"."admin_operation_log" VALUES (30, 1, 'admin/teachers', 'GET', '172.21.0.1', '[]', '2025-04-08 17:01:26', '2025-04-08 17:01:26');
INSERT INTO "public"."admin_operation_log" VALUES (31, 1, 'admin/teachers', 'GET', '172.21.0.1', '[]', '2025-04-08 17:01:38', '2025-04-08 17:01:38');
INSERT INTO "public"."admin_operation_log" VALUES (32, 1, 'admin/teachers', 'GET', '172.21.0.1', '[]', '2025-04-08 17:02:46', '2025-04-08 17:02:46');
INSERT INTO "public"."admin_operation_log" VALUES (33, 1, 'admin/teachers', 'GET', '172.21.0.1', '[]', '2025-04-08 17:03:01', '2025-04-08 17:03:01');
INSERT INTO "public"."admin_operation_log" VALUES (34, 1, 'admin/teachers', 'GET', '172.21.0.1', '[]', '2025-04-08 17:03:12', '2025-04-08 17:03:12');
INSERT INTO "public"."admin_operation_log" VALUES (35, 1, 'admin/teachers', 'GET', '172.21.0.1', '[]', '2025-04-08 17:03:40', '2025-04-08 17:03:40');
INSERT INTO "public"."admin_operation_log" VALUES (36, 1, 'admin/teachers', 'GET', '172.21.0.1', '[]', '2025-04-08 17:03:52', '2025-04-08 17:03:52');
INSERT INTO "public"."admin_operation_log" VALUES (37, 1, 'admin/teachers/create', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-08 17:03:59', '2025-04-08 17:03:59');
INSERT INTO "public"."admin_operation_log" VALUES (38, 1, 'admin/teachers', 'POST', '172.21.0.1', '{"username":"vetor","name":"\u5f20\u4e09","password":"xiaowei123","_token":"UFMJar0WANYCEytgvVO836zUPUHS7mhDdrGiQpf4","_previous_":"http:\/\/127.0.0.1:8093\/admin\/teachers"}', '2025-04-08 17:04:29', '2025-04-08 17:04:29');
INSERT INTO "public"."admin_operation_log" VALUES (39, 1, 'admin/teachers/create', 'GET', '172.21.0.1', '[]', '2025-04-08 17:04:30', '2025-04-08 17:04:30');
INSERT INTO "public"."admin_operation_log" VALUES (40, 1, 'admin/teachers/create', 'GET', '172.21.0.1', '[]', '2025-04-08 17:04:52', '2025-04-08 17:04:52');
INSERT INTO "public"."admin_operation_log" VALUES (41, 1, 'admin/teachers/create', 'GET', '172.21.0.1', '[]', '2025-04-08 17:04:55', '2025-04-08 17:04:55');
INSERT INTO "public"."admin_operation_log" VALUES (42, 1, 'admin/teachers', 'POST', '172.21.0.1', '{"username":"vetor","name":"\u5f20\u4e09","password":null,"password_confirmation":null,"_token":"UFMJar0WANYCEytgvVO836zUPUHS7mhDdrGiQpf4"}', '2025-04-08 17:07:06', '2025-04-08 17:07:06');
INSERT INTO "public"."admin_operation_log" VALUES (43, 1, 'admin/teachers/create', 'GET', '172.21.0.1', '[]', '2025-04-08 17:07:07', '2025-04-08 17:07:07');
INSERT INTO "public"."admin_operation_log" VALUES (44, 1, 'admin/teachers', 'POST', '172.21.0.1', '{"username":"vetor","name":"\u5f20\u4e09","password":null,"password_confirmation":null,"_token":"UFMJar0WANYCEytgvVO836zUPUHS7mhDdrGiQpf4"}', '2025-04-08 17:10:50', '2025-04-08 17:10:50');
INSERT INTO "public"."admin_operation_log" VALUES (45, 1, 'admin/teachers/create', 'GET', '172.21.0.1', '[]', '2025-04-08 17:10:51', '2025-04-08 17:10:51');
INSERT INTO "public"."admin_operation_log" VALUES (46, 1, 'admin/teachers/create', 'GET', '172.21.0.1', '[]', '2025-04-08 17:10:52', '2025-04-08 17:10:52');
INSERT INTO "public"."admin_operation_log" VALUES (47, 1, 'admin/teachers', 'POST', '172.21.0.1', '{"username":null,"name":null,"password":null,"password_confirmation":null,"_token":"UFMJar0WANYCEytgvVO836zUPUHS7mhDdrGiQpf4"}', '2025-04-08 17:10:53', '2025-04-08 17:10:53');
INSERT INTO "public"."admin_operation_log" VALUES (48, 1, 'admin/teachers/create', 'GET', '172.21.0.1', '[]', '2025-04-08 17:10:53', '2025-04-08 17:10:53');
INSERT INTO "public"."admin_operation_log" VALUES (49, 1, 'admin/teachers/create', 'GET', '172.21.0.1', '[]', '2025-04-08 17:11:16', '2025-04-08 17:11:16');
INSERT INTO "public"."admin_operation_log" VALUES (50, 1, 'admin/teachers', 'POST', '172.21.0.1', '{"username":null,"name":null,"password":null,"password_confirmation":null,"_token":"UFMJar0WANYCEytgvVO836zUPUHS7mhDdrGiQpf4"}', '2025-04-08 17:11:21', '2025-04-08 17:11:21');
INSERT INTO "public"."admin_operation_log" VALUES (51, 1, 'admin/teachers/create', 'GET', '172.21.0.1', '[]', '2025-04-08 17:11:21', '2025-04-08 17:11:21');
INSERT INTO "public"."admin_operation_log" VALUES (52, 1, 'admin/teachers/create', 'GET', '172.21.0.1', '[]', '2025-04-08 17:11:56', '2025-04-08 17:11:56');
INSERT INTO "public"."admin_operation_log" VALUES (53, 1, 'admin/teachers', 'POST', '172.21.0.1', '{"username":null,"name":null,"password":null,"password_confirmation":null,"_token":"UFMJar0WANYCEytgvVO836zUPUHS7mhDdrGiQpf4"}', '2025-04-08 17:11:58', '2025-04-08 17:11:58');
INSERT INTO "public"."admin_operation_log" VALUES (54, 1, 'admin/teachers/create', 'GET', '172.21.0.1', '[]', '2025-04-08 17:11:58', '2025-04-08 17:11:58');
INSERT INTO "public"."admin_operation_log" VALUES (55, 1, 'admin/teachers', 'POST', '172.21.0.1', '{"username":"vetor","name":"\u5f20\u4e09","password":"xiaowei123","password_confirmation":"xiaowei123","_token":"UFMJar0WANYCEytgvVO836zUPUHS7mhDdrGiQpf4"}', '2025-04-08 17:12:30', '2025-04-08 17:12:30');
INSERT INTO "public"."admin_operation_log" VALUES (56, 1, 'admin/teachers/create', 'GET', '172.21.0.1', '[]', '2025-04-08 17:12:30', '2025-04-08 17:12:30');
INSERT INTO "public"."admin_operation_log" VALUES (57, 1, 'admin/teachers', 'POST', '172.21.0.1', '{"username":"vetor","name":"\u5f20\u4e09","password":"xiaowei123","password_confirmation":"xiaowei123","_token":"UFMJar0WANYCEytgvVO836zUPUHS7mhDdrGiQpf4"}', '2025-04-08 17:12:46', '2025-04-08 17:12:46');
INSERT INTO "public"."admin_operation_log" VALUES (58, 1, 'admin/teachers/create', 'GET', '172.21.0.1', '[]', '2025-04-08 17:12:46', '2025-04-08 17:12:46');
INSERT INTO "public"."admin_operation_log" VALUES (59, 1, 'admin/teachers/create', 'GET', '172.21.0.1', '[]', '2025-04-08 17:13:02', '2025-04-08 17:13:02');
INSERT INTO "public"."admin_operation_log" VALUES (60, 1, 'admin/teachers', 'POST', '172.21.0.1', '{"username":"vetor","name":"\u4f18\u5316","password":"xiaowei123","password_confirmation":"xiaowei123","_token":"UFMJar0WANYCEytgvVO836zUPUHS7mhDdrGiQpf4"}', '2025-04-08 17:13:29', '2025-04-08 17:13:29');
INSERT INTO "public"."admin_operation_log" VALUES (61, 1, 'admin/teachers/create', 'GET', '172.21.0.1', '[]', '2025-04-08 17:13:29', '2025-04-08 17:13:29');
INSERT INTO "public"."admin_operation_log" VALUES (62, 1, 'admin/teachers/create', 'GET', '172.21.0.1', '[]', '2025-04-08 17:14:34', '2025-04-08 17:14:34');
INSERT INTO "public"."admin_operation_log" VALUES (63, 1, 'admin/teachers', 'POST', '172.21.0.1', '{"username":null,"name":null,"password":null,"password_confirmation":null,"_token":"UFMJar0WANYCEytgvVO836zUPUHS7mhDdrGiQpf4"}', '2025-04-08 17:14:37', '2025-04-08 17:14:37');
INSERT INTO "public"."admin_operation_log" VALUES (64, 1, 'admin/teachers/create', 'GET', '172.21.0.1', '[]', '2025-04-08 17:14:37', '2025-04-08 17:14:37');
INSERT INTO "public"."admin_operation_log" VALUES (186, 1, 'admin/teachers/2/edit', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 15:02:41', '2025-04-09 15:02:41');
INSERT INTO "public"."admin_operation_log" VALUES (65, 1, 'admin/teachers', 'POST', '172.21.0.1', '{"username":"vetor","name":"\u5f20\u4e09","password":"xiaowei123","password_confirmation":"xiaowei123","_token":"UFMJar0WANYCEytgvVO836zUPUHS7mhDdrGiQpf4"}', '2025-04-08 17:14:53', '2025-04-08 17:14:53');
INSERT INTO "public"."admin_operation_log" VALUES (66, 1, 'admin/teachers/create', 'GET', '172.21.0.1', '[]', '2025-04-08 17:14:53', '2025-04-08 17:14:53');
INSERT INTO "public"."admin_operation_log" VALUES (67, 1, 'admin/teachers/create', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-08 17:15:25', '2025-04-08 17:15:25');
INSERT INTO "public"."admin_operation_log" VALUES (68, 1, 'admin/teachers/create', 'GET', '172.21.0.1', '[]', '2025-04-08 17:17:03', '2025-04-08 17:17:03');
INSERT INTO "public"."admin_operation_log" VALUES (69, 1, 'admin/teachers', 'POST', '172.21.0.1', '{"username":"vetor","name":"\u5f20\u4e09","password":"xiaowei123","password_confirmation":"xiaowei123","_token":"UFMJar0WANYCEytgvVO836zUPUHS7mhDdrGiQpf4"}', '2025-04-08 17:17:23', '2025-04-08 17:17:23');
INSERT INTO "public"."admin_operation_log" VALUES (70, 1, 'admin/teachers', 'GET', '172.21.0.1', '[]', '2025-04-08 17:17:23', '2025-04-08 17:17:23');
INSERT INTO "public"."admin_operation_log" VALUES (71, 1, 'admin/teachers/create', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-08 17:18:09', '2025-04-08 17:18:09');
INSERT INTO "public"."admin_operation_log" VALUES (72, 1, 'admin/teachers', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-08 17:18:11', '2025-04-08 17:18:11');
INSERT INTO "public"."admin_operation_log" VALUES (73, 1, 'admin/teachers', 'GET', '172.21.0.1', '[]', '2025-04-08 17:19:13', '2025-04-08 17:19:13');
INSERT INTO "public"."admin_operation_log" VALUES (74, 1, 'admin/teachers', 'GET', '172.21.0.1', '[]', '2025-04-08 17:19:52', '2025-04-08 17:19:52');
INSERT INTO "public"."admin_operation_log" VALUES (75, 1, 'admin/teachers', 'GET', '172.21.0.1', '[]', '2025-04-08 17:19:53', '2025-04-08 17:19:53');
INSERT INTO "public"."admin_operation_log" VALUES (76, 1, 'admin/teachers', 'GET', '172.21.0.1', '[]', '2025-04-08 17:19:58', '2025-04-08 17:19:58');
INSERT INTO "public"."admin_operation_log" VALUES (77, 1, 'admin/teachers', 'GET', '172.21.0.1', '[]', '2025-04-08 17:21:43', '2025-04-08 17:21:43');
INSERT INTO "public"."admin_operation_log" VALUES (78, 1, 'admin/teachers/1', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-08 17:22:51', '2025-04-08 17:22:51');
INSERT INTO "public"."admin_operation_log" VALUES (79, 1, 'admin/teachers/1/edit', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-08 17:22:53', '2025-04-08 17:22:53');
INSERT INTO "public"."admin_operation_log" VALUES (80, 1, 'admin/teachers/1', 'PUT', '172.21.0.1', '{"username":"vetor","name":"\u5f20\u4e09","password":null,"password_confirmation":null,"_token":"UFMJar0WANYCEytgvVO836zUPUHS7mhDdrGiQpf4","_method":"PUT","_previous_":"http:\/\/127.0.0.1:8093\/admin\/teachers\/1"}', '2025-04-08 17:23:01', '2025-04-08 17:23:01');
INSERT INTO "public"."admin_operation_log" VALUES (81, 1, 'admin/teachers/1/edit', 'GET', '172.21.0.1', '[]', '2025-04-08 17:23:01', '2025-04-08 17:23:01');
INSERT INTO "public"."admin_operation_log" VALUES (82, 1, 'admin/teachers/1/edit', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-08 17:23:32', '2025-04-08 17:23:32');
INSERT INTO "public"."admin_operation_log" VALUES (83, 1, 'admin/teachers/1/edit', 'GET', '172.21.0.1', '[]', '2025-04-08 17:23:34', '2025-04-08 17:23:34');
INSERT INTO "public"."admin_operation_log" VALUES (84, 1, 'admin/teachers/1', 'PUT', '172.21.0.1', '{"username":"vetor","name":"\u5f20\u4e09","password":null,"password_confirmation":"$2y$10$agx1RVBo7SunxGHojPgkW.ZDfTurBY1bvVcHvYwe4gaqK4I4wWG6G","_token":"UFMJar0WANYCEytgvVO836zUPUHS7mhDdrGiQpf4","_method":"PUT"}', '2025-04-08 17:23:42', '2025-04-08 17:23:42');
INSERT INTO "public"."admin_operation_log" VALUES (85, 1, 'admin/teachers/1/edit', 'GET', '172.21.0.1', '[]', '2025-04-08 17:23:42', '2025-04-08 17:23:42');
INSERT INTO "public"."admin_operation_log" VALUES (86, 1, 'admin/teachers/1/edit', 'GET', '172.21.0.1', '[]', '2025-04-08 17:24:19', '2025-04-08 17:24:19');
INSERT INTO "public"."admin_operation_log" VALUES (87, 1, 'admin/teachers/1', 'PUT', '172.21.0.1', '{"username":"vetor","name":"\u5f20\u4e09","password":null,"password_confirmation":"$2y$10$agx1RVBo7SunxGHojPgkW.ZDfTurBY1bvVcHvYwe4gaqK4I4wWG6G","_token":"UFMJar0WANYCEytgvVO836zUPUHS7mhDdrGiQpf4","_method":"PUT"}', '2025-04-08 17:24:26', '2025-04-08 17:24:26');
INSERT INTO "public"."admin_operation_log" VALUES (88, 1, 'admin/teachers/1/edit', 'GET', '172.21.0.1', '[]', '2025-04-08 17:24:26', '2025-04-08 17:24:26');
INSERT INTO "public"."admin_operation_log" VALUES (89, 1, 'admin/teachers/1/edit', 'GET', '172.21.0.1', '[]', '2025-04-08 17:25:09', '2025-04-08 17:25:09');
INSERT INTO "public"."admin_operation_log" VALUES (90, 1, 'admin/teachers/1', 'PUT', '172.21.0.1', '{"username":"vetor","name":"\u5f20\u4e09","password":null,"password_confirmation":"$2y$10$agx1RVBo7SunxGHojPgkW.ZDfTurBY1bvVcHvYwe4gaqK4I4wWG6G","_token":"UFMJar0WANYCEytgvVO836zUPUHS7mhDdrGiQpf4","_method":"PUT"}', '2025-04-08 17:25:11', '2025-04-08 17:25:11');
INSERT INTO "public"."admin_operation_log" VALUES (91, 1, 'admin/teachers/1/edit', 'GET', '172.21.0.1', '[]', '2025-04-08 17:25:11', '2025-04-08 17:25:11');
INSERT INTO "public"."admin_operation_log" VALUES (92, 1, 'admin/teachers/1/edit', 'GET', '172.21.0.1', '[]', '2025-04-08 17:28:19', '2025-04-08 17:28:19');
INSERT INTO "public"."admin_operation_log" VALUES (93, 1, 'admin/teachers/1/edit', 'GET', '172.21.0.1', '[]', '2025-04-08 17:28:40', '2025-04-08 17:28:40');
INSERT INTO "public"."admin_operation_log" VALUES (94, 1, 'admin/teachers/1', 'PUT', '172.21.0.1', '{"username":"vetor","name":"\u5f20\u4e09","password":null,"password_confirmation":"$2y$10$agx1RVBo7SunxGHojPgkW.ZDfTurBY1bvVcHvYwe4gaqK4I4wWG6G","_token":"UFMJar0WANYCEytgvVO836zUPUHS7mhDdrGiQpf4","_method":"PUT"}', '2025-04-08 17:28:42', '2025-04-08 17:28:42');
INSERT INTO "public"."admin_operation_log" VALUES (95, 1, 'admin/teachers/1/edit', 'GET', '172.21.0.1', '[]', '2025-04-08 17:28:42', '2025-04-08 17:28:42');
INSERT INTO "public"."admin_operation_log" VALUES (96, 1, 'admin/teachers/1/edit', 'GET', '172.21.0.1', '[]', '2025-04-08 17:28:53', '2025-04-08 17:28:53');
INSERT INTO "public"."admin_operation_log" VALUES (97, 1, 'admin/teachers/1/edit', 'GET', '172.21.0.1', '[]', '2025-04-08 17:30:10', '2025-04-08 17:30:10');
INSERT INTO "public"."admin_operation_log" VALUES (98, 1, 'admin/teachers/1', 'PUT', '172.21.0.1', '{"username":"vetor","name":"\u5f20\u4e09","password":"$2y$10$agx1RVBo7SunxGHojPgkW.ZDfTurBY1bvVcHvYwe4gaqK4I4wWG6G","password_confirmation":"$2y$10$agx1RVBo7SunxGHojPgkW.ZDfTurBY1bvVcHvYwe4gaqK4I4wWG6G","_token":"UFMJar0WANYCEytgvVO836zUPUHS7mhDdrGiQpf4","_method":"PUT"}', '2025-04-08 17:30:15', '2025-04-08 17:30:15');
INSERT INTO "public"."admin_operation_log" VALUES (99, 1, 'admin/teachers', 'GET', '172.21.0.1', '[]', '2025-04-08 17:30:15', '2025-04-08 17:30:15');
INSERT INTO "public"."admin_operation_log" VALUES (100, 1, 'admin/teachers', 'GET', '172.21.0.1', '[]', '2025-04-08 17:32:05', '2025-04-08 17:32:05');
INSERT INTO "public"."admin_operation_log" VALUES (101, 1, 'admin/teachers', 'GET', '172.21.0.1', '[]', '2025-04-08 17:32:42', '2025-04-08 17:32:42');
INSERT INTO "public"."admin_operation_log" VALUES (102, 1, 'admin/teachers', 'GET', '172.21.0.1', '[]', '2025-04-08 17:32:57', '2025-04-08 17:32:57');
INSERT INTO "public"."admin_operation_log" VALUES (103, 1, 'admin/teachers/1', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-08 17:33:08', '2025-04-08 17:33:08');
INSERT INTO "public"."admin_operation_log" VALUES (104, 1, 'admin/teachers/1', 'GET', '172.21.0.1', '[]', '2025-04-08 17:33:18', '2025-04-08 17:33:18');
INSERT INTO "public"."admin_operation_log" VALUES (105, 1, 'admin/teachers/1', 'GET', '172.21.0.1', '[]', '2025-04-08 17:33:19', '2025-04-08 17:33:19');
INSERT INTO "public"."admin_operation_log" VALUES (106, 1, 'admin/teachers/1', 'GET', '172.21.0.1', '[]', '2025-04-08 17:33:24', '2025-04-08 17:33:24');
INSERT INTO "public"."admin_operation_log" VALUES (107, 1, 'admin/teachers', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-08 17:33:37', '2025-04-08 17:33:37');
INSERT INTO "public"."admin_operation_log" VALUES (108, 1, 'admin/teachers', 'GET', '172.21.0.1', '[]', '2025-04-08 17:33:59', '2025-04-08 17:33:59');
INSERT INTO "public"."admin_operation_log" VALUES (109, 1, 'admin/teachers/1', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-08 17:34:02', '2025-04-08 17:34:02');
INSERT INTO "public"."admin_operation_log" VALUES (110, 1, 'admin/teachers/1', 'GET', '172.21.0.1', '[]', '2025-04-08 17:34:11', '2025-04-08 17:34:11');
INSERT INTO "public"."admin_operation_log" VALUES (111, 1, 'admin/teachers/1', 'GET', '172.21.0.1', '[]', '2025-04-08 17:34:28', '2025-04-08 17:34:28');
INSERT INTO "public"."admin_operation_log" VALUES (112, 1, 'admin/teachers', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-08 17:34:30', '2025-04-08 17:34:30');
INSERT INTO "public"."admin_operation_log" VALUES (113, 1, 'admin/teachers', 'GET', '172.21.0.1', '[]', '2025-04-08 17:34:38', '2025-04-08 17:34:38');
INSERT INTO "public"."admin_operation_log" VALUES (114, 1, 'admin/teachers/1/edit', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-08 17:34:43', '2025-04-08 17:34:43');
INSERT INTO "public"."admin_operation_log" VALUES (115, 1, 'admin/teachers', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-08 17:34:57', '2025-04-08 17:34:57');
INSERT INTO "public"."admin_operation_log" VALUES (116, 1, 'admin/teachers/1/edit', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-08 17:35:02', '2025-04-08 17:35:02');
INSERT INTO "public"."admin_operation_log" VALUES (117, 1, 'admin/teachers/1/edit', 'GET', '172.21.0.1', '[]', '2025-04-08 17:35:26', '2025-04-08 17:35:26');
INSERT INTO "public"."admin_operation_log" VALUES (118, 1, 'admin/auth/menu', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-08 17:36:38', '2025-04-08 17:36:38');
INSERT INTO "public"."admin_operation_log" VALUES (119, 1, 'admin/auth/menu', 'POST', '172.21.0.1', '{"parent_id":"8","title":"\u5b66\u751f\u7ba1\u7406","icon":"fa-user-md","uri":"students","roles":[null],"permission":null,"_token":"UFMJar0WANYCEytgvVO836zUPUHS7mhDdrGiQpf4"}', '2025-04-08 17:37:04', '2025-04-08 17:37:04');
INSERT INTO "public"."admin_operation_log" VALUES (120, 1, 'admin/auth/menu', 'GET', '172.21.0.1', '[]', '2025-04-08 17:37:04', '2025-04-08 17:37:04');
INSERT INTO "public"."admin_operation_log" VALUES (121, 1, 'admin/auth/menu', 'GET', '172.21.0.1', '[]', '2025-04-08 17:37:07', '2025-04-08 17:37:07');
INSERT INTO "public"."admin_operation_log" VALUES (122, 1, 'admin/students', 'GET', '172.21.0.1', '[]', '2025-04-08 17:37:18', '2025-04-08 17:37:18');
INSERT INTO "public"."admin_operation_log" VALUES (123, 1, 'admin/teachers', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-08 17:37:23', '2025-04-08 17:37:23');
INSERT INTO "public"."admin_operation_log" VALUES (124, 1, 'admin/auth/roles', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 11:15:47', '2025-04-09 11:15:47');
INSERT INTO "public"."admin_operation_log" VALUES (125, 1, 'admin/auth/roles/create', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 11:15:50', '2025-04-09 11:15:50');
INSERT INTO "public"."admin_operation_log" VALUES (250, 1, 'admin/teachers/4/edit', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 15:21:32', '2025-04-09 15:21:32');
INSERT INTO "public"."admin_operation_log" VALUES (307, 1, 'admin/auth/logout', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 15:30:58', '2025-04-09 15:30:58');
INSERT INTO "public"."admin_operation_log" VALUES (126, 1, 'admin/auth/roles', 'POST', '172.21.0.1', '{"slug":"teacher","name":"\u6559\u5e08","permissions":[null],"_token":"QtbNuRd11PcvSscSrivV5oEMj2y1Jm8xrbLdQY1Q","_previous_":"http:\/\/127.0.0.1:8093\/admin\/auth\/roles"}', '2025-04-09 11:16:26', '2025-04-09 11:16:26');
INSERT INTO "public"."admin_operation_log" VALUES (127, 1, 'admin/auth/roles', 'GET', '172.21.0.1', '[]', '2025-04-09 11:16:26', '2025-04-09 11:16:26');
INSERT INTO "public"."admin_operation_log" VALUES (128, 1, 'admin/auth/roles/create', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 11:17:57', '2025-04-09 11:17:57');
INSERT INTO "public"."admin_operation_log" VALUES (129, 1, 'admin/auth/roles', 'POST', '172.21.0.1', '{"slug":"system-adminer","name":"\u7cfb\u7edf\u7ba1\u7406\u5458","permissions":[null],"_token":"QtbNuRd11PcvSscSrivV5oEMj2y1Jm8xrbLdQY1Q","_previous_":"http:\/\/127.0.0.1:8093\/admin\/auth\/roles"}', '2025-04-09 11:18:35', '2025-04-09 11:18:35');
INSERT INTO "public"."admin_operation_log" VALUES (130, 1, 'admin/auth/roles', 'GET', '172.21.0.1', '[]', '2025-04-09 11:18:35', '2025-04-09 11:18:35');
INSERT INTO "public"."admin_operation_log" VALUES (131, 1, 'admin/auth/permissions', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 11:19:08', '2025-04-09 11:19:08');
INSERT INTO "public"."admin_operation_log" VALUES (132, 1, 'admin/auth/permissions/create', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 11:19:11', '2025-04-09 11:19:11');
INSERT INTO "public"."admin_operation_log" VALUES (133, 1, 'admin/auth/permissions', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 11:19:26', '2025-04-09 11:19:26');
INSERT INTO "public"."admin_operation_log" VALUES (134, 1, 'admin/auth/roles', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 11:19:39', '2025-04-09 11:19:39');
INSERT INTO "public"."admin_operation_log" VALUES (135, 1, 'admin/auth/permissions', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 11:19:41', '2025-04-09 11:19:41');
INSERT INTO "public"."admin_operation_log" VALUES (136, 1, 'admin/auth/permissions/create', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 11:19:59', '2025-04-09 11:19:59');
INSERT INTO "public"."admin_operation_log" VALUES (137, 1, 'admin/auth/permissions', 'POST', '172.21.0.1', '{"slug":"teacher","name":"\u6559\u5e08\u7ba1\u7406","http_method":[null],"http_path":"teachers","_token":"QtbNuRd11PcvSscSrivV5oEMj2y1Jm8xrbLdQY1Q","_previous_":"http:\/\/127.0.0.1:8093\/admin\/auth\/permissions"}', '2025-04-09 11:20:23', '2025-04-09 11:20:23');
INSERT INTO "public"."admin_operation_log" VALUES (138, 1, 'admin/auth/permissions', 'GET', '172.21.0.1', '[]', '2025-04-09 11:20:23', '2025-04-09 11:20:23');
INSERT INTO "public"."admin_operation_log" VALUES (139, 1, 'admin/auth/permissions/6/edit', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 11:20:28', '2025-04-09 11:20:28');
INSERT INTO "public"."admin_operation_log" VALUES (140, 1, 'admin/auth/permissions/6', 'PUT', '172.21.0.1', '{"slug":"teacher","name":"\u6559\u5e08\u7ba1\u7406","http_method":[null],"http_path":"\/teachers","_token":"QtbNuRd11PcvSscSrivV5oEMj2y1Jm8xrbLdQY1Q","_method":"PUT","_previous_":"http:\/\/127.0.0.1:8093\/admin\/auth\/permissions"}', '2025-04-09 11:20:33', '2025-04-09 11:20:33');
INSERT INTO "public"."admin_operation_log" VALUES (141, 1, 'admin/auth/permissions', 'GET', '172.21.0.1', '[]', '2025-04-09 11:20:33', '2025-04-09 11:20:33');
INSERT INTO "public"."admin_operation_log" VALUES (142, 1, 'admin/teachers', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 11:20:38', '2025-04-09 11:20:38');
INSERT INTO "public"."admin_operation_log" VALUES (143, 1, 'admin/auth/permissions', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 11:20:40', '2025-04-09 11:20:40');
INSERT INTO "public"."admin_operation_log" VALUES (144, 1, 'admin/auth/permissions/create', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 11:20:45', '2025-04-09 11:20:45');
INSERT INTO "public"."admin_operation_log" VALUES (145, 1, 'admin/auth/permissions', 'POST', '172.21.0.1', '{"slug":"student","name":"\u5b66\u751f\u7ba1\u7406","http_method":[null],"http_path":"\/students","_token":"QtbNuRd11PcvSscSrivV5oEMj2y1Jm8xrbLdQY1Q","_previous_":"http:\/\/127.0.0.1:8093\/admin\/auth\/permissions"}', '2025-04-09 11:21:02', '2025-04-09 11:21:02');
INSERT INTO "public"."admin_operation_log" VALUES (146, 1, 'admin/auth/permissions', 'GET', '172.21.0.1', '[]', '2025-04-09 11:21:02', '2025-04-09 11:21:02');
INSERT INTO "public"."admin_operation_log" VALUES (147, 1, 'admin/auth/login', 'POST', '172.21.0.1', '{"username":"admin","password":"admin","remember":"1","_token":"O5AUuBUpo0sNOx546D61zxh5HFejG1827ifrfLaI"}', '2025-04-09 14:41:27', '2025-04-09 14:41:27');
INSERT INTO "public"."admin_operation_log" VALUES (148, 1, 'admin', 'GET', '172.21.0.1', '[]', '2025-04-09 14:41:27', '2025-04-09 14:41:27');
INSERT INTO "public"."admin_operation_log" VALUES (149, 1, 'admin/auth/users', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 14:42:09', '2025-04-09 14:42:09');
INSERT INTO "public"."admin_operation_log" VALUES (150, 1, 'admin/auth/users', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 14:46:47', '2025-04-09 14:46:47');
INSERT INTO "public"."admin_operation_log" VALUES (151, 1, 'admin/auth/roles', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 14:50:31', '2025-04-09 14:50:31');
INSERT INTO "public"."admin_operation_log" VALUES (152, 1, 'admin/teachers', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 14:54:09', '2025-04-09 14:54:09');
INSERT INTO "public"."admin_operation_log" VALUES (153, 1, 'admin/auth/roles', 'GET', '172.21.0.1', '[]', '2025-04-09 14:54:09', '2025-04-09 14:54:09');
INSERT INTO "public"."admin_operation_log" VALUES (154, 1, 'admin/auth/roles', 'GET', '172.21.0.1', '[]', '2025-04-09 14:54:38', '2025-04-09 14:54:38');
INSERT INTO "public"."admin_operation_log" VALUES (155, 1, 'admin/auth/roles', 'GET', '172.21.0.1', '[]', '2025-04-09 14:54:49', '2025-04-09 14:54:49');
INSERT INTO "public"."admin_operation_log" VALUES (156, 1, 'admin/teachers', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 14:54:51', '2025-04-09 14:54:51');
INSERT INTO "public"."admin_operation_log" VALUES (157, 1, 'admin/auth/roles', 'GET', '172.21.0.1', '[]', '2025-04-09 14:54:51', '2025-04-09 14:54:51');
INSERT INTO "public"."admin_operation_log" VALUES (158, 1, 'admin/auth/roles', 'GET', '172.21.0.1', '[]', '2025-04-09 14:55:15', '2025-04-09 14:55:15');
INSERT INTO "public"."admin_operation_log" VALUES (159, 1, 'admin/teachers', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 14:55:18', '2025-04-09 14:55:18');
INSERT INTO "public"."admin_operation_log" VALUES (160, 1, 'admin/auth/roles', 'GET', '172.21.0.1', '[]', '2025-04-09 14:55:18', '2025-04-09 14:55:18');
INSERT INTO "public"."admin_operation_log" VALUES (161, 1, 'admin/teachers', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 14:56:36', '2025-04-09 14:56:36');
INSERT INTO "public"."admin_operation_log" VALUES (162, 1, 'admin/teachers/create', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 14:58:06', '2025-04-09 14:58:06');
INSERT INTO "public"."admin_operation_log" VALUES (163, 1, 'admin/teachers', 'POST', '172.21.0.1', '{"username":"vv","name":"\u5f20\u5e08","password":"xiaowei123","password_confirmation":"xiaowei123","_token":"O5AUuBUpo0sNOx546D61zxh5HFejG1827ifrfLaI","_previous_":"http:\/\/127.0.0.1:8093\/admin\/teachers"}', '2025-04-09 14:58:39', '2025-04-09 14:58:39');
INSERT INTO "public"."admin_operation_log" VALUES (164, 1, 'admin/teachers', 'GET', '172.21.0.1', '[]', '2025-04-09 14:58:40', '2025-04-09 14:58:40');
INSERT INTO "public"."admin_operation_log" VALUES (165, 1, 'admin/auth/users', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 14:58:43', '2025-04-09 14:58:43');
INSERT INTO "public"."admin_operation_log" VALUES (166, 1, 'admin/teachers', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 14:58:47', '2025-04-09 14:58:47');
INSERT INTO "public"."admin_operation_log" VALUES (167, 1, 'admin/teachers/2/edit', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 14:58:59', '2025-04-09 14:58:59');
INSERT INTO "public"."admin_operation_log" VALUES (168, 1, 'admin/teachers/2/edit', 'GET', '172.21.0.1', '[]', '2025-04-09 14:59:08', '2025-04-09 14:59:08');
INSERT INTO "public"."admin_operation_log" VALUES (169, 1, 'admin/teachers', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 14:59:38', '2025-04-09 14:59:38');
INSERT INTO "public"."admin_operation_log" VALUES (170, 1, 'admin/teachers/2', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 14:59:40', '2025-04-09 14:59:40');
INSERT INTO "public"."admin_operation_log" VALUES (171, 1, 'admin/teachers/2', 'GET', '172.21.0.1', '[]', '2025-04-09 15:00:56', '2025-04-09 15:00:56');
INSERT INTO "public"."admin_operation_log" VALUES (172, 1, 'admin/teachers', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 15:01:00', '2025-04-09 15:01:00');
INSERT INTO "public"."admin_operation_log" VALUES (173, 1, 'admin/teachers', 'GET', '172.21.0.1', '[]', '2025-04-09 15:01:01', '2025-04-09 15:01:01');
INSERT INTO "public"."admin_operation_log" VALUES (174, 1, 'admin/teachers/2/edit', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 15:01:04', '2025-04-09 15:01:04');
INSERT INTO "public"."admin_operation_log" VALUES (175, 1, 'admin/teachers/2', 'PUT', '172.21.0.1', '{"username":"vv","name":"\u5f20\u5e08","password":"$2y$10$SN3mLUfaKMjzdrtugxN0EOLWXN6kPHucBFrSI\/jUvtahUqW0PKvVG","password_confirmation":"$2y$10$SN3mLUfaKMjzdrtugxN0EOLWXN6kPHucBFrSI\/jUvtahUqW0PKvVG","_token":"O5AUuBUpo0sNOx546D61zxh5HFejG1827ifrfLaI","_method":"PUT","_previous_":"http:\/\/127.0.0.1:8093\/admin\/teachers"}', '2025-04-09 15:01:10', '2025-04-09 15:01:10');
INSERT INTO "public"."admin_operation_log" VALUES (176, 1, 'admin/teachers', 'GET', '172.21.0.1', '[]', '2025-04-09 15:01:10', '2025-04-09 15:01:10');
INSERT INTO "public"."admin_operation_log" VALUES (177, 1, 'admin/teachers', 'GET', '172.21.0.1', '[]', '2025-04-09 15:01:12', '2025-04-09 15:01:12');
INSERT INTO "public"."admin_operation_log" VALUES (178, 1, 'admin/teachers/2', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 15:01:14', '2025-04-09 15:01:14');
INSERT INTO "public"."admin_operation_log" VALUES (179, 1, 'admin/teachers/2/edit', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 15:01:32', '2025-04-09 15:01:32');
INSERT INTO "public"."admin_operation_log" VALUES (180, 1, 'admin/teachers/2/edit', 'GET', '172.21.0.1', '[]', '2025-04-09 15:01:51', '2025-04-09 15:01:51');
INSERT INTO "public"."admin_operation_log" VALUES (181, 1, 'admin/teachers/2/edit', 'GET', '172.21.0.1', '[]', '2025-04-09 15:01:52', '2025-04-09 15:01:52');
INSERT INTO "public"."admin_operation_log" VALUES (182, 1, 'admin/teachers/2', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 15:01:53', '2025-04-09 15:01:53');
INSERT INTO "public"."admin_operation_log" VALUES (183, 1, 'admin/teachers', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 15:01:55', '2025-04-09 15:01:55');
INSERT INTO "public"."admin_operation_log" VALUES (184, 1, 'admin/teachers/2/edit', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 15:01:57', '2025-04-09 15:01:57');
INSERT INTO "public"."admin_operation_log" VALUES (185, 1, 'admin/teachers', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 15:02:38', '2025-04-09 15:02:38');
INSERT INTO "public"."admin_operation_log" VALUES (187, 1, 'admin/teachers/2', 'PUT', '172.21.0.1', '{"username":"vv","name":"\u5f20\u5e08","password":"$2y$10$SN3mLUfaKMjzdrtugxN0EOLWXN6kPHucBFrSI\/jUvtahUqW0PKvVG","password_confirmation":"$2y$10$SN3mLUfaKMjzdrtugxN0EOLWXN6kPHucBFrSI\/jUvtahUqW0PKvVG","_token":"O5AUuBUpo0sNOx546D61zxh5HFejG1827ifrfLaI","_method":"PUT","_previous_":"http:\/\/127.0.0.1:8093\/admin\/teachers"}', '2025-04-09 15:02:48', '2025-04-09 15:02:48');
INSERT INTO "public"."admin_operation_log" VALUES (188, 1, 'admin/teachers', 'GET', '172.21.0.1', '[]', '2025-04-09 15:02:48', '2025-04-09 15:02:48');
INSERT INTO "public"."admin_operation_log" VALUES (189, 1, 'admin/teachers/2/edit', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 15:02:51', '2025-04-09 15:02:51');
INSERT INTO "public"."admin_operation_log" VALUES (190, 1, 'admin/teachers/2/edit', 'GET', '172.21.0.1', '[]', '2025-04-09 15:03:03', '2025-04-09 15:03:03');
INSERT INTO "public"."admin_operation_log" VALUES (191, 1, 'admin/students', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 15:05:13', '2025-04-09 15:05:13');
INSERT INTO "public"."admin_operation_log" VALUES (192, 1, 'admin/teachers', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 15:05:16', '2025-04-09 15:05:16');
INSERT INTO "public"."admin_operation_log" VALUES (193, 1, 'admin/auth/users', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 15:05:30', '2025-04-09 15:05:30');
INSERT INTO "public"."admin_operation_log" VALUES (194, 1, 'admin/auth/users/1/edit', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 15:05:33', '2025-04-09 15:05:33');
INSERT INTO "public"."admin_operation_log" VALUES (195, 1, 'admin/auth/users/1', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 15:05:42', '2025-04-09 15:05:42');
INSERT INTO "public"."admin_operation_log" VALUES (196, 1, 'admin/auth/users', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 15:05:45', '2025-04-09 15:05:45');
INSERT INTO "public"."admin_operation_log" VALUES (197, 1, 'admin/auth/users/2/edit', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 15:05:50', '2025-04-09 15:05:50');
INSERT INTO "public"."admin_operation_log" VALUES (198, 1, 'admin/auth/users', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 15:05:52', '2025-04-09 15:05:52');
INSERT INTO "public"."admin_operation_log" VALUES (199, 1, 'admin/auth/users/2', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 15:05:54', '2025-04-09 15:05:54');
INSERT INTO "public"."admin_operation_log" VALUES (200, 1, 'admin/auth/users/2/edit', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 15:05:55', '2025-04-09 15:05:55');
INSERT INTO "public"."admin_operation_log" VALUES (201, 1, 'admin/auth/users', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 15:06:00', '2025-04-09 15:06:00');
INSERT INTO "public"."admin_operation_log" VALUES (202, 1, 'admin/auth/users/1/edit', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 15:06:18', '2025-04-09 15:06:18');
INSERT INTO "public"."admin_operation_log" VALUES (203, 1, 'admin/auth/users/1', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 15:06:23', '2025-04-09 15:06:23');
INSERT INTO "public"."admin_operation_log" VALUES (204, 1, 'admin/auth/users', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 15:06:25', '2025-04-09 15:06:25');
INSERT INTO "public"."admin_operation_log" VALUES (205, 1, 'admin/auth/users/1/edit', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 15:06:28', '2025-04-09 15:06:28');
INSERT INTO "public"."admin_operation_log" VALUES (206, 1, 'admin', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 15:06:47', '2025-04-09 15:06:47');
INSERT INTO "public"."admin_operation_log" VALUES (207, 1, 'admin/teachers', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 15:06:49', '2025-04-09 15:06:49');
INSERT INTO "public"."admin_operation_log" VALUES (208, 1, 'admin/teachers/2/edit', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 15:06:51', '2025-04-09 15:06:51');
INSERT INTO "public"."admin_operation_log" VALUES (209, 1, 'admin/teachers/2/edit', 'GET', '172.21.0.1', '[]', '2025-04-09 15:09:07', '2025-04-09 15:09:07');
INSERT INTO "public"."admin_operation_log" VALUES (210, 1, 'admin/teachers/2/edit', 'GET', '172.21.0.1', '[]', '2025-04-09 15:09:08', '2025-04-09 15:09:08');
INSERT INTO "public"."admin_operation_log" VALUES (211, 1, 'admin/teachers/2/edit', 'GET', '172.21.0.1', '[]', '2025-04-09 15:09:23', '2025-04-09 15:09:23');
INSERT INTO "public"."admin_operation_log" VALUES (212, 1, 'admin/teachers/2/edit', 'GET', '172.21.0.1', '[]', '2025-04-09 15:13:22', '2025-04-09 15:13:22');
INSERT INTO "public"."admin_operation_log" VALUES (213, 1, 'admin/teachers', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 15:13:32', '2025-04-09 15:13:32');
INSERT INTO "public"."admin_operation_log" VALUES (214, 1, 'admin/teachers/2/edit', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 15:13:34', '2025-04-09 15:13:34');
INSERT INTO "public"."admin_operation_log" VALUES (215, 1, 'admin/teachers/2', 'PUT', '172.21.0.1', '{"username":"vv","name":"\u5f20\u5e08","password":"$2y$10$SN3mLUfaKMjzdrtugxN0EOLWXN6kPHucBFrSI\/jUvtahUqW0PKvVG","password_confirmation":"$2y$10$SN3mLUfaKMjzdrtugxN0EOLWXN6kPHucBFrSI\/jUvtahUqW0PKvVG","_token":"O5AUuBUpo0sNOx546D61zxh5HFejG1827ifrfLaI","_method":"PUT","_previous_":"http:\/\/127.0.0.1:8093\/admin\/teachers"}', '2025-04-09 15:13:40', '2025-04-09 15:13:40');
INSERT INTO "public"."admin_operation_log" VALUES (216, 1, 'admin/teachers', 'GET', '172.21.0.1', '[]', '2025-04-09 15:13:40', '2025-04-09 15:13:40');
INSERT INTO "public"."admin_operation_log" VALUES (217, 1, 'admin/teachers/2', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 15:13:43', '2025-04-09 15:13:43');
INSERT INTO "public"."admin_operation_log" VALUES (218, 1, 'admin/teachers/2/edit', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 15:13:44', '2025-04-09 15:13:44');
INSERT INTO "public"."admin_operation_log" VALUES (219, 1, 'admin/teachers/2', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 15:14:00', '2025-04-09 15:14:00');
INSERT INTO "public"."admin_operation_log" VALUES (220, 1, 'admin/teachers/2', 'GET', '172.21.0.1', '[]', '2025-04-09 15:14:08', '2025-04-09 15:14:08');
INSERT INTO "public"."admin_operation_log" VALUES (221, 1, 'admin/teachers/2/edit', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 15:14:25', '2025-04-09 15:14:25');
INSERT INTO "public"."admin_operation_log" VALUES (222, 1, 'admin/teachers/2/edit', 'GET', '172.21.0.1', '[]', '2025-04-09 15:14:28', '2025-04-09 15:14:28');
INSERT INTO "public"."admin_operation_log" VALUES (223, 1, 'admin/teachers/2/edit', 'GET', '172.21.0.1', '[]', '2025-04-09 15:14:44', '2025-04-09 15:14:44');
INSERT INTO "public"."admin_operation_log" VALUES (224, 1, 'admin/teachers/2/edit', 'GET', '172.21.0.1', '[]', '2025-04-09 15:14:53', '2025-04-09 15:14:53');
INSERT INTO "public"."admin_operation_log" VALUES (225, 1, 'admin/teachers/2/edit', 'GET', '172.21.0.1', '[]', '2025-04-09 15:16:03', '2025-04-09 15:16:03');
INSERT INTO "public"."admin_operation_log" VALUES (226, 1, 'admin/teachers/2', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 15:16:05', '2025-04-09 15:16:05');
INSERT INTO "public"."admin_operation_log" VALUES (227, 1, 'admin/teachers/2', 'GET', '172.21.0.1', '[]', '2025-04-09 15:16:06', '2025-04-09 15:16:06');
INSERT INTO "public"."admin_operation_log" VALUES (228, 1, 'admin/teachers', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 15:16:06', '2025-04-09 15:16:06');
INSERT INTO "public"."admin_operation_log" VALUES (229, 1, 'admin/teachers', 'GET', '172.21.0.1', '[]', '2025-04-09 15:16:07', '2025-04-09 15:16:07');
INSERT INTO "public"."admin_operation_log" VALUES (230, 1, 'admin/teachers/2/edit', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 15:16:09', '2025-04-09 15:16:09');
INSERT INTO "public"."admin_operation_log" VALUES (231, 1, 'admin/teachers/2', 'PUT', '172.21.0.1', '{"username":"vv","name":"\u5f20\u5e08","password":"$2y$10$SN3mLUfaKMjzdrtugxN0EOLWXN6kPHucBFrSI\/jUvtahUqW0PKvVG","password_confirmation":"$2y$10$SN3mLUfaKMjzdrtugxN0EOLWXN6kPHucBFrSI\/jUvtahUqW0PKvVG","_token":"O5AUuBUpo0sNOx546D61zxh5HFejG1827ifrfLaI","_method":"PUT","_previous_":"http:\/\/127.0.0.1:8093\/admin\/teachers"}', '2025-04-09 15:16:27', '2025-04-09 15:16:27');
INSERT INTO "public"."admin_operation_log" VALUES (232, 1, 'admin/teachers', 'GET', '172.21.0.1', '[]', '2025-04-09 15:16:27', '2025-04-09 15:16:27');
INSERT INTO "public"."admin_operation_log" VALUES (233, 1, 'admin/teachers/2', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 15:16:30', '2025-04-09 15:16:30');
INSERT INTO "public"."admin_operation_log" VALUES (234, 1, 'admin/teachers', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 15:19:28', '2025-04-09 15:19:28');
INSERT INTO "public"."admin_operation_log" VALUES (235, 1, 'admin/teachers/create', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 15:19:30', '2025-04-09 15:19:30');
INSERT INTO "public"."admin_operation_log" VALUES (236, 1, 'admin/teachers', 'POST', '172.21.0.1', '{"username":"vetor","name":"\u5f20\u4e09","password":"xiaowei123","password_confirmation":"xiaowei123","_token":"O5AUuBUpo0sNOx546D61zxh5HFejG1827ifrfLaI","_previous_":"http:\/\/127.0.0.1:8093\/admin\/teachers"}', '2025-04-09 15:19:46', '2025-04-09 15:19:46');
INSERT INTO "public"."admin_operation_log" VALUES (237, 1, 'admin/teachers', 'GET', '172.21.0.1', '[]', '2025-04-09 15:19:46', '2025-04-09 15:19:46');
INSERT INTO "public"."admin_operation_log" VALUES (238, 1, 'admin/teachers/3', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 15:19:49', '2025-04-09 15:19:49');
INSERT INTO "public"."admin_operation_log" VALUES (239, 1, 'admin/teachers/3/edit', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 15:19:51', '2025-04-09 15:19:51');
INSERT INTO "public"."admin_operation_log" VALUES (240, 1, 'admin/teachers/3/edit', 'GET', '172.21.0.1', '[]', '2025-04-09 15:20:06', '2025-04-09 15:20:06');
INSERT INTO "public"."admin_operation_log" VALUES (241, 1, 'admin/teachers/3/edit', 'GET', '172.21.0.1', '[]', '2025-04-09 15:20:19', '2025-04-09 15:20:19');
INSERT INTO "public"."admin_operation_log" VALUES (242, 1, 'admin/teachers/3/edit', 'GET', '172.21.0.1', '[]', '2025-04-09 15:20:33', '2025-04-09 15:20:33');
INSERT INTO "public"."admin_operation_log" VALUES (243, 1, 'admin/teachers/3/edit', 'GET', '172.21.0.1', '[]', '2025-04-09 15:20:34', '2025-04-09 15:20:34');
INSERT INTO "public"."admin_operation_log" VALUES (244, 1, 'admin/teachers/3/edit', 'GET', '172.21.0.1', '[]', '2025-04-09 15:20:35', '2025-04-09 15:20:35');
INSERT INTO "public"."admin_operation_log" VALUES (245, 1, 'admin/teachers', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 15:21:11', '2025-04-09 15:21:11');
INSERT INTO "public"."admin_operation_log" VALUES (246, 1, 'admin/teachers/create', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 15:21:13', '2025-04-09 15:21:13');
INSERT INTO "public"."admin_operation_log" VALUES (247, 1, 'admin/teachers', 'POST', '172.21.0.1', '{"username":"vetor","name":"\u5f20\u4e09","password":"xiaowei123","password_confirmation":"xiaowei123","_token":"O5AUuBUpo0sNOx546D61zxh5HFejG1827ifrfLaI","_previous_":"http:\/\/127.0.0.1:8093\/admin\/teachers"}', '2025-04-09 15:21:27', '2025-04-09 15:21:27');
INSERT INTO "public"."admin_operation_log" VALUES (248, 1, 'admin/teachers', 'GET', '172.21.0.1', '[]', '2025-04-09 15:21:27', '2025-04-09 15:21:27');
INSERT INTO "public"."admin_operation_log" VALUES (249, 1, 'admin/teachers/4', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 15:21:30', '2025-04-09 15:21:30');
INSERT INTO "public"."admin_operation_log" VALUES (251, 1, 'admin/teachers/4', 'PUT', '172.21.0.1', '{"username":"vetor","name":"\u5f20\u4e09","password":"$2y$10$34mHu8kIGPe5D0GWaj2beuglS4VSWMn0iVYNpkikkt6EeTbhRvRf6","password_confirmation":"$2y$10$34mHu8kIGPe5D0GWaj2beuglS4VSWMn0iVYNpkikkt6EeTbhRvRf6","_token":"O5AUuBUpo0sNOx546D61zxh5HFejG1827ifrfLaI","_method":"PUT","_previous_":"http:\/\/127.0.0.1:8093\/admin\/teachers\/4"}', '2025-04-09 15:22:12', '2025-04-09 15:22:12');
INSERT INTO "public"."admin_operation_log" VALUES (252, 1, 'admin/teachers/4', 'GET', '172.21.0.1', '[]', '2025-04-09 15:22:12', '2025-04-09 15:22:12');
INSERT INTO "public"."admin_operation_log" VALUES (253, 1, 'admin/teachers', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 15:22:14', '2025-04-09 15:22:14');
INSERT INTO "public"."admin_operation_log" VALUES (254, 1, 'admin/teachers/4', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 15:22:16', '2025-04-09 15:22:16');
INSERT INTO "public"."admin_operation_log" VALUES (255, 1, 'admin/teachers/4/edit', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 15:22:17', '2025-04-09 15:22:17');
INSERT INTO "public"."admin_operation_log" VALUES (256, 1, 'admin/teachers/4/edit', 'GET', '172.21.0.1', '[]', '2025-04-09 15:22:19', '2025-04-09 15:22:19');
INSERT INTO "public"."admin_operation_log" VALUES (257, 1, 'admin/teachers/4/edit', 'GET', '172.21.0.1', '[]', '2025-04-09 15:22:23', '2025-04-09 15:22:23');
INSERT INTO "public"."admin_operation_log" VALUES (258, 1, 'admin/teachers', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 15:22:47', '2025-04-09 15:22:47');
INSERT INTO "public"."admin_operation_log" VALUES (259, 1, 'admin/teachers/create', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 15:22:48', '2025-04-09 15:22:48');
INSERT INTO "public"."admin_operation_log" VALUES (260, 1, 'admin/teachers', 'POST', '172.21.0.1', '{"username":"vetor","name":"\u5f20\u4e09","password":"xiaowei123","password_confirmation":"xiaowei123","_token":"O5AUuBUpo0sNOx546D61zxh5HFejG1827ifrfLaI","_previous_":"http:\/\/127.0.0.1:8093\/admin\/teachers"}', '2025-04-09 15:23:07', '2025-04-09 15:23:07');
INSERT INTO "public"."admin_operation_log" VALUES (261, 1, 'admin/teachers', 'GET', '172.21.0.1', '[]', '2025-04-09 15:23:07', '2025-04-09 15:23:07');
INSERT INTO "public"."admin_operation_log" VALUES (262, 1, 'admin/teachers/5', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 15:23:09', '2025-04-09 15:23:09');
INSERT INTO "public"."admin_operation_log" VALUES (263, 1, 'admin/teachers/5/edit', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 15:23:10', '2025-04-09 15:23:10');
INSERT INTO "public"."admin_operation_log" VALUES (264, 1, 'admin/teachers/5/edit', 'GET', '172.21.0.1', '[]', '2025-04-09 15:24:02', '2025-04-09 15:24:02');
INSERT INTO "public"."admin_operation_log" VALUES (265, 1, 'admin/teachers/5/edit', 'GET', '172.21.0.1', '[]', '2025-04-09 15:24:03', '2025-04-09 15:24:03');
INSERT INTO "public"."admin_operation_log" VALUES (266, 1, 'admin/teachers', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 15:24:05', '2025-04-09 15:24:05');
INSERT INTO "public"."admin_operation_log" VALUES (267, 1, 'admin/teachers/5', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 15:24:07', '2025-04-09 15:24:07');
INSERT INTO "public"."admin_operation_log" VALUES (268, 1, 'admin/teachers/5', 'GET', '172.21.0.1', '[]', '2025-04-09 15:24:09', '2025-04-09 15:24:09');
INSERT INTO "public"."admin_operation_log" VALUES (269, 1, 'admin/teachers/5', 'GET', '172.21.0.1', '[]', '2025-04-09 15:24:20', '2025-04-09 15:24:20');
INSERT INTO "public"."admin_operation_log" VALUES (270, 1, 'admin/teachers/5/edit', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 15:24:22', '2025-04-09 15:24:22');
INSERT INTO "public"."admin_operation_log" VALUES (271, 1, 'admin/teachers/5/edit', 'GET', '172.21.0.1', '[]', '2025-04-09 15:24:23', '2025-04-09 15:24:23');
INSERT INTO "public"."admin_operation_log" VALUES (272, 1, 'admin/teachers/5/edit', 'GET', '172.21.0.1', '[]', '2025-04-09 15:24:24', '2025-04-09 15:24:24');
INSERT INTO "public"."admin_operation_log" VALUES (273, 1, 'admin/teachers/5/edit', 'GET', '172.21.0.1', '[]', '2025-04-09 15:24:25', '2025-04-09 15:24:25');
INSERT INTO "public"."admin_operation_log" VALUES (274, 1, 'admin/teachers/5/edit', 'GET', '172.21.0.1', '[]', '2025-04-09 15:24:26', '2025-04-09 15:24:26');
INSERT INTO "public"."admin_operation_log" VALUES (275, 1, 'admin/teachers/5/edit', 'GET', '172.21.0.1', '[]', '2025-04-09 15:25:52', '2025-04-09 15:25:52');
INSERT INTO "public"."admin_operation_log" VALUES (276, 1, 'admin/teachers', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 15:26:37', '2025-04-09 15:26:37');
INSERT INTO "public"."admin_operation_log" VALUES (277, 1, 'admin/teachers/create', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 15:26:38', '2025-04-09 15:26:38');
INSERT INTO "public"."admin_operation_log" VALUES (278, 1, 'admin/teachers', 'POST', '172.21.0.1', '{"username":"vetor","name":"\u5f20\u4e09","password":"xiaowei123","password_confirmation":"xiaowei123","_token":"O5AUuBUpo0sNOx546D61zxh5HFejG1827ifrfLaI","_previous_":"http:\/\/127.0.0.1:8093\/admin\/teachers"}', '2025-04-09 15:26:52', '2025-04-09 15:26:52');
INSERT INTO "public"."admin_operation_log" VALUES (279, 1, 'admin/teachers', 'GET', '172.21.0.1', '[]', '2025-04-09 15:26:52', '2025-04-09 15:26:52');
INSERT INTO "public"."admin_operation_log" VALUES (280, 1, 'admin/teachers/6', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 15:26:55', '2025-04-09 15:26:55');
INSERT INTO "public"."admin_operation_log" VALUES (281, 1, 'admin/teachers/6/edit', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 15:26:56', '2025-04-09 15:26:56');
INSERT INTO "public"."admin_operation_log" VALUES (282, 1, 'admin/teachers', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 15:27:05', '2025-04-09 15:27:05');
INSERT INTO "public"."admin_operation_log" VALUES (283, 1, 'admin/teachers/6/edit', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 15:27:07', '2025-04-09 15:27:07');
INSERT INTO "public"."admin_operation_log" VALUES (284, 1, 'admin/teachers/6', 'PUT', '172.21.0.1', '{"username":"vetor","name":"\u5f20\u4e09","password":"$2y$10$CJO0KPIBl7IqTuoccJUdx.lx8YGT3CwqaiaT4.8Teu63vRkIwVmuu","password_confirmation":"$2y$10$CJO0KPIBl7IqTuoccJUdx.lx8YGT3CwqaiaT4.8Teu63vRkIwVmuu","_token":"O5AUuBUpo0sNOx546D61zxh5HFejG1827ifrfLaI","_method":"PUT","_previous_":"http:\/\/127.0.0.1:8093\/admin\/teachers"}', '2025-04-09 15:27:17', '2025-04-09 15:27:17');
INSERT INTO "public"."admin_operation_log" VALUES (285, 1, 'admin/teachers', 'GET', '172.21.0.1', '[]', '2025-04-09 15:27:17', '2025-04-09 15:27:17');
INSERT INTO "public"."admin_operation_log" VALUES (286, 1, 'admin/teachers/6', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 15:27:19', '2025-04-09 15:27:19');
INSERT INTO "public"."admin_operation_log" VALUES (287, 1, 'admin/teachers/6/edit', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 15:27:21', '2025-04-09 15:27:21');
INSERT INTO "public"."admin_operation_log" VALUES (288, 1, 'admin/auth/roles', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 15:28:20', '2025-04-09 15:28:20');
INSERT INTO "public"."admin_operation_log" VALUES (289, 1, 'admin/auth/roles/3/edit', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 15:29:20', '2025-04-09 15:29:20');
INSERT INTO "public"."admin_operation_log" VALUES (290, 1, 'admin/auth/roles/3', 'PUT', '172.21.0.1', '{"slug":"system-adminer","name":"\u7cfb\u7edf\u7ba1\u7406\u5458","permissions":["6",null],"_token":"O5AUuBUpo0sNOx546D61zxh5HFejG1827ifrfLaI","_method":"PUT","_previous_":"http:\/\/127.0.0.1:8093\/admin\/auth\/roles"}', '2025-04-09 15:29:24', '2025-04-09 15:29:24');
INSERT INTO "public"."admin_operation_log" VALUES (291, 1, 'admin/auth/roles', 'GET', '172.21.0.1', '[]', '2025-04-09 15:29:24', '2025-04-09 15:29:24');
INSERT INTO "public"."admin_operation_log" VALUES (292, 1, 'admin/auth/roles/2/edit', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 15:29:27', '2025-04-09 15:29:27');
INSERT INTO "public"."admin_operation_log" VALUES (293, 1, 'admin/auth/roles/2', 'PUT', '172.21.0.1', '{"slug":"teacher","name":"\u6559\u5e08","permissions":["7",null],"_token":"O5AUuBUpo0sNOx546D61zxh5HFejG1827ifrfLaI","_method":"PUT","_previous_":"http:\/\/127.0.0.1:8093\/admin\/auth\/roles"}', '2025-04-09 15:29:30', '2025-04-09 15:29:30');
INSERT INTO "public"."admin_operation_log" VALUES (294, 1, 'admin/auth/roles', 'GET', '172.21.0.1', '[]', '2025-04-09 15:29:30', '2025-04-09 15:29:30');
INSERT INTO "public"."admin_operation_log" VALUES (295, 1, 'admin/teachers', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 15:29:34', '2025-04-09 15:29:34');
INSERT INTO "public"."admin_operation_log" VALUES (296, 1, 'admin/auth/roles', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 15:29:42', '2025-04-09 15:29:42');
INSERT INTO "public"."admin_operation_log" VALUES (297, 1, 'admin/auth/roles/2/edit', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 15:29:45', '2025-04-09 15:29:45');
INSERT INTO "public"."admin_operation_log" VALUES (298, 1, 'admin/auth/roles/2', 'PUT', '172.21.0.1', '{"slug":"teacher","name":"\u6559\u5e08","permissions":["2","3","4","7",null],"_token":"O5AUuBUpo0sNOx546D61zxh5HFejG1827ifrfLaI","_method":"PUT","_previous_":"http:\/\/127.0.0.1:8093\/admin\/auth\/roles"}', '2025-04-09 15:29:58', '2025-04-09 15:29:58');
INSERT INTO "public"."admin_operation_log" VALUES (299, 1, 'admin/auth/roles', 'GET', '172.21.0.1', '[]', '2025-04-09 15:29:58', '2025-04-09 15:29:58');
INSERT INTO "public"."admin_operation_log" VALUES (300, 1, 'admin/auth/roles/3/edit', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 15:30:01', '2025-04-09 15:30:01');
INSERT INTO "public"."admin_operation_log" VALUES (301, 1, 'admin/auth/roles/3', 'PUT', '172.21.0.1', '{"slug":"system-adminer","name":"\u7cfb\u7edf\u7ba1\u7406\u5458","permissions":["2","3","4","6",null],"_token":"O5AUuBUpo0sNOx546D61zxh5HFejG1827ifrfLaI","_method":"PUT","_previous_":"http:\/\/127.0.0.1:8093\/admin\/auth\/roles"}', '2025-04-09 15:30:07', '2025-04-09 15:30:07');
INSERT INTO "public"."admin_operation_log" VALUES (302, 1, 'admin/auth/roles', 'GET', '172.21.0.1', '[]', '2025-04-09 15:30:07', '2025-04-09 15:30:07');
INSERT INTO "public"."admin_operation_log" VALUES (303, 1, 'admin/auth/users', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 15:30:11', '2025-04-09 15:30:11');
INSERT INTO "public"."admin_operation_log" VALUES (304, 1, 'admin/auth/users/create', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 15:30:14', '2025-04-09 15:30:14');
INSERT INTO "public"."admin_operation_log" VALUES (305, 1, 'admin/auth/users', 'POST', '172.21.0.1', '{"username":"xiguan1","name":"\u7cfb\u7ba11","password":"xiaowei123","password_confirmation":"xiaowei123","roles":["3",null],"permissions":[null],"_token":"O5AUuBUpo0sNOx546D61zxh5HFejG1827ifrfLaI","_previous_":"http:\/\/127.0.0.1:8093\/admin\/auth\/users"}', '2025-04-09 15:30:52', '2025-04-09 15:30:52');
INSERT INTO "public"."admin_operation_log" VALUES (306, 1, 'admin/auth/users', 'GET', '172.21.0.1', '[]', '2025-04-09 15:30:52', '2025-04-09 15:30:52');
INSERT INTO "public"."admin_operation_log" VALUES (308, 7, 'admin', 'GET', '172.21.0.1', '[]', '2025-04-09 15:31:05', '2025-04-09 15:31:05');
INSERT INTO "public"."admin_operation_log" VALUES (309, 7, 'admin/teachers', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 15:31:08', '2025-04-09 15:31:08');
INSERT INTO "public"."admin_operation_log" VALUES (310, 7, 'admin/students', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 15:31:10', '2025-04-09 15:31:10');
INSERT INTO "public"."admin_operation_log" VALUES (311, 7, 'admin', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 15:31:12', '2025-04-09 15:31:12');
INSERT INTO "public"."admin_operation_log" VALUES (312, 7, 'admin/auth/setting', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 15:31:20', '2025-04-09 15:31:20');
INSERT INTO "public"."admin_operation_log" VALUES (313, 7, 'admin/auth/logout', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 15:31:28', '2025-04-09 15:31:28');
INSERT INTO "public"."admin_operation_log" VALUES (314, 1, 'admin', 'GET', '172.21.0.1', '[]', '2025-04-09 15:31:32', '2025-04-09 15:31:32');
INSERT INTO "public"."admin_operation_log" VALUES (315, 1, 'admin/auth/menu', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 15:31:38', '2025-04-09 15:31:38');
INSERT INTO "public"."admin_operation_log" VALUES (316, 1, 'admin/auth/menu/8', 'DELETE', '172.21.0.1', '{"_method":"delete","_token":"qpVCYpBHpHaGIZCUWQFRBGcZFuvzdUqkjEyPWvTE"}', '2025-04-09 15:31:47', '2025-04-09 15:31:47');
INSERT INTO "public"."admin_operation_log" VALUES (317, 1, 'admin/auth/menu', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 15:31:47', '2025-04-09 15:31:47');
INSERT INTO "public"."admin_operation_log" VALUES (318, 1, 'admin/auth/menu', 'POST', '172.21.0.1', '{"parent_id":"0","title":"\u6559\u5e08\u7ba1\u7406","icon":"fa-user-secret","uri":"teachers","roles":[null],"permission":null,"_token":"qpVCYpBHpHaGIZCUWQFRBGcZFuvzdUqkjEyPWvTE"}', '2025-04-09 15:32:16', '2025-04-09 15:32:16');
INSERT INTO "public"."admin_operation_log" VALUES (319, 1, 'admin/auth/menu', 'GET', '172.21.0.1', '[]', '2025-04-09 15:32:16', '2025-04-09 15:32:16');
INSERT INTO "public"."admin_operation_log" VALUES (320, 1, 'admin/auth/menu', 'POST', '172.21.0.1', '{"parent_id":"0","title":"\u5b66\u751f\u7ba1\u7406","icon":"fa-user-md","uri":"students","roles":[null],"permission":null,"_token":"qpVCYpBHpHaGIZCUWQFRBGcZFuvzdUqkjEyPWvTE"}', '2025-04-09 15:32:52', '2025-04-09 15:32:52');
INSERT INTO "public"."admin_operation_log" VALUES (321, 1, 'admin/auth/menu', 'GET', '172.21.0.1', '[]', '2025-04-09 15:32:52', '2025-04-09 15:32:52');
INSERT INTO "public"."admin_operation_log" VALUES (322, 1, 'admin/auth/menu', 'POST', '172.21.0.1', '{"_token":"qpVCYpBHpHaGIZCUWQFRBGcZFuvzdUqkjEyPWvTE","_order":"[{\"id\":1},{\"id\":11},{\"id\":12},{\"id\":2,\"children\":[{\"id\":3},{\"id\":4},{\"id\":5},{\"id\":6},{\"id\":7}]}]"}', '2025-04-09 15:32:56', '2025-04-09 15:32:56');
INSERT INTO "public"."admin_operation_log" VALUES (323, 1, 'admin/auth/menu', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-09 15:32:56', '2025-04-09 15:32:56');
INSERT INTO "public"."admin_operation_log" VALUES (324, 1, 'admin/auth/menu', 'GET', '172.21.0.1', '[]', '2025-04-09 15:33:00', '2025-04-09 15:33:00');
INSERT INTO "public"."admin_operation_log" VALUES (325, 1, 'admin/auth/menu', 'GET', '172.21.0.1', '[]', '2025-04-09 15:33:39', '2025-04-09 15:33:39');
INSERT INTO "public"."admin_operation_log" VALUES (326, 1, 'admin/auth/menu', 'GET', '172.21.0.1', '[]', '2025-04-09 15:33:43', '2025-04-09 15:33:43');
INSERT INTO "public"."admin_operation_log" VALUES (327, 1, 'admin/auth/menu', 'GET', '172.21.0.1', '[]', '2025-04-09 15:33:57', '2025-04-09 15:33:57');
INSERT INTO "public"."admin_operation_log" VALUES (328, 1, 'admin/auth/menu', 'GET', '172.21.0.1', '[]', '2025-04-09 15:34:16', '2025-04-09 15:34:16');
INSERT INTO "public"."admin_operation_log" VALUES (329, 1, 'admin/auth/menu', 'GET', '172.21.0.1', '[]', '2025-04-09 15:34:29', '2025-04-09 15:34:29');
INSERT INTO "public"."admin_operation_log" VALUES (330, 1, 'admin/teachers', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-11 11:13:46', '2025-04-11 11:13:46');
INSERT INTO "public"."admin_operation_log" VALUES (331, 1, 'admin/teachers/6', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-11 11:13:49', '2025-04-11 11:13:49');
INSERT INTO "public"."admin_operation_log" VALUES (332, 1, 'admin/teachers/6', 'GET', '172.21.0.1', '[]', '2025-04-11 11:13:52', '2025-04-11 11:13:52');
INSERT INTO "public"."admin_operation_log" VALUES (333, 1, 'admin/teachers/6/edit', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-11 12:06:36', '2025-04-11 12:06:36');
INSERT INTO "public"."admin_operation_log" VALUES (334, 1, 'admin/teachers/6', 'PUT', '172.21.0.1', '{"username":"vetor","name":"\u5f20\u4e09","password":"$2y$10$CJO0KPIBl7IqTuoccJUdx.lx8YGT3CwqaiaT4.8Teu63vRkIwVmuu","password_confirmation":"$2y$10$CJO0KPIBl7IqTuoccJUdx.lx8YGT3CwqaiaT4.8Teu63vRkIwVmuu","role_type":"1","_token":"XFnbBMrUw28EvU38byBfQH6uMuBymMvbJ3wM5wHo","_method":"PUT","_previous_":"http:\/\/127.0.0.1:8093\/admin\/teachers\/6"}', '2025-04-11 12:06:38', '2025-04-11 12:06:38');
INSERT INTO "public"."admin_operation_log" VALUES (335, 1, 'admin/teachers/6/edit', 'GET', '172.21.0.1', '[]', '2025-04-11 12:06:38', '2025-04-11 12:06:38');
INSERT INTO "public"."admin_operation_log" VALUES (336, 1, 'admin/teachers/6', 'PUT', '172.21.0.1', '{"username":"vetor","name":"\u5f20\u4e09","password":"$2y$10$CJO0KPIBl7IqTuoccJUdx.lx8YGT3CwqaiaT4.8Teu63vRkIwVmuu","password_confirmation":"$2y$10$CJO0KPIBl7IqTuoccJUdx.lx8YGT3CwqaiaT4.8Teu63vRkIwVmuu","role_type":"1","_token":"XFnbBMrUw28EvU38byBfQH6uMuBymMvbJ3wM5wHo","_method":"PUT"}', '2025-04-11 12:08:38', '2025-04-11 12:08:38');
INSERT INTO "public"."admin_operation_log" VALUES (337, 1, 'admin/teachers', 'GET', '172.21.0.1', '[]', '2025-04-11 12:08:38', '2025-04-11 12:08:38');
INSERT INTO "public"."admin_operation_log" VALUES (338, 1, 'admin/teachers', 'GET', '172.21.0.1', '[]', '2025-04-11 12:10:24', '2025-04-11 12:10:24');
INSERT INTO "public"."admin_operation_log" VALUES (339, 1, 'admin/teachers', 'GET', '172.21.0.1', '[]', '2025-04-14 11:29:00', '2025-04-14 11:29:00');
INSERT INTO "public"."admin_operation_log" VALUES (340, 1, 'admin/teachers/create', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-14 11:29:02', '2025-04-14 11:29:02');
INSERT INTO "public"."admin_operation_log" VALUES (341, 1, 'admin/teachers', 'GET', '172.21.0.1', '{"_pjax":"#pjax-container"}', '2025-04-14 11:29:04', '2025-04-14 11:29:04');

-- ----------------------------
-- Table structure for admin_permissions
-- ----------------------------
DROP TABLE IF EXISTS "public"."admin_permissions";
CREATE TABLE "public"."admin_permissions" (
  "id" int4 NOT NULL DEFAULT nextval('admin_permissions_id_seq'::regclass),
  "name" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "slug" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "http_method" varchar(255) COLLATE "pg_catalog"."default",
  "http_path" text COLLATE "pg_catalog"."default",
  "created_at" timestamp(0),
  "updated_at" timestamp(0)
)
;

-- ----------------------------
-- Records of admin_permissions
-- ----------------------------
INSERT INTO "public"."admin_permissions" VALUES (1, 'All permission', '*', '', '*', NULL, NULL);
INSERT INTO "public"."admin_permissions" VALUES (2, 'Dashboard', 'dashboard', 'GET', '/', NULL, NULL);
INSERT INTO "public"."admin_permissions" VALUES (3, 'Login', 'auth.login', '', '/auth/login
/auth/logout', NULL, NULL);
INSERT INTO "public"."admin_permissions" VALUES (4, 'User setting', 'auth.setting', 'GET,PUT', '/auth/setting', NULL, NULL);
INSERT INTO "public"."admin_permissions" VALUES (5, 'Auth management', 'auth.management', '', '/auth/roles
/auth/permissions
/auth/menu
/auth/logs', NULL, NULL);
INSERT INTO "public"."admin_permissions" VALUES (6, '教师管理', 'teacher', '', '/teachers', '2025-04-09 11:20:23', '2025-04-09 11:20:33');
INSERT INTO "public"."admin_permissions" VALUES (7, '学生管理', 'student', '', '/students', '2025-04-09 11:21:02', '2025-04-09 11:21:02');

-- ----------------------------
-- Table structure for admin_role_menu
-- ----------------------------
DROP TABLE IF EXISTS "public"."admin_role_menu";
CREATE TABLE "public"."admin_role_menu" (
  "role_id" int4 NOT NULL,
  "menu_id" int4 NOT NULL,
  "created_at" timestamp(0),
  "updated_at" timestamp(0)
)
;

-- ----------------------------
-- Records of admin_role_menu
-- ----------------------------
INSERT INTO "public"."admin_role_menu" VALUES (1, 2, NULL, NULL);

-- ----------------------------
-- Table structure for admin_role_permissions
-- ----------------------------
DROP TABLE IF EXISTS "public"."admin_role_permissions";
CREATE TABLE "public"."admin_role_permissions" (
  "role_id" int4 NOT NULL,
  "permission_id" int4 NOT NULL,
  "created_at" timestamp(0),
  "updated_at" timestamp(0)
)
;

-- ----------------------------
-- Records of admin_role_permissions
-- ----------------------------
INSERT INTO "public"."admin_role_permissions" VALUES (1, 1, NULL, NULL);
INSERT INTO "public"."admin_role_permissions" VALUES (3, 6, NULL, NULL);
INSERT INTO "public"."admin_role_permissions" VALUES (2, 7, NULL, NULL);
INSERT INTO "public"."admin_role_permissions" VALUES (2, 2, NULL, NULL);
INSERT INTO "public"."admin_role_permissions" VALUES (2, 3, NULL, NULL);
INSERT INTO "public"."admin_role_permissions" VALUES (2, 4, NULL, NULL);
INSERT INTO "public"."admin_role_permissions" VALUES (3, 2, NULL, NULL);
INSERT INTO "public"."admin_role_permissions" VALUES (3, 3, NULL, NULL);
INSERT INTO "public"."admin_role_permissions" VALUES (3, 4, NULL, NULL);

-- ----------------------------
-- Table structure for admin_role_users
-- ----------------------------
DROP TABLE IF EXISTS "public"."admin_role_users";
CREATE TABLE "public"."admin_role_users" (
  "role_id" int4 NOT NULL,
  "user_id" int4 NOT NULL,
  "created_at" timestamp(0),
  "updated_at" timestamp(0)
)
;

-- ----------------------------
-- Records of admin_role_users
-- ----------------------------
INSERT INTO "public"."admin_role_users" VALUES (1, 1, NULL, NULL);
INSERT INTO "public"."admin_role_users" VALUES (2, 2, NULL, NULL);
INSERT INTO "public"."admin_role_users" VALUES (2, 3, NULL, NULL);
INSERT INTO "public"."admin_role_users" VALUES (2, 4, NULL, NULL);
INSERT INTO "public"."admin_role_users" VALUES (2, 5, NULL, NULL);
INSERT INTO "public"."admin_role_users" VALUES (2, 6, NULL, NULL);
INSERT INTO "public"."admin_role_users" VALUES (3, 7, NULL, NULL);

-- ----------------------------
-- Table structure for admin_roles
-- ----------------------------
DROP TABLE IF EXISTS "public"."admin_roles";
CREATE TABLE "public"."admin_roles" (
  "id" int4 NOT NULL DEFAULT nextval('admin_roles_id_seq'::regclass),
  "name" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "slug" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamp(0),
  "updated_at" timestamp(0)
)
;

-- ----------------------------
-- Records of admin_roles
-- ----------------------------
INSERT INTO "public"."admin_roles" VALUES (1, 'Administrator', 'administrator', '2025-04-08 06:55:01', '2025-04-08 06:55:01');
INSERT INTO "public"."admin_roles" VALUES (2, '教师', 'teacher', '2025-04-09 11:16:26', '2025-04-09 11:16:26');
INSERT INTO "public"."admin_roles" VALUES (3, '系统管理员', 'system-adminer', '2025-04-09 11:18:35', '2025-04-09 11:18:35');

-- ----------------------------
-- Table structure for admin_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS "public"."admin_user_permissions";
CREATE TABLE "public"."admin_user_permissions" (
  "user_id" int4 NOT NULL,
  "permission_id" int4 NOT NULL,
  "created_at" timestamp(0),
  "updated_at" timestamp(0)
)
;

-- ----------------------------
-- Records of admin_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for admin_users
-- ----------------------------
DROP TABLE IF EXISTS "public"."admin_users";
CREATE TABLE "public"."admin_users" (
  "id" int4 NOT NULL DEFAULT nextval('admin_users_id_seq'::regclass),
  "username" varchar(190) COLLATE "pg_catalog"."default" NOT NULL,
  "password" varchar(60) COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "avatar" varchar(255) COLLATE "pg_catalog"."default",
  "remember_token" varchar(100) COLLATE "pg_catalog"."default",
  "created_at" timestamp(0),
  "updated_at" timestamp(0),
  "role_type" int2 NOT NULL DEFAULT 0
)
;

-- ----------------------------
-- Records of admin_users
-- ----------------------------
INSERT INTO "public"."admin_users" VALUES (6, 'vetor', '$2y$10$CJO0KPIBl7IqTuoccJUdx.lx8YGT3CwqaiaT4.8Teu63vRkIwVmuu', '张三', 'images/b88dece5d6b71964c6c7172b10ef4928_v1.png', NULL, '2025-04-09 15:26:52', '2025-04-09 15:27:17', 1);
INSERT INTO "public"."admin_users" VALUES (7, 'xiguan1', '$2y$10$MKJvRiUGBC1pqXR5UAMEjeVinlBlF2bHVNgy/O51nYXxyvfO4NJOi', '系管1', 'images/d2bbe854-bf2b-4e2c-8c61-3a76405ae99d.jpg', 'NpaieMI3ny7VvcRrismHJnv9pqZirSk8RsM1cRRVaA4o0Ik8ju1UnxZLXeIX', '2025-04-09 15:30:52', '2025-04-09 15:30:52', 0);
INSERT INTO "public"."admin_users" VALUES (1, 'admin', '$2y$10$.2e.QRNaiQywKbJ1tz9eyuzGvk3bE2dLrKZUP7nA2q6PtJKFo.JC.', 'Administrator', NULL, 'OP97brMSYnCY15Udr6r15TV48ALxOFubSdEShgJe1PASoSdhcVThQQ7uu9yF', '2025-04-08 06:55:01', '2025-04-08 06:55:01', 0);

-- ----------------------------
-- Table structure for course_student
-- ----------------------------
DROP TABLE IF EXISTS "public"."course_student";
CREATE TABLE "public"."course_student" (
  "id" int4 NOT NULL DEFAULT nextval('course_student_id_seq'::regclass),
  "course_id" int4 NOT NULL,
  "student_id" int4 NOT NULL,
  "created_at" timestamp(0),
  "updated_at" timestamp(0)
)
;

-- ----------------------------
-- Records of course_student
-- ----------------------------
INSERT INTO "public"."course_student" VALUES (1, 1, 1, NULL, NULL);

-- ----------------------------
-- Table structure for courses
-- ----------------------------
DROP TABLE IF EXISTS "public"."courses";
CREATE TABLE "public"."courses" (
  "id" int4 NOT NULL DEFAULT nextval('courses_id_seq'::regclass),
  "teacher_id" int4 NOT NULL,
  "name" varchar(40) COLLATE "pg_catalog"."default" NOT NULL,
  "period" varchar(10) COLLATE "pg_catalog"."default" NOT NULL,
  "charge" numeric(10,2) NOT NULL,
  "description" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamp(0),
  "updated_at" timestamp(0),
  "deleted_at" timestamp(0)
)
;

-- ----------------------------
-- Records of courses
-- ----------------------------
INSERT INTO "public"."courses" VALUES (1, 1, '语文', '202310', 200.20, 'cccc', '2025-04-11 02:30:11', '2025-04-11 02:47:06', NULL);
INSERT INTO "public"."courses" VALUES (2, 1, '数学', '202310', 100.00, 'aaa', '2025-04-11 11:01:20', '2025-04-11 11:01:22', NULL);

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS "public"."failed_jobs";
CREATE TABLE "public"."failed_jobs" (
  "id" int8 NOT NULL DEFAULT nextval('failed_jobs_id_seq'::regclass),
  "uuid" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "connection" text COLLATE "pg_catalog"."default" NOT NULL,
  "queue" text COLLATE "pg_catalog"."default" NOT NULL,
  "payload" text COLLATE "pg_catalog"."default" NOT NULL,
  "exception" text COLLATE "pg_catalog"."default" NOT NULL,
  "failed_at" timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP
)
;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS "public"."migrations";
CREATE TABLE "public"."migrations" (
  "id" int4 NOT NULL DEFAULT nextval('migrations_id_seq'::regclass),
  "migration" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "batch" int4 NOT NULL
)
;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO "public"."migrations" VALUES (1, '2016_01_04_173148_create_admin_tables', 1);
INSERT INTO "public"."migrations" VALUES (5, '2014_10_12_000000_create_users_table', 2);
INSERT INTO "public"."migrations" VALUES (6, '2014_10_12_100000_create_password_resets_table', 2);
INSERT INTO "public"."migrations" VALUES (7, '2025_04_08_151238_create_teachers_table', 2);
INSERT INTO "public"."migrations" VALUES (8, '2025_04_08_151650_create_students_table', 2);
INSERT INTO "public"."migrations" VALUES (9, '2025_04_08_152713_create_courses_table', 2);
INSERT INTO "public"."migrations" VALUES (11, '2025_04_08_153706_create_course_student_table', 2);
INSERT INTO "public"."migrations" VALUES (12, '2014_10_12_100000_create_password_reset_tokens_table', 3);
INSERT INTO "public"."migrations" VALUES (13, '2019_08_19_000000_create_failed_jobs_table', 3);
INSERT INTO "public"."migrations" VALUES (14, '2019_12_14_000001_create_personal_access_tokens_table', 3);
INSERT INTO "public"."migrations" VALUES (15, '2016_06_01_000001_create_oauth_auth_codes_table', 4);
INSERT INTO "public"."migrations" VALUES (16, '2016_06_01_000002_create_oauth_access_tokens_table', 4);
INSERT INTO "public"."migrations" VALUES (17, '2016_06_01_000003_create_oauth_refresh_tokens_table', 4);
INSERT INTO "public"."migrations" VALUES (18, '2016_06_01_000004_create_oauth_clients_table', 4);
INSERT INTO "public"."migrations" VALUES (19, '2016_06_01_000005_create_oauth_personal_access_clients_table', 4);
INSERT INTO "public"."migrations" VALUES (20, '2025_04_11_152804_create_orders_table', 5);

-- ----------------------------
-- Table structure for oauth_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS "public"."oauth_access_tokens";
CREATE TABLE "public"."oauth_access_tokens" (
  "id" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "user_id" int8,
  "client_id" int8 NOT NULL,
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "scopes" text COLLATE "pg_catalog"."default",
  "revoked" bool NOT NULL,
  "created_at" timestamp(0),
  "updated_at" timestamp(0),
  "expires_at" timestamp(0)
)
;

-- ----------------------------
-- Records of oauth_access_tokens
-- ----------------------------
INSERT INTO "public"."oauth_access_tokens" VALUES ('e2c5695c5de5f0021a17f0b14302095f6ac3a9cbfea2c03b578d8210fa981a23df654d0ea4c756b6', 1, 5, NULL, '["teacher"]', 'f', '2025-04-11 01:40:52', '2025-04-11 01:40:52', '2026-04-11 01:40:52');
INSERT INTO "public"."oauth_access_tokens" VALUES ('8911d0de37a93d8592f9907842a394812a0fb86a64673c2ea9d71394861238a402170947e81e151b', 6, 5, NULL, '["teacher"]', 'f', '2025-04-11 07:43:49', '2025-04-11 07:43:49', '2026-04-11 07:43:49');

-- ----------------------------
-- Table structure for oauth_auth_codes
-- ----------------------------
DROP TABLE IF EXISTS "public"."oauth_auth_codes";
CREATE TABLE "public"."oauth_auth_codes" (
  "id" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "user_id" int8 NOT NULL,
  "client_id" int8 NOT NULL,
  "scopes" text COLLATE "pg_catalog"."default",
  "revoked" bool NOT NULL,
  "expires_at" timestamp(0)
)
;

-- ----------------------------
-- Records of oauth_auth_codes
-- ----------------------------

-- ----------------------------
-- Table structure for oauth_clients
-- ----------------------------
DROP TABLE IF EXISTS "public"."oauth_clients";
CREATE TABLE "public"."oauth_clients" (
  "id" int8 NOT NULL DEFAULT nextval('oauth_clients_id_seq'::regclass),
  "user_id" int8,
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "secret" varchar(100) COLLATE "pg_catalog"."default",
  "provider" varchar(255) COLLATE "pg_catalog"."default",
  "redirect" text COLLATE "pg_catalog"."default" NOT NULL,
  "personal_access_client" bool NOT NULL,
  "password_client" bool NOT NULL,
  "revoked" bool NOT NULL,
  "created_at" timestamp(0),
  "updated_at" timestamp(0)
)
;

-- ----------------------------
-- Records of oauth_clients
-- ----------------------------
INSERT INTO "public"."oauth_clients" VALUES (1, NULL, 'Laravel Personal Access Client', 'fKDHAWY9BUJxTncIPjZzP2DRLHzp71Tfx52wKEqL', NULL, 'http://localhost', 't', 'f', 'f', '2025-04-10 02:10:44', '2025-04-10 02:10:44');
INSERT INTO "public"."oauth_clients" VALUES (2, NULL, 'Laravel Password Grant Client', 'wo39HOhHuS0Mj9xmemmTWC95OQcc8E4QHeK8drMv', 'users', 'http://localhost', 'f', 't', 'f', '2025-04-10 02:10:44', '2025-04-10 02:10:44');
INSERT INTO "public"."oauth_clients" VALUES (3, NULL, 'Laravel Personal Access Client', 'ZoZ1GoDGU8a6HDNta6PK1pxRhcBeZeZPL0Ymq1Yv', NULL, 'http://localhost', 't', 'f', 'f', '2025-04-10 06:20:17', '2025-04-10 06:20:17');
INSERT INTO "public"."oauth_clients" VALUES (4, NULL, 'Laravel Password Grant Client', 'QMAWiJ6Tuvzym73esbhDoFar0OqeBtLRqJm0eCkQ', 'users', 'http://localhost', 'f', 't', 'f', '2025-04-10 06:20:17', '2025-04-10 06:20:17');
INSERT INTO "public"."oauth_clients" VALUES (5, NULL, 'passport-teacher', 'CUXshldRgnFKMiw9sPyD8vk1tiR4j9rTQJsGp7Q3', 'teachers', 'http://localhost', 'f', 't', 'f', '2025-04-10 07:54:23', '2025-04-10 07:54:23');
INSERT INTO "public"."oauth_clients" VALUES (6, NULL, 'passport-student', 'WB4n9aL2jDd76Y7OGsK9MuU4FKcpTc2Svnco2HZy', 'students', 'http://localhost', 'f', 't', 'f', '2025-04-10 07:55:56', '2025-04-10 07:55:56');
INSERT INTO "public"."oauth_clients" VALUES (7, NULL, 'Laravel Personal Access Client', 'gztlv1zFEh8uxwnKn7dkqaXoCCEpLNWcbkzHzrLt', NULL, 'http://localhost', 't', 'f', 'f', '2025-04-10 08:14:22', '2025-04-10 08:14:22');
INSERT INTO "public"."oauth_clients" VALUES (8, NULL, 'Laravel Password Grant Client', 'H2M4e8mjgFmn0Jpss8Jb6nGGEldFHYbjLe4p8lYU', 'users', 'http://localhost', 'f', 't', 'f', '2025-04-10 08:14:22', '2025-04-10 08:14:22');

-- ----------------------------
-- Table structure for oauth_personal_access_clients
-- ----------------------------
DROP TABLE IF EXISTS "public"."oauth_personal_access_clients";
CREATE TABLE "public"."oauth_personal_access_clients" (
  "id" int8 NOT NULL DEFAULT nextval('oauth_personal_access_clients_id_seq'::regclass),
  "client_id" int8 NOT NULL,
  "created_at" timestamp(0),
  "updated_at" timestamp(0)
)
;

-- ----------------------------
-- Records of oauth_personal_access_clients
-- ----------------------------
INSERT INTO "public"."oauth_personal_access_clients" VALUES (1, 1, '2025-04-10 02:10:44', '2025-04-10 02:10:44');
INSERT INTO "public"."oauth_personal_access_clients" VALUES (2, 3, '2025-04-10 06:20:17', '2025-04-10 06:20:17');
INSERT INTO "public"."oauth_personal_access_clients" VALUES (3, 7, '2025-04-10 08:14:22', '2025-04-10 08:14:22');

-- ----------------------------
-- Table structure for oauth_refresh_tokens
-- ----------------------------
DROP TABLE IF EXISTS "public"."oauth_refresh_tokens";
CREATE TABLE "public"."oauth_refresh_tokens" (
  "id" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "access_token_id" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "revoked" bool NOT NULL,
  "expires_at" timestamp(0)
)
;

-- ----------------------------
-- Records of oauth_refresh_tokens
-- ----------------------------
INSERT INTO "public"."oauth_refresh_tokens" VALUES ('b60d000bbaf217305cefe6161211793130d7df7f8acdeb522301ff16c4069d3eccf340f36c67cac5', 'e2c5695c5de5f0021a17f0b14302095f6ac3a9cbfea2c03b578d8210fa981a23df654d0ea4c756b6', 'f', '2026-04-11 01:40:52');
INSERT INTO "public"."oauth_refresh_tokens" VALUES ('c5c62f890532d3ef9de4f51e7a00cd27fbc3669a76e7cd91a9d0d49bdb57652b9e9df86492d3129e', '8911d0de37a93d8592f9907842a394812a0fb86a64673c2ea9d71394861238a402170947e81e151b', 'f', '2026-04-11 07:43:49');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS "public"."orders";
CREATE TABLE "public"."orders" (
  "id" int4 NOT NULL DEFAULT nextval('orders_id_seq'::regclass),
  "order_no" varchar(30) COLLATE "pg_catalog"."default" NOT NULL,
  "student_id" int4 NOT NULL,
  "teacher_id" int4 NOT NULL,
  "course_id" int4 NOT NULL,
  "amount" numeric(10,2) NOT NULL,
  "status" int2 NOT NULL DEFAULT '0'::smallint,
  "pay_status" int2 NOT NULL DEFAULT '0'::smallint,
  "pay_time" timestamp(0),
  "pay_info" json,
  "created_at" timestamp(0),
  "updated_at" timestamp(0)
)
;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO "public"."orders" VALUES (1, 'aaa', 1, 1, 1, 20.00, 0, 0, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for students
-- ----------------------------
DROP TABLE IF EXISTS "public"."students";
CREATE TABLE "public"."students" (
  "id" int4 NOT NULL DEFAULT nextval('students_id_seq'::regclass),
  "username" varchar(190) COLLATE "pg_catalog"."default" NOT NULL,
  "password" varchar(60) COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "avatar" varchar(255) COLLATE "pg_catalog"."default",
  "created_at" timestamp(0),
  "updated_at" timestamp(0)
)
;

-- ----------------------------
-- Records of students
-- ----------------------------
INSERT INTO "public"."students" VALUES (1, 'aa', '$2y$10$CJO0KPIBl7IqTuoccJUdx.lx8YGT3CwqaiaT4.8Teu63vRkIwVmuu', 'aaa', 'images/b88dece5d6b71964c6c7172b10ef4928_v1.png', '2025-04-11 11:08:52', '2025-04-11 11:08:54');

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."admin_menu_id_seq"
OWNED BY "public"."admin_menu"."id";
SELECT setval('"public"."admin_menu_id_seq"', 12, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."admin_operation_log_id_seq"
OWNED BY "public"."admin_operation_log"."id";
SELECT setval('"public"."admin_operation_log_id_seq"', 341, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."admin_permissions_id_seq"
OWNED BY "public"."admin_permissions"."id";
SELECT setval('"public"."admin_permissions_id_seq"', 7, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."admin_roles_id_seq"
OWNED BY "public"."admin_roles"."id";
SELECT setval('"public"."admin_roles_id_seq"', 3, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."admin_users_id_seq"
OWNED BY "public"."admin_users"."id";
SELECT setval('"public"."admin_users_id_seq"', 7, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."course_student_id_seq"
OWNED BY "public"."course_student"."id";
SELECT setval('"public"."course_student_id_seq"', 2, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."courses_id_seq"
OWNED BY "public"."courses"."id";
SELECT setval('"public"."courses_id_seq"', 2, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."failed_jobs_id_seq"
OWNED BY "public"."failed_jobs"."id";
SELECT setval('"public"."failed_jobs_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."migrations_id_seq"
OWNED BY "public"."migrations"."id";
SELECT setval('"public"."migrations_id_seq"', 20, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."oauth_clients_id_seq"
OWNED BY "public"."oauth_clients"."id";
SELECT setval('"public"."oauth_clients_id_seq"', 8, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."oauth_personal_access_clients_id_seq"
OWNED BY "public"."oauth_personal_access_clients"."id";
SELECT setval('"public"."oauth_personal_access_clients_id_seq"', 3, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."orders_id_seq"
OWNED BY "public"."orders"."id";
SELECT setval('"public"."orders_id_seq"', 1, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."students_id_seq"
OWNED BY "public"."students"."id";
SELECT setval('"public"."students_id_seq"', 1, true);

-- ----------------------------
-- Primary Key structure for table admin_menu
-- ----------------------------
ALTER TABLE "public"."admin_menu" ADD CONSTRAINT "admin_menu_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table admin_operation_log
-- ----------------------------
CREATE INDEX "admin_operation_log_user_id_index" ON "public"."admin_operation_log" USING btree (
  "user_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table admin_operation_log
-- ----------------------------
ALTER TABLE "public"."admin_operation_log" ADD CONSTRAINT "admin_operation_log_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Uniques structure for table admin_permissions
-- ----------------------------
ALTER TABLE "public"."admin_permissions" ADD CONSTRAINT "admin_permissions_name_unique" UNIQUE ("name");
ALTER TABLE "public"."admin_permissions" ADD CONSTRAINT "admin_permissions_slug_unique" UNIQUE ("slug");

-- ----------------------------
-- Primary Key structure for table admin_permissions
-- ----------------------------
ALTER TABLE "public"."admin_permissions" ADD CONSTRAINT "admin_permissions_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table admin_role_menu
-- ----------------------------
CREATE INDEX "admin_role_menu_role_id_menu_id_index" ON "public"."admin_role_menu" USING btree (
  "role_id" "pg_catalog"."int4_ops" ASC NULLS LAST,
  "menu_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Indexes structure for table admin_role_permissions
-- ----------------------------
CREATE INDEX "admin_role_permissions_role_id_permission_id_index" ON "public"."admin_role_permissions" USING btree (
  "role_id" "pg_catalog"."int4_ops" ASC NULLS LAST,
  "permission_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Indexes structure for table admin_role_users
-- ----------------------------
CREATE INDEX "admin_role_users_role_id_user_id_index" ON "public"."admin_role_users" USING btree (
  "role_id" "pg_catalog"."int4_ops" ASC NULLS LAST,
  "user_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Uniques structure for table admin_roles
-- ----------------------------
ALTER TABLE "public"."admin_roles" ADD CONSTRAINT "admin_roles_name_unique" UNIQUE ("name");
ALTER TABLE "public"."admin_roles" ADD CONSTRAINT "admin_roles_slug_unique" UNIQUE ("slug");

-- ----------------------------
-- Primary Key structure for table admin_roles
-- ----------------------------
ALTER TABLE "public"."admin_roles" ADD CONSTRAINT "admin_roles_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table admin_user_permissions
-- ----------------------------
CREATE INDEX "admin_user_permissions_user_id_permission_id_index" ON "public"."admin_user_permissions" USING btree (
  "user_id" "pg_catalog"."int4_ops" ASC NULLS LAST,
  "permission_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Uniques structure for table admin_users
-- ----------------------------
ALTER TABLE "public"."admin_users" ADD CONSTRAINT "admin_users_username_unique" UNIQUE ("username");

-- ----------------------------
-- Primary Key structure for table admin_users
-- ----------------------------
ALTER TABLE "public"."admin_users" ADD CONSTRAINT "admin_users_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table course_student
-- ----------------------------
CREATE INDEX "idx_course_id" ON "public"."course_student" USING btree (
  "course_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_student_id" ON "public"."course_student" USING btree (
  "student_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table course_student
-- ----------------------------
ALTER TABLE "public"."course_student" ADD CONSTRAINT "course_student_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table courses
-- ----------------------------
CREATE INDEX "courses_teacher_id_index" ON "public"."courses" USING btree (
  "teacher_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table courses
-- ----------------------------
ALTER TABLE "public"."courses" ADD CONSTRAINT "courses_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Uniques structure for table failed_jobs
-- ----------------------------
ALTER TABLE "public"."failed_jobs" ADD CONSTRAINT "failed_jobs_uuid_unique" UNIQUE ("uuid");

-- ----------------------------
-- Primary Key structure for table failed_jobs
-- ----------------------------
ALTER TABLE "public"."failed_jobs" ADD CONSTRAINT "failed_jobs_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table migrations
-- ----------------------------
ALTER TABLE "public"."migrations" ADD CONSTRAINT "migrations_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table oauth_access_tokens
-- ----------------------------
CREATE INDEX "oauth_access_tokens_user_id_index" ON "public"."oauth_access_tokens" USING btree (
  "user_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table oauth_access_tokens
-- ----------------------------
ALTER TABLE "public"."oauth_access_tokens" ADD CONSTRAINT "oauth_access_tokens_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table oauth_auth_codes
-- ----------------------------
CREATE INDEX "oauth_auth_codes_user_id_index" ON "public"."oauth_auth_codes" USING btree (
  "user_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table oauth_auth_codes
-- ----------------------------
ALTER TABLE "public"."oauth_auth_codes" ADD CONSTRAINT "oauth_auth_codes_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table oauth_clients
-- ----------------------------
CREATE INDEX "oauth_clients_user_id_index" ON "public"."oauth_clients" USING btree (
  "user_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table oauth_clients
-- ----------------------------
ALTER TABLE "public"."oauth_clients" ADD CONSTRAINT "oauth_clients_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table oauth_personal_access_clients
-- ----------------------------
ALTER TABLE "public"."oauth_personal_access_clients" ADD CONSTRAINT "oauth_personal_access_clients_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table oauth_refresh_tokens
-- ----------------------------
CREATE INDEX "oauth_refresh_tokens_access_token_id_index" ON "public"."oauth_refresh_tokens" USING btree (
  "access_token_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table oauth_refresh_tokens
-- ----------------------------
ALTER TABLE "public"."oauth_refresh_tokens" ADD CONSTRAINT "oauth_refresh_tokens_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table orders
-- ----------------------------
CREATE INDEX "orders_course_id_index" ON "public"."orders" USING btree (
  "course_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "orders_student_id_index" ON "public"."orders" USING btree (
  "student_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "orders_teacher_id_index" ON "public"."orders" USING btree (
  "teacher_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Uniques structure for table orders
-- ----------------------------
ALTER TABLE "public"."orders" ADD CONSTRAINT "orders_student_id_course_id_unique" UNIQUE ("student_id", "course_id");
ALTER TABLE "public"."orders" ADD CONSTRAINT "orders_order_no_unique" UNIQUE ("order_no");

-- ----------------------------
-- Primary Key structure for table orders
-- ----------------------------
ALTER TABLE "public"."orders" ADD CONSTRAINT "orders_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Uniques structure for table students
-- ----------------------------
ALTER TABLE "public"."students" ADD CONSTRAINT "students_username_unique" UNIQUE ("username");

-- ----------------------------
-- Primary Key structure for table students
-- ----------------------------
ALTER TABLE "public"."students" ADD CONSTRAINT "students_pkey" PRIMARY KEY ("id");
