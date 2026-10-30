# Configuração de DNS — ivcsofthouse.com.br

Este guia ajuda a configurar os registros de DNS para que seu domínio aponte para a VPS Hostinger gerenciada pelo Coolify.

## 1. Descubra o IP da sua VPS

No painel da Hostinger (ou no Coolify), obtenha o **endereço IP público** da sua VPS. Anote este IP — ele será usado nos registros A.

## 2. Registros DNS a criar

No painel de DNS do seu registrador de domínio (ou onde o `ivcsofthouse.com.br` está gerenciado), crie os seguintes registros do tipo **A**:

| Tipo | Nome / Host | Aponta para (Valor) | TTL |
|------|-------------|---------------------|-----|
| A | `@` (raiz) | `IP_DA_SUA_VPS` | Automático / 3600 |
| A | `www` | `IP_DA_SUA_VPS` | Automático / 3600 |

> Substitua `IP_DA_SUA_VPS` pelo IP real da sua VPS Hostinger.

Esses registros fazem com que tanto `ivcsofthouse.com.br` quanto `www.ivcsofthouse.com.br` resolvam para o servidor.

## 3. Subdomínios dos seus projetos (opcional)

Se quiser expor cada aplicação em um subdomínio (ex: `erp.ivcsofthouse.com.br`), crie um registro A para cada um:

| Subdomínio | Aponta para |
|------------|-------------|
| erp | IP_DA_SUA_VPS |
| ecobrancas | IP_DA_SUA_VPS |
| gservicos | IP_DA_SUA_VPS |
| ecadempresas | IP_DA_SUA_VPS |
| egerenteservicos | IP_DA_SUA_VPS |
| eclubecampestre | IP_DA_SUA_VPS |
| pocomanut | IP_DA_SUA_VPS |
| ehotelaria | IP_DA_SUA_VPS |
| erestaurantes | IP_DA_SUA_VPS |

Em seguida, no Coolify, adicione cada subdomínio como domínio do respectivo recurso (aplicação) e ative SSL.

## 4. SSL (HTTPS)

No Coolify, ao adicionar o domínio `ivcsofthouse.com.br` (e subdomínios) ao recurso, ative a opção de **SSL / Let's Encrypt**. O Coolify gerará e renovará o certificado automaticamente.

> Certifique-se de que os registros A já estejam propagados antes de solicitar o SSL, caso contrário a validação pode falhar.

## 5. Verificação

Após aguardar a propagação do DNS (alguns minutos a algumas horas), teste:

- `http://ivcsofthouse.com.br` → deve carregar a landing page
- `https://ivcsofthouse.com.br` → deve carregar com cadeado (SSL)
- `http://www.ivcsofthouse.com.br` → deve redirecionar/carregar a página

Use ferramentas como [dig](https://github.com/) ou `nslookup ivcsofthouse.com.br` para confirmar que o domínio aponta para o IP correto.

---

Após configurar o DNS, volte à página `index.html` e preencha os cards de projetos com os nomes reais, descrições e URLs de cada sistema. Veja [`index.html`](./index.html) na seção "Nossos Projetos".
