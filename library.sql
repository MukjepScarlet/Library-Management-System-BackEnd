/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80035
 Source Host           : localhost:3306
 Source Schema         : library

 Target Server Type    : MySQL
 Target Server Version : 80035
 File Encoding         : 65001

 Date: 01/07/2024 19:00:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for book_label
-- ----------------------------
DROP TABLE IF EXISTS `book_label`;
CREATE TABLE `book_label`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `ISBN` char(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `label_id` bigint(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ISBN`(`ISBN`) USING BTREE,
  INDEX `label_id`(`label_id`) USING BTREE,
  CONSTRAINT `book_label_ibfk_1` FOREIGN KEY (`ISBN`) REFERENCES `books` (`ISBN`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `book_label_ibfk_2` FOREIGN KEY (`label_id`) REFERENCES `labels` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book_label
-- ----------------------------
INSERT INTO `book_label` VALUES (1, '9787040406641', 1);
INSERT INTO `book_label` VALUES (2, '9787111269298', 1);
INSERT INTO `book_label` VALUES (3, '9787020024759', 2);
INSERT INTO `book_label` VALUES (4, '9787020025862', 2);
INSERT INTO `book_label` VALUES (5, '9787208062153', 2);
INSERT INTO `book_label` VALUES (6, '9787101001105', 2);
INSERT INTO `book_label` VALUES (7, '9787806859988', 3);
INSERT INTO `book_label` VALUES (8, '9787020040179', 3);

-- ----------------------------
-- Table structure for books
-- ----------------------------
DROP TABLE IF EXISTS `books`;
CREATE TABLE `books`  (
  `ISBN` char(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `author` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `press` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `price` decimal(10, 2) NULL,
  `num` int(0) NOT NULL DEFAULT 0,
  `position` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`ISBN`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of books
-- ----------------------------
INSERT INTO `books` VALUES ('9787010009148', '毛泽东选集 第一卷', '毛泽东', '人民出版社', 40.00, 5, 'A5', '2024-06-30');
INSERT INTO `books` VALUES ('9787020002207', '红楼梦', '[清] 曹雪芹 著 / 高鹗', '人民文学出版社', 59.70, 18, 'A1', '2024-06-30');
INSERT INTO `books` VALUES ('9787020008728', '三国演义（全二册）', '[明] 罗贯中', '人民文学出版社', 39.50, 5, 'A1', '2024-06-30');
INSERT INTO `books` VALUES ('9787020008735', '西游记（全二册）', '吴承恩 / 校注 黄肃秋 ', '人民文学出版社 译者: 黄肃秋 注释', 47.20, 7, 'A4', '2024-06-30');
INSERT INTO `books` VALUES ('9787020008742', '水浒传（全二册）', '罗贯中 / 施耐庵', '人民文学出版社', 50.60, 12, 'A3', '2024-06-30');
INSERT INTO `books` VALUES ('9787020017164', '悲惨世界（上中下）', '[法] 雨果', '人民文学出版社 原作名: Les Misérables 译者: 李丹 / 方于', 66.00, 1, 'A3', '2024-06-30');
INSERT INTO `books` VALUES ('9787020017713', '安徒生童话故事集', '（丹麦）安徒生', '人民文学出版社 译者: 叶君健', 25.00, 18, 'A5', '2024-06-30');
INSERT INTO `books` VALUES ('9787020018567', '雷雨', '曹禺', '人民文学出版社', 0.00, 5, 'A3', '2024-06-30');
INSERT INTO `books` VALUES ('9787020024759', '围城', '钱锺书', '人民文学出版社', 0.00, 5, 'A4', '2024-06-30');
INSERT INTO `books` VALUES ('9787020025862', '顾城的诗', '顾城', '人民文学出版社', 0.00, 8, 'A3', '2024-06-30');
INSERT INTO `books` VALUES ('9787020026456', '海子的诗', '海子', '人民文学出版社', 0.00, 7, 'A8', '2024-06-30');
INSERT INTO `books` VALUES ('9787020028115', '骆驼祥子', '老舍', '人民文学出版社', 12.00, 1, 'A8', '2024-06-30');
INSERT INTO `books` VALUES ('9787020028313', '浮生六记', '（清）沈复', '人民文学出版社', 0.00, 11, 'A6', '2024-06-30');
INSERT INTO `books` VALUES ('9787020028504', '霸王别姬', '李碧华', '人民文学出版社', 10.20, 15, 'A9', '2024-06-30');
INSERT INTO `books` VALUES ('9787020034109', '少年凯歌', '陈凯歌', '人民文学出版社', 10.00, 11, 'A2', '2024-06-30');
INSERT INTO `books` VALUES ('9787020035946', '哈姆莱特', '[英] 莎士比亚', '人民文学出版社 原作名: Hamlet 译者: 朱生豪', 7.00, 9, 'A3', '2024-06-30');
INSERT INTO `books` VALUES ('9787020036509', '茶馆', '老舍', '人民文学出版社', 9.80, 1, 'A7', '2024-06-30');
INSERT INTO `books` VALUES ('9787020040179', '傲慢与偏见', '[英] 奥斯丁', '人民文学出版社 原作名: Pride and Prejudice 译者: 张扬', 13.00, 13, 'A8', '2024-06-30');
INSERT INTO `books` VALUES ('9787020042494', '小王子', '[法] 圣埃克苏佩里 / [法国] 安东尼·德·圣-埃克苏佩里', '人民文学出版社 原作名: Le Petit Prince 译者: 马振骋', 22.00, 9, 'A4', '2024-06-30');
INSERT INTO `books` VALUES ('9787020049295', '平凡的世界（全三部）', '路遥', '人民文学出版社', 64.00, 11, 'A9', '2024-06-30');
INSERT INTO `books` VALUES ('9787020058358', '坟', '鲁迅', '人民文学出版社', 16.00, 13, 'A6', '2024-06-30');
INSERT INTO `books` VALUES ('9787020090297', '白鹿原', '陈忠实', '人民文学出版社 副标题: 20周年精装典藏版', 39.00, 2, 'A8', '2024-06-30');
INSERT INTO `books` VALUES ('9787020139590', '额尔古纳河右岸', '迟子建', '人民文学出版社', 32.00, 6, 'A8', '2024-06-30');
INSERT INTO `books` VALUES ('9787040406641', '数据库系统概论', '王珊', '高等教育出版社', 55.00, 5, '东五', '2024-06-30');
INSERT INTO `books` VALUES ('9787100017565', '理想国', '[古希腊] 柏拉图', '商务印书馆 原作名: Πολιτεία 译者: 郭斌和 / 张竹明', 28.00, 3, 'A4', '2024-06-30');
INSERT INTO `books` VALUES ('9787100017664', '國史大綱（上下）', '錢穆', '商务印书馆', 76.00, 16, 'A3', '2024-06-30');
INSERT INTO `books` VALUES ('9787100094016', '会饮篇', '[古希腊] 柏拉图', '商务印书馆 原作名: Συμπόσιον 译者: 王太庆', 12.00, 7, 'A3', '2024-06-30');
INSERT INTO `books` VALUES ('9787101000290', '古文观止', '吴楚材 / 吴调侯', '中华书局', 21.00, 18, 'A5', '2024-06-30');
INSERT INTO `books` VALUES ('9787101001105', '唐诗三百首', '蘅塘退士 / 陈婉俊', '中华书局', 0.00, 13, 'A8', '2024-06-30');
INSERT INTO `books` VALUES ('9787101003048', '史记（全十册）', '司马迁 / 张守节', '中华书局 副标题: （全十册） 译者: （索隐）司马贞，（正义）张守节', 0.00, 1, 'A7', '2024-06-30');
INSERT INTO `books` VALUES ('9787101055207', '庄子', '孙通海 译注', '中华书局 译者: 孙通海 译注', 20.00, 13, 'A7', '2024-06-30');
INSERT INTO `books` VALUES ('9787108006639', '笑傲江湖（全四册）', '金庸', '生活·读书·新知三联书店', 76.80, 9, 'A6', '2024-06-30');
INSERT INTO `books` VALUES ('9787108006721', '天龙八部', '金庸', '生活·读书·新知三联书店', 96.00, 14, 'A6', '2024-06-30');
INSERT INTO `books` VALUES ('9787108009821', '万历十五年', '[美] 黄仁宇', '生活·读书·新知三联书店', 18.00, 9, 'A7', '2024-06-30');
INSERT INTO `books` VALUES ('9787108010186', '历史深处的忧虑', '林达 / 李晓林', '生活·读书·新知三联书店 副标题: 近距离看美国之一', 19.00, 5, 'A1', '2024-06-30');
INSERT INTO `books` VALUES ('9787108012586', '射雕英雄传', '金庸', '生活·读书·新知三联书店', 47.00, 7, 'A2', '2024-06-30');
INSERT INTO `books` VALUES ('9787108012692', '倚天屠龙记', '金庸', '生活·读书·新知三联书店', 0.00, 1, 'A8', '2024-06-30');
INSERT INTO `books` VALUES ('9787108012715', '我也有一个梦想', '林达 / 李晓林', '生活·读书·新知三联书店 副标题: 近距离看美国之三', 25.00, 15, 'A2', '2024-06-30');
INSERT INTO `books` VALUES ('9787108015280', '中国历代政治得失', '钱穆', '生活·读书·新知三联书店', 12.00, 9, 'A6', '2024-06-30');
INSERT INTO `books` VALUES ('9787108018809', '我们仨', '杨绛', '生活·读书·新知三联书店', 18.80, 7, 'A1', '2024-06-30');
INSERT INTO `books` VALUES ('9787108025104', '上学记', '何兆武 / 文靖', '生活·读书·新知三联书店', 19.80, 10, 'A4', '2024-06-30');
INSERT INTO `books` VALUES ('9787108030375', '美的历程', '李泽厚', '生活·读书·新知三联书店', 43.00, 17, 'A9', '2024-06-30');
INSERT INTO `books` VALUES ('9787108032911', '目送', '龙应台', '生活·读书·新知三联书店', 39.00, 18, 'A2', '2024-06-30');
INSERT INTO `books` VALUES ('9787108033635', '孩子你慢慢来', '龙应台', '生活·读书·新知三联书店', 28.00, 10, 'A9', '2024-06-30');
INSERT INTO `books` VALUES ('9787108050656', '天朝的崩溃', '茅海建', '生活·读书·新知三联书店 副标题: 鸦片战争再研究（修订版）', 59.00, 4, 'A4', '2024-06-30');
INSERT INTO `books` VALUES ('9787111126768', '经济学原理（上下）', '[美国] 格里高里·曼昆', '机械工业出版社 译者: 梁小民', 88.00, 9, 'A7', '2024-06-30');
INSERT INTO `books` VALUES ('9787111269298', '编译原理', 'Alfred V. Aho', '机械工业出版社', 55.00, 3, '西二', '2024-06-30');
INSERT INTO `books` VALUES ('9787115138804', '社会心理学', '[美] 戴维·迈尔斯', '人民邮电出版社 副标题: （第8版） 译者: 张智勇 / 乐国安 / 侯玉波 等', 68.00, 8, 'A1', '2024-06-30');
INSERT INTO `books` VALUES ('9787121139512', '浪潮之巅', '吴军', '电子工业出版社 出品方: Just-pub', 55.00, 5, 'A6', '2024-06-30');
INSERT INTO `books` VALUES ('9787122346032', '克莱因壶', '[日] 冈岛二人', '化学工业出版社 出品方: 悦读名品 原作名: クラインの壷 译者: 张舟', 48.00, 9, 'A9', '2024-06-30');
INSERT INTO `books` VALUES ('9787200065039', '诗经', '孔丘', '北京出版社', 19.90, 17, 'A4', '2024-06-30');
INSERT INTO `books` VALUES ('9787201048161', '情书', '[日本] 岩井俊二', '天津人民出版社 出品方: 新经典文化 原作名: ラヴレター 译者: 穆晓芳', 18.00, 12, 'A2', '2024-06-30');
INSERT INTO `books` VALUES ('9787208062153', '乡土中国', '费孝通', '上海人民出版社', 0.00, 9, 'A3', '2024-06-30');
INSERT INTO `books` VALUES ('9787208081178', '人生的智慧', '(德)叔本华', '上海人民出版社 译者: 韦启昌', 28.00, 17, 'A7', '2024-06-30');
INSERT INTO `books` VALUES ('9787208130500', '斯通纳', '[美] 约翰·威廉斯', '上海人民出版社 出品方: 世纪文景 原作名: Stoner 译者: 杨向荣', 49.00, 13, 'A5', '2024-06-30');
INSERT INTO `books` VALUES ('9787208171336', '置身事内', '兰小欢', '上海人民出版社 出品方: 世纪文景 副标题: 中国政府与经济发展', 65.00, 7, 'A3', '2024-06-30');
INSERT INTO `books` VALUES ('9787222065413', '我的阿勒泰', '李娟', '云南人民出版社 出品方: 英特颂 原作名: My Altay', 25.00, 20, 'A8', '2024-06-30');
INSERT INTO `books` VALUES ('9787224034813', '道德经', '黄元吉', '陕西人民出版社', 4.50, 12, 'A8', '2024-06-30');
INSERT INTO `books` VALUES ('9787229042066', '三体全集', '刘慈欣', '重庆出版社 出品方: 科幻世界 副标题: 地球往事三部曲', 168.00, 2, 'A5', '2024-06-30');
INSERT INTO `books` VALUES ('9787301204351', '东晋门阀政治', '田余庆', '北京大学出版社', 49.00, 2, 'A7', '2024-06-30');
INSERT INTO `books` VALUES ('9787301257517', '李光耀观天下', '李光耀', '北京大学出版社 原作名: One Man\'s View of the World', 58.00, 19, 'A1', '2024-06-30');
INSERT INTO `books` VALUES ('9787500627098', '沉默的大多数', '王小波', '中国青年出版社 副标题: 王小波杂文随笔全编', 27.00, 8, 'A5', '2024-06-30');
INSERT INTO `books` VALUES ('9787500652045', '城南旧事', '林海音 文 / 关维兴 图', '中国青年出版社 副标题: 纪念普及版', 16.00, 8, 'A4', '2024-06-30');
INSERT INTO `books` VALUES ('9787503311864', '亮剑', '都梁', '解放军文艺出版社', 28.00, 3, 'A8', '2024-06-30');
INSERT INTO `books` VALUES ('9787506287081', '认识电影', '[美] 路易斯·贾内梯 / [瑞典] 英格玛·伯格曼 [日] 黑泽明 等供图', '世界图书出版公司 出品方: 后浪 副标题: 插图第11版 译者: 焦雄屏', 68.00, 19, 'A1', '2024-06-30');
INSERT INTO `books` VALUES ('9787506341271', '苏菲的世界', '[挪威] 乔斯坦·贾德', '作家出版社 原作名: Sofies verden 译者: 萧宝森', 26.00, 20, 'A3', '2024-06-30');
INSERT INTO `books` VALUES ('9787506360876', '陆犯焉识', '严歌苓', '作家出版社', 35.00, 6, 'A1', '2024-06-30');
INSERT INTO `books` VALUES ('9787506365437', '活着', '余华', '作家出版社', 20.00, 1, 'A2', '2024-06-30');
INSERT INTO `books` VALUES ('9787506365604', '在细雨中呼喊', '余华', '作家出版社', 25.00, 7, 'A7', '2024-06-30');
INSERT INTO `books` VALUES ('9787506365680', '许三观卖血记', '余华', '作家出版社', 24.00, 13, 'A7', '2024-06-30');
INSERT INTO `books` VALUES ('9787508607719', '激荡三十年（上）', '吴晓波', '中信出版社 浙江人民出版社 副标题: 中国企业1978-2008', 0.00, 4, 'A8', '2024-06-30');
INSERT INTO `books` VALUES ('9787508653389', '南京大屠杀', '[美]张纯如（Iris Chang）', '中信出版社 副标题: 第二次世界大战中被遗忘的大浩劫 译者: 谭春霞 / 焦国林', 49.00, 20, 'A5', '2024-06-30');
INSERT INTO `books` VALUES ('9787508658346', '二手时间', '[白俄] S. A. 阿列克谢耶维奇', '中信出版社 原作名: Время секонд хэнд 译者: 吕宁思', 55.00, 10, 'A8', '2024-06-30');
INSERT INTO `books` VALUES ('9787509763247', '筚路维艰', '萧冬连', '社会科学文献出版社 副标题: 中国社会主义路径的五次选择', 45.00, 12, 'A3', '2024-06-30');
INSERT INTO `books` VALUES ('9787510407109', '你好，旧时光（上 下）', '八月长安', '新世界出版社 出品方: 新华先锋 原作名: 玛丽苏病例报告', 39.80, 16, 'A2', '2024-06-30');
INSERT INTO `books` VALUES ('9787513305662', '冬牧场', '李娟', '新星出版社 出品方: 新经典文化', 29.80, 5, 'A7', '2024-06-30');
INSERT INTO `books` VALUES ('9787513342919', '刘擎西方现代思想讲义', '刘擎', '新星出版社', 79.00, 15, 'A8', '2024-06-30');
INSERT INTO `books` VALUES ('9787516835265', '明亮的夜晚', '[韩]崔恩荣', '台海出版社 出品方: 磨铁·大鱼读品 原作名: 밝은 밤 译者: 叶蕾', 0.00, 3, 'A3', '2024-06-30');
INSERT INTO `books` VALUES ('9787530208915', '温柔的夜', '三毛', '北京十月文艺出版社 出品方: 青马文化', 28.00, 12, 'A2', '2024-06-30');
INSERT INTO `books` VALUES ('9787530208922', '梦里花落知多少', '三毛', '北京十月文艺出版社 出品方: 青马文化', 28.00, 3, 'A4', '2024-06-30');
INSERT INTO `books` VALUES ('9787530208960', '雨季不再来', '三毛', '北京十月文艺出版社 出品方: 青马文化', 28.00, 16, 'A8', '2024-06-30');
INSERT INTO `books` VALUES ('9787530209226', '四世同堂', '老舍', '北京十月文艺出版社 出品方: 十月文化', 36.00, 5, 'A5', '2024-06-30');
INSERT INTO `books` VALUES ('9787530211144', '半生缘', '张爱玲', '北京十月文艺出版社 出品方: 青马文化 副标题: 张爱玲全集04——小说', 29.60, 12, 'A7', '2024-06-30');
INSERT INTO `books` VALUES ('9787530211168', '倾城之恋', '张爱玲', '北京十月文艺出版社 出品方: 青马文化 副标题: 张爱玲全集01——小说', 29.80, 10, 'A9', '2024-06-30');
INSERT INTO `books` VALUES ('9787530221280', '流俗地', '【马来西亚】黎紫书', '北京十月文艺出版社 出品方: 十月文化', 55.00, 5, 'A8', '2024-06-30');
INSERT INTO `books` VALUES ('9787530640470', '呼兰河传', '萧红', '百花文艺出版社 副标题: 1947年版本・原版珍藏', 0.00, 18, 'A4', '2024-06-30');
INSERT INTO `books` VALUES ('9787531324362', '我与地坛', '史铁生', '春风文艺出版社 副标题: 史铁生代表作', 25.00, 18, 'A8', '2024-06-30');
INSERT INTO `books` VALUES ('9787532132256', '安娜·卡列尼娜', '[俄罗斯] 列夫·托尔斯泰', '上海文艺出版社 原作名: Anna karenina 译者: 草婴', 37.00, 2, 'A2', '2024-06-30');
INSERT INTO `books` VALUES ('9787532524808', '人间词话', '王国维', '上海古籍出版社', 9.80, 15, 'A6', '2024-06-30');
INSERT INTO `books` VALUES ('9787532544400', '孙子兵法', '孙武', '上海古籍出版社 译者: 郭化若', 20.00, 13, 'A1', '2024-06-30');
INSERT INTO `books` VALUES ('9787532741601', '象棋的故事', '[奥] 斯蒂芬·茨威格', '上海译文出版社 译者: 张玉书', 23.00, 2, 'A4', '2024-06-30');
INSERT INTO `books` VALUES ('9787532741854', '动物农场', '[英国] 乔治·奥威尔', '上海译文出版社 原作名: Animal Farm 译者: 荣如德', 10.00, 10, 'A8', '2024-06-30');
INSERT INTO `books` VALUES ('9787532741922', '刀锋', '[英]毛姆', '上海译文出版社 原作名: The Razor\'s Edge 译者: 周煦良', 18.00, 19, 'A7', '2024-06-30');
INSERT INTO `books` VALUES ('9787532744756', '罗生门', '[日] 芥川龙之介', '上海译文出版社 原作名: 羅生門 译者: 林少华', 12.00, 20, 'A7', '2024-06-30');
INSERT INTO `books` VALUES ('9787532744800', '荒原狼', '[德]赫尔曼·黑塞', '上海译文出版社 译者: 赵登荣 / 倪诚恩', 0.00, 14, 'A5', '2024-06-30');
INSERT INTO `books` VALUES ('9787532745159', '爱的艺术', '[美] 艾·弗洛姆', '上海译文出版社 出品方: 99读书人 译者: 李健鸣', 15.00, 13, 'A1', '2024-06-30');
INSERT INTO `books` VALUES ('9787532751471', '局外人', '[法] 阿尔贝·加缪', '上海译文出版社 原作名: L\'Etranger 译者: 柳鸣九', 22.00, 7, 'A7', '2024-06-30');
INSERT INTO `books` VALUES ('9787532751655', '不能承受的生命之轻', '米兰·昆德拉', '上海译文出版社 副标题: 中文全译本百万纪念版 译者: 许钧', 29.00, 20, 'A6', '2024-06-30');
INSERT INTO `books` VALUES ('9787532756728', '江城', '[美国] 彼得·海斯勒', '上海译文出版社 原作名: River Town 译者: 李雪顺', 36.00, 13, 'A6', '2024-06-30');
INSERT INTO `books` VALUES ('9787532761753', '鼠疫', '[法] 阿尔贝·加缪', '上海译文出版社 原作名: La Peste 译者: 刘方', 34.00, 14, 'A5', '2024-06-30');
INSERT INTO `books` VALUES ('9787532763696', '卡拉马佐夫兄弟', '[俄] 费奥多尔·陀思妥耶夫斯基', '上海译文出版社 原作名: БРАТЬЯ КАРАМАЗОВЫ 译者: 荣如德', 0.00, 6, 'A1', '2024-06-30');
INSERT INTO `books` VALUES ('9787533830953', '中国少年儿童百科全书（全四册）', '林崇德 主编', '浙江教育出版社', 168.00, 7, 'A2', '2024-06-30');
INSERT INTO `books` VALUES ('9787533946647', '檀香刑', '莫言', '浙江文艺出版社 出品方: KEY·可以文化', 56.00, 7, 'A6', '2024-06-30');
INSERT INTO `books` VALUES ('9787533966102', '生死疲劳', '莫言', '浙江文艺出版社 出品方: 读客文化', 0.00, 6, 'A4', '2024-06-30');
INSERT INTO `books` VALUES ('9787533969608', '命运', '蔡崇达', '浙江文艺出版社 / 广州出版社 出品方: 果麦文化', 59.80, 14, 'A7', '2024-06-30');
INSERT INTO `books` VALUES ('9787534618727', '草房子', '曹文轩', '江苏少年儿童出版社', 18.00, 4, 'A2', '2024-06-30');
INSERT INTO `books` VALUES ('9787535439765', '一句顶一万句', '刘震云', '长江文艺出版社 出品方: 长江新世纪', 0.00, 3, 'A3', '2024-06-30');
INSERT INTO `books` VALUES ('9787536025080', '黄金时代', '王小波', '花城出版社 副标题: 时代三部曲', 19.00, 1, 'A6', '2024-06-30');
INSERT INTO `books` VALUES ('9787536079113', '大明王朝1566', '刘和平', '花城出版社', 88.00, 18, 'A3', '2024-06-30');
INSERT INTO `books` VALUES ('9787536084469', '遥远的向日葵地', '李娟', '花城出版社', 38.00, 6, 'A1', '2024-06-30');
INSERT INTO `books` VALUES ('9787536455382', '球状闪电', '刘慈欣', '四川科学技术出版社 出品方: 科幻世界', 22.00, 1, 'A1', '2024-06-30');
INSERT INTO `books` VALUES ('9787537823425', '边城', '沈从文 / 黄永玉 卓雅 插图.', '北岳文艺出版社', 12.00, 2, 'A2', '2024-06-30');
INSERT INTO `books` VALUES ('9787538276374', '上帝掷骰子吗', '曹天元', '辽宁教育出版社 出品方: 磨铁图书 副标题: 量子物理史话', 32.00, 8, 'A2', '2024-06-30');
INSERT INTO `books` VALUES ('9787538725230', '绿毛水怪', '王小波', '时代文艺出版社', 30.00, 2, 'A5', '2024-06-30');
INSERT INTO `books` VALUES ('9787539921969', '人间草木', '汪曾祺', '江苏文艺出版社', 20.00, 16, 'A6', '2024-06-30');
INSERT INTO `books` VALUES ('9787539979359', '棋王·树王·孩子王', '阿城', '江苏凤凰文艺出版社 副标题: 阿城文集 之一', 0.00, 9, 'A9', '2024-06-30');
INSERT INTO `books` VALUES ('9787539983356', '银河帝国：基地七部曲', '[美] 艾萨克·阿西莫夫', '江苏凤凰文艺出版社 出品方: 读客文化 副标题: 百万册纪念版 译者: 叶李华', 328.00, 18, 'A5', '2024-06-30');
INSERT INTO `books` VALUES ('9787540462642', '最好的我们', '八月长安', '湖南文艺出版社 出品方: 博集天卷 原作名: 流水混账', 0.00, 19, 'A4', '2024-06-30');
INSERT INTO `books` VALUES ('9787540488475', '显微镜下的大明', '马伯庸', '湖南文艺出版社 出品方: 博集天卷', 52.00, 10, 'A7', '2024-06-30');
INSERT INTO `books` VALUES ('9787540701758', '受戒', '汪曾祺', '漓江出版社 副标题: 汪曾祺自选集', 3.95, 5, 'A9', '2024-06-30');
INSERT INTO `books` VALUES ('9787542631664', '送你一颗子弹', '刘瑜', '上海三联书店', 25.00, 12, 'A4', '2024-06-30');
INSERT INTO `books` VALUES ('9787542645715', '厌女', '上野千鹤子', '上海三联书店 副标题: 日本的女性嫌恶 原作名: 女ぎらい 译者: 王兰', 0.00, 9, 'A4', '2024-06-30');
INSERT INTO `books` VALUES ('9787544241694', '嫌疑人X的献身', '[日本] 东野圭吾', '南海出版公司 出品方: 新经典文化 原作名: 容疑者Xの献身 译者: 刘子倩', 0.00, 14, 'A3', '2024-06-30');
INSERT INTO `books` VALUES ('9787544258609', '白夜行', '[日] 东野圭吾', '南海出版公司 出品方: 新经典文化 原作名: 白夜行 译者: 刘姿君', 39.50, 19, 'A3', '2024-06-30');
INSERT INTO `books` VALUES ('9787544270878', '解忧杂货店', '[日] 东野圭吾', '南海出版公司 出品方: 新经典文化 原作名: ナミヤ雑貨店の奇蹟 译者: 李盈春', 39.50, 14, 'A2', '2024-06-30');
INSERT INTO `books` VALUES ('9787544285148', '恶意', '[日] 东野圭吾', '南海出版公司 出品方: 新经典文化 原作名: 悪意 译者: 娄美莲', 39.50, 13, 'A3', '2024-06-30');
INSERT INTO `books` VALUES ('9787544713986', '金色梦乡', '[日] 伊坂幸太郎', '译林出版社 原作名: ゴールデンスランバー 译者: 李彦桦', 35.00, 3, 'A2', '2024-06-30');
INSERT INTO `books` VALUES ('9787544717731', '这些人，那些事', '吴念真', '译林出版社', 28.00, 18, 'A4', '2024-06-30');
INSERT INTO `books` VALUES ('9787544722278', '看不见的城市', '[意] 伊塔洛·卡尔维诺', '译林出版社 原作名: Le città invisibili 译者: 张密', 25.00, 10, 'A5', '2024-06-30');
INSERT INTO `books` VALUES ('9787544722346', '分成两半的子爵', '[意] 伊塔洛·卡尔维诺', '译林出版社 原作名: Il visconte dimezzato 译者: 吴正仪', 20.00, 11, 'A5', '2024-06-30');
INSERT INTO `books` VALUES ('9787544722803', '树上的男爵', '[意大利]伊塔洛·卡尔维诺', '译林出版社 原作名: Il barone rampante 译者: 吴正仪', 30.00, 14, 'A8', '2024-06-30');
INSERT INTO `books` VALUES ('9787544728669', '毛姆短篇小说精选集', '[英] 威廉·萨默塞特·毛姆', '译林出版社 译者: 冯亦代 / 傅惟慈 / 陆谷孙 / 冯涛', 36.00, 18, 'A7', '2024-06-30');
INSERT INTO `books` VALUES ('9787544757225', '火星救援', '[美] 安迪·威尔', '译林出版社 原作名: The Martian 译者: 陈灼', 0.00, 19, 'A1', '2024-06-30');
INSERT INTO `books` VALUES ('9787547010105', '阿勒泰的角落', '李娟', '万卷出版公司 出品方: 万榕书业', 25.00, 15, 'A9', '2024-06-30');
INSERT INTO `books` VALUES ('9787549529322', '看见', '柴静', '广西师范大学出版社 出品方: 理想国', 39.80, 17, 'A4', '2024-06-30');
INSERT INTO `books` VALUES ('9787549530816', '文学回忆录', '木心 口述 / 陈丹青 笔录', '广西师范大学出版社 出品方: 理想国 副标题: 1989—1994', 98.00, 13, 'A2', '2024-06-30');
INSERT INTO `books` VALUES ('9787559614636', '房思琪的初恋乐园', '林奕含', '北京联合出版公司 出品方: 磨铁图书', 45.00, 1, 'A9', '2024-06-30');
INSERT INTO `books` VALUES ('9787559640666', '秋园', '杨本芬', '北京联合出版公司 出品方: 乐府文化', 38.00, 19, 'A1', '2024-06-30');
INSERT INTO `books` VALUES ('9787559641182', '绝叫', '[日] 叶真中显', '北京联合出版公司 出品方: 联合读创 原作名: 絕叫 译者: 林佩瑾', 58.00, 17, 'A5', '2024-06-30');
INSERT INTO `books` VALUES ('9787559848048', '可能性的艺术', '刘瑜', '广西师范大学出版社 出品方: 理想国 副标题: 比较政治学30讲', 82.00, 17, 'A9', '2024-06-30');
INSERT INTO `books` VALUES ('9787559852533', '翦商', '李硕', '广西师范大学出版社 副标题: 殷周之变与华夏新生', 99.00, 7, 'A8', '2024-06-30');
INSERT INTO `books` VALUES ('9787563397648', '台北人', '白先勇', '广西师范大学出版社 出品方: 理想国', 38.00, 6, 'A1', '2024-06-30');
INSERT INTO `books` VALUES ('9787563397655', '孽子', '白先勇', '广西师范大学出版社 出品方: 理想国', 46.00, 10, 'A6', '2024-06-30');
INSERT INTO `books` VALUES ('9787572610912', '太白金星有点烦', '马伯庸', '湖南文艺出版社 出品方: 博集天卷', 0.00, 1, 'A2', '2024-06-30');
INSERT INTO `books` VALUES ('9787801656087', '明朝那些事儿（1-9）', '当年明月', '中国海关出版社 出品方: 磨铁图书 副标题: 限量版', 358.20, 17, 'A2', '2024-06-30');
INSERT INTO `books` VALUES ('9787801876942', '九州·缥缈录', '江南', '新世界出版社', 20.00, 13, 'A2', '2024-06-30');
INSERT INTO `books` VALUES ('9787805674278', '教父', '[美]马里奥·普佐', '译林出版社 原作名: The Godfather 译者: 周汉林', 23.30, 2, 'A6', '2024-06-30');
INSERT INTO `books` VALUES ('9787806398791', '撒哈拉的故事', '三毛', '哈尔滨出版社 出品方: 华文天下', 15.80, 5, 'A7', '2024-06-30');
INSERT INTO `books` VALUES ('9787806399057', '万水千山走遍', '三毛', '哈尔滨出版社 出品方: 华文天下', 0.00, 4, 'A7', '2024-06-30');
INSERT INTO `books` VALUES ('9787806399071', '哭泣的骆驼', '三毛', '哈尔滨出版社 出品方: 华文天下', 15.80, 20, 'A7', '2024-06-30');
INSERT INTO `books` VALUES ('9787806553404', '鹿鼎记', '金庸', '广州出版社 花城出版社 出品方: 朗声图书', 108.00, 17, 'A4', '2024-06-30');
INSERT INTO `books` VALUES ('9787806570920', '飘', '[美国] 玛格丽特·米切尔', '译林出版社 原作名: Gone with the Wind 译者: 李美华', 40.00, 14, 'A7', '2024-06-30');
INSERT INTO `books` VALUES ('9787806767245', '野火集', '龙应台', '文汇出版社 副标题: 二十年纪念版', 25.00, 2, 'A2', '2024-06-30');
INSERT INTO `books` VALUES ('9787806859988', '爱你就像爱生命', '李银河 / 王小波', '上海锦绣文章出版社 出品方: 磨铁图书', 18.00, 3, 'A9', '2024-06-30');
INSERT INTO `books` VALUES ('9787806992197', '飞鸟集', '[印] 罗宾德拉纳德·泰戈尔', '哈尔滨出版社 译者: 徐翰林', 16.80, 11, 'A3', '2024-06-30');
INSERT INTO `books` VALUES ('9787807681885', '跨越边界的社区（修订版）', '项飙', '生活·读书·新知三联书店 副标题: 北京“浙江村”的生活史', 68.00, 12, 'A9', '2024-06-30');
INSERT INTO `books` VALUES ('9788781074519', '金锁记', '张爱玲', '哈尔滨出版社', 13.50, 20, 'A5', '2024-06-30');
INSERT INTO `books` VALUES ('9789573330806', '13 67', '陳浩基', '皇冠文化出版有限公司 副标题: 陳浩基作品2', 0.00, 14, 'A6', '2024-06-30');

-- ----------------------------
-- Table structure for borrowinfo
-- ----------------------------
DROP TABLE IF EXISTS `borrowinfo`;
CREATE TABLE `borrowinfo`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `ISBN` char(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `user_id` bigint(0) NOT NULL,
  `begin_time` datetime(0) NOT NULL,
  `return_time` datetime(0) NOT NULL,
  `fine` decimal(10, 2) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ISBN`(`ISBN`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `borrowinfo_ibfk_1` FOREIGN KEY (`ISBN`) REFERENCES `books` (`ISBN`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `borrowinfo_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of borrowinfo
-- ----------------------------
INSERT INTO `borrowinfo` VALUES (4, '9787020002207', 12, '2024-07-01 06:50:06', '2024-07-01 06:50:06', 0.00);
INSERT INTO `borrowinfo` VALUES (5, '9787020008742', 12, '2024-07-01 06:50:13', '2024-07-01 06:50:13', 0.00);
INSERT INTO `borrowinfo` VALUES (6, '9787020008735', 17, '2024-07-01 07:46:59', '2024-07-07 16:00:00', 0.00);

-- ----------------------------
-- Table structure for labels
-- ----------------------------
DROP TABLE IF EXISTS `labels`;
CREATE TABLE `labels`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `num` int(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of labels
-- ----------------------------
INSERT INTO `labels` VALUES (1, '计算机类', 2);
INSERT INTO `labels` VALUES (2, '名著经典类', 8);
INSERT INTO `labels` VALUES (3, '科幻故事类', 5);

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `title` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `create_time` datetime(0) NOT NULL,
  `update_time` datetime(0) NOT NULL,
  `view_num` int(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES (1, '图书上新', '新到《数据库系统结构》和《编译原理》', '2024-06-30 10:59:36', '2024-06-30 13:08:00', 0);

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `permission_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `acl_value` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO `permissions` VALUES (1, '查看', 'view');
INSERT INTO `permissions` VALUES (2, '管理', 'manage');
INSERT INTO `permissions` VALUES (3, '高级管理', 'root');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `permission_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `permission_id`(`permission_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, '普通用户', '1');
INSERT INTO `roles` VALUES (2, '管理员', '1,2');
INSERT INTO `roles` VALUES (3, '超级管理员', '1,2,3');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `user_id` bigint(0) NOT NULL AUTO_INCREMENT,
  `id_number` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `student_id_number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `user_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '',
  `password` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `email` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `role_id` bigint(0) NOT NULL DEFAULT 1,
  `create_date` date NOT NULL,
  `book_num` int(0) NOT NULL DEFAULT 0,
  `fine` decimal(10, 2) NOT NULL DEFAULT 0,
  PRIMARY KEY (`user_id`) USING BTREE,
  INDEX `role_id`(`role_id`) USING BTREE,
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (12, '202406012', '2024', NULL, '2024', '20242001@xmu', 3, '2024-06-29', 0, 0.00);
INSERT INTO `users` VALUES (13, '202406013', '24232221', NULL, '24232221', '23242221@qq.com', 1, '2024-06-30', 0, 0.00);
INSERT INTO `users` VALUES (14, '202406014', '23232', NULL, '23232', '23232@123.com', 1, '2024-06-30', 0, 0.00);
INSERT INTO `users` VALUES (15, '202406015', '45454', NULL, '45454', '45454@135.com', 1, '2024-06-30', 0, 0.00);
INSERT INTO `users` VALUES (16, '202406016', '54321', NULL, '54321', '54321@123com', 1, '2024-06-30', 0, 0.00);
INSERT INTO `users` VALUES (17, '202406017', '2021', 'DDD', '2021', '2021@123.com', 2, '2024-06-30', 0, 0.00);
INSERT INTO `users` VALUES (18, '202407018', '100000', NULL, '10000', '100@10.com', 1, '2024-06-30', 0, 0.00);

-- ----------------------------
-- Triggers structure for table borrowinfo
-- ----------------------------
DROP TRIGGER IF EXISTS `decrement_books_num`;
delimiter ;;
CREATE TRIGGER `decrement_books_num` AFTER INSERT ON `borrowinfo` FOR EACH ROW BEGIN
    -- 更新 books 表中对应 isbn 的 num 字段
    UPDATE books
    SET num = num - 1
    WHERE isbn = NEW.isbn;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table borrowinfo
-- ----------------------------
DROP TRIGGER IF EXISTS `increment_books_num`;
delimiter ;;
CREATE TRIGGER `increment_books_num` AFTER DELETE ON `borrowinfo` FOR EACH ROW BEGIN
    UPDATE books
    SET num = num + 1
    WHERE isbn = OLD.isbn;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
