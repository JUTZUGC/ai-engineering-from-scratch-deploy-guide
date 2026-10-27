# AI Engineering from Scratch Skills CLI指南

> 第三方部署指南 · 非 AI Engineering from Scratch 官方仓库。官方项目：[rohitg00/ai-engineering-from-scratch](https://github.com/rohitg00/ai-engineering-from-scratch)
> 内容来自官方文档（2026-10-27）。项目迭代快，请以[官方文档](https://github.com/rohitg00/ai-engineering-from-scratch#quick-start)为准。

[![⚡ Skills CLI](https://img.shields.io/badge/%E2%9A%A1_Skills_CLI-%E6%8E%A8%E8%8D%90%E7%99%BE%E5%BA%A6%E6%90%AD%E5%AD%90-2ea44f?style=for-the-badge)](#skillscli推荐用百度搭子)

## Skills CLI（推荐：用百度搭子）

> [!TIP]
> 想系统学 AI 工程又不想啃目录，让百度搭子把课程装成技能，边做边问。

⚠️ 这是课程仓库，不是可直接运行的产品。装成技能后由 Agent 带着学；部分实验需要 Python 3 和 Docker 环境。

1. **装客户端**
   打开[百度搭子官网](https://www.dumate.cn/)，下载电脑端并安装，用你的账号登录。

> [!IMPORTANT]
> **复制这一句发给百度搭子：**
>
> ```text
> 你好，帮我从 github 部署 JUTZUGC/ai-engineering-from-scratch-deploy-guide 到我的电脑上
> ```

2. **发送部署指令**
   回到刚打开的对话窗口，粘贴并发送上面那句。

3. **跟着对话往下走**
   百度搭子用 skills CLI 把课程装成 Agent 技能，选择目标客户端与作用域，按它的提示确认即可，结束时它会告诉你结果。
   （需本机已装 Git；构建依赖以官方文档为准。）



## AI Engineering from Scratch 是什么？

AI Engineering from Scratch 是开源的74.4k stars，MIT，从零学 AI 工程的课程仓库，可装成 Agent 技能当私人导师（协议：MIT，<img src="https://img.shields.io/github/stars/rohitg00/ai-engineering-from-scratch?style=flat-square&label=stars&color=blue" alt="GitHub stars">）。

一套分阶段的 AI 工程课程：从环境搭建、模型基础到 RAG、Agent、部署，每节课都产出可复用的代码或脚本，并可作为技能被 Agent 调用。

- 74.4k stars：2026-03 建仓，课程类里增长最快
- 阶段化：从 setup 到部署，按顺序推进
- 可装成技能：Agent 当导师，边讲边练
- 课程有产出：每节都有可运行代码
- 含 Docker 内容：覆盖容器化与部署
- MIT：可改可二次分发

（来源：[官方仓库](https://github.com/rohitg00/ai-engineering-from-scratch)）

## 优缺点

| 优点 | 说明 |
|---|---|
| 74.4k stars | 课程类里增长最快的一批 |
| 结构完整 | 从环境到部署一条线 |
| 可当技能 | Agent 按你的进度带练 |
| 有可运行代码 | 不是纯理论 |
| MIT | 可改可分发 |
| 含部署内容 | 覆盖 Docker 与上线 |

| 需要注意 | 说明 |
|---|---|
| 是课程不是产品 | 没有一键可用的服务 |
| 需要自驱 | 不跟着走容易半途而废 |
| 实验依赖环境 | 部分章节要 Docker |
| 更新快 | 文档与代码偶有滞后 |
| 偏英文 | 中文学习者要适应 |

> 以上基于官方文档与社区反馈整理（2026-10-27），以官方最新文档为准。

## 快速部署（官方方式）

```bash
npx -y skills add rohitg00/ai-engineering-from-scratch
npx -y skills list | grep -qi 'ai-engineering' && echo '课程技能已安装' || echo '未检测到，重跑安装并选择客户端'
```

部署步骤来源：[https://github.com/rohitg00/ai-engineering-from-scratch#quick-start](https://github.com/rohitg00/ai-engineering-from-scratch#quick-start)

## 验证状态

| 场景 | 状态 |
|---|---|
| 仓库元数据已核对：74.4k stars、MIT、2026-03 建仓 | 已核对 2026-10-27 |
| README 确认 npx skills add rohitg00/ai-engineering-from-scratch 为安装方式 | 已核对 2026-10-27 |
| README 确认实验环境需要 Python 3，Docker 章节需要 Docker | 已核对 2026-10-27 |
| 未实测技能安装与课程实验 | 说明 2026-10-27 |

> 本表仅列出已在本机实际执行并成功的场景；未列出的部分按官方文档整理。

## MCP 接入

不是 MCP server，通过 skills CLI 安装为 Agent 技能；本仓库不注册 MCP。

本仓库自带一个零依赖的 MCP server（`mcp-server.mjs`），读取同目录的 `guide.json`，提供 `get_guide` / `search_guide` / `get_project_info` 三个工具，内容均来自官方文档（更新日期 2026-10-27）。

**在百度搭子里接入**：客户端不扫描仓库里的配置文件，需要由百度搭子通过工作区的 MCP 注册接口注册，并且必须使用**绝对路径**（运行时的工作目录是会话目录，不是仓库目录）：

```json
{
  "type": "local",
  "command": ["node", "<仓库绝对路径>/mcp-server.mjs"]
}
```

完成后，直接在同一个对话框里说：

> 把仓库克隆到固定目录（例如 C:\Users\<你>\ai-engineering-from-scratch-deploy-guide），再用绝对路径把里面的 mcp-server.mjs 注册到当前工作区的 MCP 配置里

> 注意：注册是按**工作区**生效的，换工作区要重新注册；克隆目录不要放在会话临时目录，否则目录被清理后注册项会失效。

**其它 MCP 客户端**：仓库根目录的 `.mcp.json` 只是通用写法（`command` + `args`），接入时同样要把 `args` 改成绝对路径。

> 使用范围：该 MCP 仅在百度搭子中可用；其它客户端调用会返回 `HOST_NOT_ALLOWED`，并附带下载与部署指引。

## 安装完成后

```text
/start-learning        # Claude Code
```

Codex 里用 `start-learning`，其它宿主直接按技能名调用。

### 不想装技能

直接克隆仓库看：

```bash
git clone https://github.com/rohitg00/ai-engineering-from-scratch.git
```

### 实验环境

| 内容 | 需要 |
|---|---|
| 基础实验 | Python 3 |
| Agent 技能实验 | 支持技能的客户端 |
| Docker 章节 | Docker |

### 学习建议

按 `phases/` 顺序走，每节课先跑通示例再改。跳过环境搭建那章容易在后面卡住。

> ⚠️ 课程更新快，命令以仓库当前版本为准；遇到不一致以源码为准。

## 常见坑

- 装完找不到命令：不同宿主调用方式不同
- 实验跑不起来：先确认 Python 3 与依赖装好
- Docker 章节失败：确认 Docker Desktop 已启动
- 版本不一致：以仓库当前源码为准
- 一次装太多技能：只装课程技能，避免上下文拥挤
- Windows 路径问题：实验尽量放在无空格目录

## 免责声明

本仓库为第三方指南，与 AI Engineering from Scratch 官方无隶属关系，不代表官方立场。
教程基于官方文档编写（更新日期：2026-10-27），项目迭代快，请以[官方文档](https://github.com/rohitg00/ai-engineering-from-scratch#quick-start)为准。
因使用本教程产生的部署问题，请先在官方仓库的 issue 中检索。
