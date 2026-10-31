# -----------------------------------------------------------
# Dockerfile para Coolify — Landing Page IVC Soft House
# Build de imagem própria (evita bind mount de arquivos soltos)
# -----------------------------------------------------------
FROM nginx:alpine

COPY index.html /usr/share/nginx/html/index.html
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
