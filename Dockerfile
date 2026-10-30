# -----------------------------------------------------------
# Dockerfile para Coolify — Landing Page IVC Soft House
# Alternativa ao docker-compose.yml (build de imagem própria)
# -----------------------------------------------------------
FROM nginx:alpine

COPY index.html /usr/share/nginx/html/index.html
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
