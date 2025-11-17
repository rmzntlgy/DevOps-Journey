FROM ubuntu:22.04

# Gerekli paketleri kur (OpenSSH ve Python3)
RUN apt-get update && apt-get install -y openssh-server python3 sudo

# SSH ayarlarını yap (Root girişine izin ver)
RUN mkdir /var/run/sshd
RUN echo 'root:root' | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH portunu aç
EXPOSE 22

# Konteyner başlayınca SSH servisini başlat
CMD ["/usr/sbin/sshd", "-D"]
