# 使用极其轻量级的 Nginx Alpine 镜像作为基础底座 (~5MB)
FROM nginx:alpine

# 添加作者/维护者信息（可选）
LABEL maintainer="AI Developer"
LABEL description="Seedance 2.0 视频生产成本计算器"

# 将前面生成的单文件 HTML 复制到 Nginx 的默认静态资源目录中
# 并将其重命名为 index.html 以便作为默认首页加载
COPY calculator.html /usr/share/nginx/html/index.html

# 覆盖 Nginx 默认配置以优化静态资源的缓存和性能 (可选)
# 如果有特定的 nginx.conf 可以 COPY 进去，这里使用默认的高效配置即可

# 声明容器内部运行的端口
EXPOSE 80

# 容器启动时以前台模式运行 Nginx
CMD ["nginx", "-g", "daemon off;"]
