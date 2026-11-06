<!-- ppt-master-schema: design-spec/v1 -->
# Aeneas-Rocq Rust机密计算内核图解验证方案 - Design Spec

## I. Project Information

| Item | Value |
| --- | --- |
| Project Name | Aeneas-Rocq Rust机密计算内核图解验证方案 |
| Canvas Format | PPT 16:9，1280 × 720 |
| Page Count | 5 |
| Primary Language | zh-CN |
| Target Audience | 形式化验证与机密计算项目评审人员，以及需要据此实施和验收的研发团队 |
| Communication Intent | 先界定第一阶段研究问题，再解释 Aeneas、Charon 与 Rocq 如何形成可落地的验证链，最后明确实施步骤和结题指标 |
| Desired Audience Outcome | 听众能够理解方案为什么范围可控、具体证明什么、如何实施，以及用哪些可量化产物完成验收 |
| Core Message / Ask / Action | 从真实 Rust 内核中剥离顺序 safe Rust 安全策略，经 Charon 与 Aeneas 转为 Rocq 模型，以页面管理案例证明隔离、完整性和防泄露，并形成可复现交付 |
| Delivery Context | 主要用于有主讲的十分钟技术方案评审；次要作为会后独立阅读的实施与验收依据 |
| Artifact Afterlife | 作为项目立项论证、阶段实施路线、结题验收和后续扩展的共同基线 |
| Reading Mode | balanced |
| Content Strategy | 按原文逻辑重组为指定的五页；可压缩措辞和合并相邻论点，但不改变事实、边界和论证关系，也不依赖现有PPT版本 |
| Design Style | 双轨验证蓝图：结论先行的教学式技术图解，严格白底，瑞士网格秩序与工程蓝图标注语言结合 |
| AI Image Acquisition Path | not applicable |
| Generation Mode | continuous |
| Spec Refinement | disabled |
| Speaker Notes | enabled — final Stage-2 proactive policy |
| Custom Animations | disabled — final Stage-2 proactive policy |
| Narration Audio | disabled — final Stage-2 proactive policy |
| Created Date | 2026-08-26 |

## II. Canvas Specification

| Property | Value |
| --- | --- |
| Format | ppt169 |
| Dimensions | 1280 × 720 |
| viewBox | `0 0 1280 720` |
| Margins | 左右 72px，上 48px，下 36px |
| Content Area | x=72..1208，y=48..684 |

## III. Visual Theme

### Theme Style

- **Mode**: custom
- **Mode References**: instructional, pyramid
- **Mode Behavior**: 保持原文的研究逻辑顺序，但每页先给出可复述的判断，再用一张主图逐步解释对象、关系、证明与验收；从问题界定到工具链、状态模型、最小案例和实施指标形成五个连续教学单元。
- **Visual style**: custom
- **Visual Style References**: swiss-minimal, blueprint
- **Visual Style Behavior**: 以纯白默认背景和严格模块网格组织页面；工程蓝图语言仅用于前景中的细线框、连接线、端点、编号和技术标注，不绘制背景网格、底纹、渐变、阴影或装饰性背景。每页由一张主关系图承担视觉重心，文字沿图形就近解释，避免重复卡片墙。
- **Theme**: 白底可编辑形式化验证蓝图
- **Tone**: 严谨、克制、可解释、面向实施与验收

### Color Scheme

| Role | HEX | Purpose |
| --- | --- | --- |
| Background | #FFFFFF | 所有页面唯一画布背景 |
| Secondary background | #F3F6F8 | 前景信息模块的浅色承载面 |
| Primary | #153A5B | 标题、实现主线和核心结构 |
| Accent | #E28A22 | 风险、可信边界和关键结论 |
| Secondary accent | #0E7490 | 规约主线、已验证状态和正向结果 |
| Body text | #18212B | 正文与技术说明 |
| Grid / divider | #CCD8E2 | 前景模块边界、分隔线和次级连接 |

## IV. Typography System

### Font Plan

| Role | Character (Reference) | Primary | English if non-English | Fallback tail |
| --- | --- | --- | --- | --- |
| Title | 精确、结论式无衬线 | Microsoft YaHei | Arial | sans-serif |
| Body | 中性、清晰无衬线 | Microsoft YaHei | Arial | sans-serif |
| Code | 等宽技术标识 | Consolas | Consolas | Microsoft YaHei, Arial, monospace |

- **Title stack**: Microsoft YaHei, Arial, sans-serif
- **Body stack**: Microsoft YaHei, Arial, sans-serif
- **Code stack**: Consolas, Microsoft YaHei, Arial, monospace
- **Role rationale**: `Code` 用于 Rust、LLBC、Rocq 标识、函数名、不变量名与公式预览，使实现对象与解释性正文清晰分层。

### Font Size Hierarchy

| Purpose | Anchor Size (px) |
| --- | ---: |
| Body | 24 |
| Title | 44 |
| Subtitle | 32 |
| Annotation | 18 |

## V. Layout Principles

### Deck-wide Direction

- **Hierarchy direction**: 先读结论式标题，再沿主图的连接方向理解机制，最后读取紧邻节点的解释或验收结论。
- **Composition tendency**: 每页采用一张主关系图配少量就近文本；对照关系用明确分区，流程关系用连续路径，状态与证明关系用中心节点和汇聚链表达。
- **Cross-page continuity**: 深蓝表示实现与结构，青色表示规约与已验证性质，橙色表示可信边界、风险或验收焦点；编号、端点和细线规则贯穿五页。
- **Spacing posture**: P01 与 P05 保持较大留白；P02–P04允许较高信息密度，但仍以一张主图而非均质卡片网格组织。

## VI. Icon Usage Specification

- **Primary bundled library**: tabler-outline
- **Brand-logo library**: simple-icons
- **Stroke Width**: 2

| Icon Path | Suitable Scenarios |
| --- | --- |
| tabler-outline/shield-check | 安全属性、验证通过、隔离结论 |
| tabler-outline/lock | 访问控制、可信边界、受保护状态 |
| tabler-outline/file-code | Rust 模块、模型文件和证明代码 |
| tabler-outline/route | 技术路线、实施路径和阶段串联 |
| tabler-outline/checklist | 验收项、交付物和完成标志 |
| tabler-outline/alert-triangle | 风险、限制和不应夸大的结论 |
| simple-icons/rust | Rust 实现主线的技术身份标识 |

## VIII. Image Resource List

| Filename | Dimensions | Ratio | Purpose | Type | Layout pattern | Crop Policy | Acquire Via | Status | Reference | text_policy | page_role |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |

## IX. Content Outline

### Part 1: 问题、技术基础与总体路线

#### Slide 01 - 研究目标与问题界定

- **Audience move**: 从“Rust 已经足够安全”的模糊认知，转变为理解内存安全与安全策略正确性之间的缺口，并接受第一阶段的明确验证边界。
- **Layout**: 以“Rust 能保证什么 / 仍需证明什么”为左右对照，上方用一条判断句建立问题，下方用三个层级区分纳入验证、可信基和暂不覆盖范围；交付物作为图的收束端而非独立卡片墙。
- **Title**: Rust 消除了部分内存错误，却不能自动证明权限与清零正确
- **Core message**: 第一阶段只验证可从内核中分离的顺序 safe Rust 安全策略，并把 unsafe、硬件、并发和工具链假设显式划入可信边界。
- **Content**: 左侧“Rust 已提供”包括所有权、借用检查和部分内存错误规避；右侧“仍需机器证明”包括访问判断正确、未授权状态不可修改、页面重新分配前已清零。验证对象聚焦页面所有权管理、访问权限判断、页面回收和重新分配。边界分为三层：纳入验证的是目标 safe Rust 模块与函数级规约；可信基包括 unsafe 封装、硬件操作、外部依赖以及 rustc、Charon、Aeneas 和 Rocq 工具假设；暂不覆盖完整内核、多核并发、时间与缓存侧信道。交付结果为 Rust 示例模块、自动生成的 Rocq 模型、证明脚本和验证报告。
- **Visualization**: 定性对照与分层边界图；阅读路径为能力缺口 → 验证范围 → 交付结果。
- **Cover impact**: 以“Rust安全 ≠ 策略已证明”的视觉等式作为绑定钩子，构图可调整但必须保留这一冲突。

#### Slide 02 - 相关工作与总体技术路线

- **Audience move**: 从分别认识工具名称，转变为理解 Charon、Aeneas 与 Rocq 的分工，以及实现主线和规约主线如何在证明阶段汇合。
- **Layout**: 页面主体是一张双轨架构图。上轨从 Rust / rustc 到 MIR、Charon 的 ULLBC/LLBC、Aeneas Coq 后端和 Rocq 函数模型；下轨从安全需求到抽象状态、安全不变量和函数前后置条件；两轨在安全定理和 Rocq 机器检查处汇合。相关工作解释直接挂接到对应工具节点。
- **Title**: Charon 抽取语义、Aeneas 函数式化，Rocq 把实现与规约汇合
- **Core message**: Charon 解决真实 Rust 项目的结构化语义提取，Aeneas 解决函数式模型生成，Rocq 负责规约、定理和机器检查，三者共同构成实现级验证链。
- **Content**: Charon 对接 Cargo 与 rustc，从 MIR 生成 ULLBC 控制流表示并恢复为结构化 LLBC；Aeneas 利用 Rust 所有权与借用语义，把 LLBC 转为适合定理证明的纯函数模型，但并不自动证明机密计算安全；Rocq 在生成模型上定义页面所有权、授权访问、页面生命周期和安全不变量。总体路线按七步展开：选择可处理的 safe Rust 模块，提取 LLBC，生成 Rocq 模型，建立状态与权限规约，定义函数契约和不变量，证明隔离、完整性与防泄露，整理可信假设与验收材料。
- **Visualization**: 双轨汇合图，包含明确的顺序、链接和可信边界侧栏；不使用原文位图，全部重绘为可编辑原生图形。

### Part 2: Rocq模型、安全属性与最小案例

#### Slide 03 - Rocq模型与安全属性

- **Audience move**: 从抽象的“做形式化验证”，转变为能够指出模型包含哪些状态、依赖哪些不变量，以及四类安全结论如何由它们导出。
- **Layout**: 左侧绘制 DomainId、PageId、PageState、KernelState 的层级模型；中部以三项不变量构成证明底座；右侧将访问隔离、状态完整性、清零复用和局部非干扰组织成由底座支撑的安全属性图。公式作为可编辑证明锚点嵌入底部。
- **Title**: 小状态模型足以支撑四类可解释的安全结论
- **Core message**: 第一阶段无需建模完整 CPU、TLB 和嵌套页表，只要抽象页面所有者、共享授权、内容与清零状态，就能建立可验收的函数级证明闭环。
- **Content**: 模型以 DomainId 和 PageId 标识安全域和页面；PageState 包含 owner、shared_with、contents 和 cleared；KernelState 将页面标识映射到页面状态。全局不变量由 unique_ownership、valid_sharing 和 reuse_is_clean 组成。基于这些状态与不变量证明四类性质：may_access 返回真时访问者必须被授权；未授权更新返回错误或保持状态不变，成功更新保持 valid_state；页面重新分配后必须已清零且内容为 zero_page；在明确公开观察和顺序语义下，私有内容变化不应影响访问检查的公开结果。局部非干扰不自动覆盖时间、缓存、其他接口或并发交错。
- **Mathematical content**: \begin{aligned}\mathrm{authorized}(d,p) &:= \mathrm{owner}(p)=\mathrm{Some}(d)\lor d\in\mathrm{shared\_with}(p) \\ \mathrm{valid\_state}(s) &:= \mathrm{unique\_ownership}(s)\land\mathrm{valid\_sharing}(s)\land\mathrm{reuse\_is\_clean}(s)\end{aligned}
- **Visualization**: 状态层级、三项不变量与四类性质的定性依赖图；公式为原生可编辑对象，不创建图像资源。

#### Slide 04 - VeriSMo借鉴与最小验证案例

- **Audience move**: 从认为方案需要复刻完整系统验证，转变为理解如何借鉴 VeriSMo 的问题分解方法，并用三个 Rust 操作构成可交付的最小案例。
- **Layout**: 上半页用“保留 / 简化 / 替换”三段式取舍图解释对 VeriSMo 的借鉴；下半页绘制页面生命周期，按 may_access、release_page、reassign_page 串联私有、释放清零和新所有者状态，每个操作旁标注对应证明结论。
- **Title**: 借鉴 VeriSMo 的边界思想，用三个操作闭合最小验证案例
- **Core message**: 方案保留页面所有权、访问隔离、共享授权和清零复用问题，简化硬件与并发模型，并以 Charon 和 Aeneas 替代对完整实现的另一种证明路径。
- **Content**: 对 VeriSMo 的“保留”包括页面所有权、访问隔离、共享授权、页面生命周期、攻击者能力和可信接口；“简化”包括暂不构建完整 CPU、TLB、嵌套页表和 RMP 模型，不承诺多核并发或全系统非干扰；“替换”是用 Charon 和 Aeneas 从 safe Rust 提取 Rocq 函数模型。最小案例包含 Page 结构及三个函数：may_access 证明只有所有者或明确授权主体可以访问；release_page 证明未授权主体不能回收且释放后状态保持有效；reassign_page 证明页面只有清零后才能交给新主体，且新主体看不到旧数据。若 Vec、泛型或外部库模型造成阻碍，可用固定长度数组、单一授权对象或抽象查询接口简化原型，但不能改变安全策略本身。
- **Mathematical content**: \begin{aligned}\mathrm{may\_access}(p,d)=\mathrm{true}&\rightarrow\mathrm{authorized}(d,p) \\ \mathrm{reassign\_page}(s,pid,d)=\mathrm{Ok}(s')&\rightarrow\mathrm{page\_contents}(s',pid)=\mathrm{zero\_page}\end{aligned}
- **Visualization**: 三段式研究取舍图与页面生命周期状态图，重点显示操作顺序、清零闸门和结论对应关系。

### Part 3: 实施与验收

#### Slide 05 - 实施路线与结题验收

- **Audience move**: 从理解方法，转变为能够据此安排工作、判断阶段完成状态并验收最终成果。
- **Layout**: 上半页为六阶段连续路线图，每一阶段同时标注主要工作和完成标志；下半页以“1–3–2–1”四个相连的验收节点收束，并列出最终材料包。结束语承担结论而非额外增加结束页。
- **Title**: 六阶段路线最终落在可复现的“1–3–2–1”验收闭环
- **Core message**: 通过固定工具链、建立一个模型、完成三项操作和两类核心属性验证，形成一套可复现案例与报告，即可实现范围可控且可审计的第一阶段验收。
- **Content**: 六阶段依次为：确定边界，形成目标函数与可信假设清单；打通工具，生成可加载的 LLBC 和 Rocq 文件；建立规约，形成抽象状态与安全不变量；证明函数，完成不少于三项操作证明；证明属性，完成不少于两类典型安全属性；验收整理，归档源码、模型、证明脚本、复现说明与验证报告。指标收束为一个形式化模型、三项安全关键操作、两类典型安全属性和一套验证案例及报告。建议用访问权限检查、页面回收和页面重新分配作为三项操作，以访问隔离和页面重新分配防泄露作为两类属性；不把全系统非干扰、完整 unsafe 验证、多核并发、百分之百覆盖率或代码行数写成刚性指标。
- **Visualization**: 六阶段路线图与四节点验收闭环，阶段工作和完成标志沿同一阅读路径排列。
- **Closing impact**: 绑定结论为“价值在于建立可复现、可解释、可扩展的 Rust → Rocq 路径，而不是宣称整个系统已验证”。

## X. Speaker Notes Requirements

- **Generation**: enabled
- **Filename**: match each SVG filename under `notes/`
- **Content**: 仅基于提供的 DOCX 和最终可见 SVG，补充图形阅读顺序、边界解释和页间过渡；不引入外部事实，不夸大证明范围。
- **Total duration**: 10 minutes
- **Notes style**: 正式、解释性、结论先行
- **Presentation purpose**: 解释研究方案、建立实施共识并支持项目验收
