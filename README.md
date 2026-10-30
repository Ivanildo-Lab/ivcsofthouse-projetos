# IVC Soft House — Landing Page

Página institucional para divulgação dos projetos de aplicações da IVC Soft House.

## Estrutura

```
ivcsofthouse-projetos/
├── index.html          # Página principal (estática)
├── docker-compose.yml  # Orquestração para Coolify (Nginx)
├── Dockerfile          # Alternativa de build de imagem
├── nginx.conf          # Configuração do Nginx
├── DEPLOY-COOLIFY.md   # Passo a passo de deploy no Coolify
├── DNS-DOMINIO.md      # Configuração de DNS (A records, SSL)
└── .gitignore
```

## Tecnologias

- HTML5 + CSS3 + JavaScript vanilla (sem dependências)
- Nginx como servidor web
- Docker / Coolify para orquestração na VPS Hostinger

## Domínio

Produção: `https://ivcsofthouse.com.br`

## Deploy no Coolify

Consulte [`DEPLOY-COOLIFY.md`](./DEPLOY-COOLIFY.md) para o passo a passo completo.

## Subdomínios dos projetos

Consulte [`DNS-DOMINIO.md`](./DNS-DOMINIO.md) para configurar os registros A de cada aplicação.
