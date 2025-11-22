# 🌱 Calculadora AgroCarbon

<p align="center">
  <img src="assets/icons/agrocarbon_banner.png" width="260">
</p>

A **Calculadora AgroCarbon** é uma ferramenta open-source desenvolvida em Flutter para quantificar o **Estoque de Carbono no Solo (ESTC)** em áreas agrícolas. O aplicativo converte dados laboratoriais e de campo em informações estratégicas de forma simples, rápida e padronizada — auxiliando produtores, consultores, pesquisadores e agentes do mercado de carbono.

---

## 📌 Índice

1. [Sobre o App](#sobre-o-app)
2. [Propósito e Funcionalidades](#propósito-e-funcionalidades)
3. [Fórmulas e Metodologia](#fórmulas-e-metodologia)
4. [Instalação e Execução (Passo a passo)](#instalação-e-execução-passo-a-passo)
5. [Dependências e Ferramentas](#dependências-e-ferramentas)
6. [Estrutura do Projeto](#estrutura-do-projeto)
7. [Screenshots](#screenshots)
8. [Equipe / Grupo AGROcarbon](#equipe--grupo-agrocarbon)

---

## 🧾 Sobre o App

A Calculadora AgroCarbon foi desenvolvida para executar os principais cálculos relacionados ao estoque de carbono no solo com base em fórmulas oficiais e práticas consagradas em pesquisas agronômicas. O app permite entrada de dados laboratoriais (massa seca, MOS, dimensões de amostra, etc.) e devolve resultados padronizados como COT e ESTC.

---

## 🎯 Propósito e Funcionalidades

**Propósito central:** apoiar a mensuração e padronização do Estoque de Carbono no Solo (ESTC) para aplicações como créditos de carbono, programas de agricultura regenerativa e certificações ambientais.

**Funcionalidades principais:**

* Inserção de dados laboratoriais e de campo (massa seca, volume da amostra, espessura da camada, MOS etc.).
* Cálculo automático de: MOS, COT, Densidade do Solo (Ds) e ESTC (kg/m²).
* Interface simples e objetiva para uso em campo e em relatórios técnicos.
* Exportação/Registro básico de resultados (dependendo da implementação atual).

> **Frase-chave:** "Valorizar a terra, tornando o estoque de carbono um ativo comercial."

---

## 🧮 Fórmulas e Metodologia

### 1. Matéria Orgânica do Solo (MOS)

```
MOS = COT × 1,724
COT = MOS × 0,58
```

### 2. Densidade do Solo (Ds)

```
V = π × R² × h
Ds = Ms / V
```

(Ms = massa seca da amostra; V = volume da amostra calculado pela geometria apropriada)

### 3. Estoque de Carbono no Solo (ESTC)

```
ESTC = COT × Ds × e / 10
```

---

## 💻 Instalação e Execução (Passo a passo)

### Pré-requisitos

* Flutter SDK (versão estável recomendada)
* IDE: Android Studio, Visual Studio Code ou IntelliJ IDEA
* SDKs de plataforma (Android/iOS)

### Clonar o repositório

```bash
git clone https://github.com/seu-usuario/calculadora-agrocarbon.git
cd calculadora_agrocarbon
```

### Instalar dependências

```bash
flutter pub get
```

### Gerar arquivos do MobX

```bash
dart run build_runner build --delete-conflicting-outputs
```

### Executar o aplicativo

```bash
flutter run
```

---

## 📦 Dependências e Ferramentas (principais)

* mobx, mobx_codegen, build_runner
* flutter_modular
* shared_preferences
* animations, font_awesome_flutter, google_fonts
* flutter_native_splash, flutter_launcher_icons

---

## 🗂️ Estrutura do Projeto

```
lib/
├── app/
│   ├── core/
│   │   ├── components/
│   │   ├── theme/
│   │   └── core_module.dart
│   ├── modules/
│   │   ├── carbon/
│   │   ├── density/
│   │   ├── home/
│   │   └── mos/
│   ├── app_module.dart
│   └── app_widget.dart
└── main.dart
```

---

## 📸 Screenshots

<table>
  <tr>
    <td><img src="assets/screenshots/screenshot_carbon.jpg" width="170"></td>
    <td><img src="assets/screenshots/screenshot_mos_result.jpg" width="170"></td>
    <td><img src="assets/screenshots/screenshot_density.jpg" width="170"></td>
    <td><img src="assets/screenshots/screenshot_cot.jpg" width="170"></td>
  </tr>
</table>

---

## 👥 Equipe: Grupo AGROcarbon

**Coordenador:**

* Prof. Dr. Gustavo André de Araújo Santos — Universidade Federal do Maranhão (Chapadinha/MA)

**Grupo AGROcarbon — Laboratório Inteligente de Pesquisas destinadas a Mudanças Climáticas e Agricultura**

**Compromissos do grupo:**

* Pesquisa científica de alto nível
* Desenvolvimento de soluções práticas
* Apoio à agricultura regenerativa
* Capacitação técnica
* Inclusão e diversidade

---

Desenvolvido por **Rodrigo Salgado** — para um futuro mais sustentável.
