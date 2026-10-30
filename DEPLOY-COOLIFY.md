# Deploy da Landing Page no Coolify (VPS Hostinger)

Este guia explica como publicar a página `index.html` no seu domínio `ivcsofthouse.com.br` usando o Coolify na VPS da Hostinger.

## O que está neste pacote
- `index.html` — landing page estática (HTML + CSS + JS, sem dependências)
- `DEPLOY-COOLIFY.md` — este arquivo
- `DNS-DOMINIO.md` — instruções de DNS (A records, subdomínios, SSL)

## Pré-requisitos
1. Acesso ao painel do Coolify na sua VPS Hostinger
2. Domínio `ivcsofthouse.com.br` registrado e com acesso ao gerenciador de DNS
3. (Opcional) Repositório Git (GitHub/GitLab) com a página, se quiser deploy automático

---

## Opção A — Deploy estático via "Static" do Coolify (recomendado)

O Coolify possui um tipo de recurso **Static** ideal para sites HTML puro.

1. Abra o Coolify → seu projeto → **Add Resource** → **Static**
2. Dê um nome, por exemplo: `ivc-landing-page`
3. Conecte seu repositório Git (ou faça upload direto dos arquivos, se o Coolify permitir)
4. Defina:
   - Build command: (vazio / não necessário)
   - Publish directory: `.` (raiz, onde está o `index.html`)
5. Salve e faça o deploy

## Opção B — Docker (Nginx)

Se preferir containerizar:

### Dockerfile
```dockerfile
FROM nginx:alpine
COPY index.html /usr/share/nginx/html/index.html
EXPOSE 80
```

### docker-compose.yml
```yaml
version: '3.8'
services:
  ivc-landing:
    image: nginx:alpine
    volumes:
      - ./index.html:/usr/share/nginx/html/index.html:ro
    ports:
      - "8080:80"
    restart: unless-stopped
```

No Coolify, crie um recurso **Docker Compose** e aponte para este arquivo.

## Configuração de Domínio no Coolify

Depois do recurso criado e em execução:

1. No Coolify, acesse o recurso da landing page → **Domains**
2. Adicione o domínio: `ivcsofthouse.com.br`
3. O Coolify solicitará um certificado SSL (Let's Encrypt) automaticamente — ative **SSL**
4. Salve. O Coolify configurará o proxy reverso e o SSL para você.

> Se também quiser expor a página em `www.ivcsofthouse.com.br`, adicione como domínio adicional e redirecione para o domínio principal.

## Variáveis de ambiente (se necessário)
Não são necessárias para uma página estática pura.

## Atualizações
Basta editar o `index.html`, fazer commit (ou reenviar o arquivo) e disparar um novo deploy no Coolify.

---

Próximo passo: configure o DNS no arquivo [`DNS-DOMINIO.md`](./DNS-DOMINIO.md) para apontar o domínio para o IP da sua VPS Hostinger.
