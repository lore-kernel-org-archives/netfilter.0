From: Alex Flex <aflexzor@gmail.com>
Subject: Re: SynFloods and CPU usage with and without iptables. Confused!
Date: Sat, 04 May 2013 12:45:57 -0600
Message-ID: <51855765.9020305@gmail.com>
References: <51854232.1030306@gmail.com> <27F4C2E78FB64527A44CA6E3BC368315@gmail.com> <7668B4D1FBE84D73BC3BFBFCAFCBEC1F@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:message-id:date:from:user-agent:mime-version:to:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=AFdw/CfW4IT1ITy9HaqYonOzYcTDiKZDm0AzV8UVNq4=;
        b=v7UuvyLQRqFmKCQ+1JJ+qI+iRlvnJBjoC92dCsaq9JhgOOIDYYjdhbEJg0yF2I4lIV
         0+uGaKN/LH1tApNn5BRZXL04N5EzqJeRCUUmrp+PV7o4DAAYnTdKEdgpQVSyq3XTR7t4
         Vqny2IxpnMp+5egt4nzLvlwY91WzKLK2KoL/xn63OkMQGzgUj81dpb0vt/hFKrwxOl+T
         mJ+TSWlnhujz9EH5Anevgt0A9U53o51IQcEaOhNyQP+FHenQEvFFzu0kt6XY18E671Ua
         jaQYqA5mwyuWsz5KzLSWoJ2sUsYlBtS3Y/sLThO6Ml0PU0PelOdf2FnZgymPqCJswfEr
         MkDg==
In-Reply-To: <7668B4D1FBE84D73BC3BFBFCAFCBEC1F@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Payam Chychi <pchychi@gmail.com>, netfilter@vger.kernel.org

Payam,

This is the copy of sysctl.conf on the second machine that got DoSed 
with 20mbits if you think it helps..

#DEFAULTS
# Kernel sysctl configuration file for Red Hat Linux
#
# For binary values, 0 is disabled, 1 is enabled.  See sysctl(8) and
# sysctl.conf(5) for more details.

# Controls IP packet forwarding
net.ipv4.ip_forward = 0

# Controls source route verification
net.ipv4.conf.default.rp_filter = 1

# Do not accept source routing
net.ipv4.conf.default.accept_source_route = 0

# Controls the System Request debugging functionality of the kernel
kernel.sysrq = 0

# Controls whether core dumps will append the PID to the core filename.
# Useful for debugging multi-threaded applications.
kernel.core_uses_pid = 1

# Controls the use of TCP syncookies
net.ipv4.tcp_syncookies = 1

# Disable netfilter on bridges.
net.bridge.bridge-nf-call-ip6tables = 0
net.bridge.bridge-nf-call-iptables = 0
net.bridge.bridge-nf-call-arptables = 0

# Controls the maximum size of a message, in bytes
kernel.msgmnb = 65536

# Controls the default maxmimum size of a mesage queue
kernel.msgmax = 65536

# Controls the maximum shared segment size, in bytes
kernel.shmmax = 4294967295

# Controls the maximum number of shared memory segments, in pages
kernel.shmall = 268435456

###########################################################################################################

# MODIFIED VERSION -- REPLACES DEFAULTS
# March 12 2012 JP - Based on a Red Hat based distro.

# Disables packet forwarding
net.ipv4.ip_forward=0

# Disables IP source routing
net.ipv4.conf.all.accept_source_route = 0
net.ipv4.conf.lo.accept_source_route = 0
net.ipv4.conf.eth0.accept_source_route = 0
net.ipv4.conf.default.accept_source_route = 0

# Enable IP spoofing protection, turn on source route verification
net.ipv4.conf.all.rp_filter = 1
net.ipv4.conf.lo.rp_filter = 1
net.ipv4.conf.eth0.rp_filter = 1
net.ipv4.conf.default.rp_filter = 1

# Disable ICMP Redirect Acceptance
net.ipv4.conf.all.accept_redirects = 0
net.ipv4.conf.lo.accept_redirects = 0
net.ipv4.conf.eth0.accept_redirects = 0
net.ipv4.conf.default.accept_redirects = 0

# Enable Log Spoofed Packets, Source Routed Packets, Redirect Packets
net.ipv4.conf.all.log_martians = 0
net.ipv4.conf.lo.log_martians = 0
net.ipv4.conf.eth0.log_martians = 0

# Disables IP source routing
net.ipv4.conf.all.accept_source_route = 0
net.ipv4.conf.lo.accept_source_route = 0
net.ipv4.conf.eth0.accept_source_route = 0
net.ipv4.conf.default.accept_source_route = 0

# Enable IP spoofing protection, turn on source route verification
net.ipv4.conf.all.rp_filter = 1
net.ipv4.conf.lo.rp_filter = 1
net.ipv4.conf.eth0.rp_filter = 1
net.ipv4.conf.default.rp_filter = 1

# Disable ICMP Redirect Acceptance
net.ipv4.conf.all.accept_redirects = 0
net.ipv4.conf.lo.accept_redirects = 0
net.ipv4.conf.eth0.accept_redirects = 0
net.ipv4.conf.default.accept_redirects = 0

# Disables the magic-sysrq key
kernel.sysrq = 0

# Decrease the time default value for tcp_fin_timeout connection
net.ipv4.tcp_fin_timeout = 15

# Decrease the time default value for tcp_keepalive_time connection
net.ipv4.tcp_keepalive_time = 1800

# Turn off the tcp_window_scaling
#net.ipv4.tcp_window_scaling = 0

# Turn off the tcp_sack
#net.ipv4.tcp_sack = 0

# Turn off the tcp_timestamps
net.ipv4.tcp_timestamps = 0

# Enable TCP SYN Cookie Protection
net.ipv4.tcp_syncookies = 1

# Enable ignoring broadcasts request
net.ipv4.icmp_echo_ignore_broadcasts = 0

#Disable ALL ICMP
net.ipv4.icmp_echo_ignore_all = 0

# Enable bad error message Protection
net.ipv4.icmp_ignore_bogus_error_responses = 0

# Log Spoofed Packets, Source Routed Packets, Redirect Packets
net.ipv4.conf.all.log_martians = 1

# Increases the size of the socket queue (effectively, q0).
net.ipv4.tcp_max_syn_backlog = 1024

# Increase the tcp-time-wait buckets pool size
net.ipv4.tcp_max_tw_buckets = 1440000

# Allowed local port range
net.ipv4.ip_local_port_range = 2000 65535

########## IPv6 networking start ##############
#DISABLE IPV6
net.ipv6.conf.all.disable_ipv6 = 1
########## IPv6 networking ends ##############

#Enable ExecShield protection
#kernel.exec-shield = 1
#kernel.randomize_va_space = 1

# TCP and memory optimization
# increase TCP max buffer size setable using setsockopt()
#net.ipv4.tcp_rmem = 4096 87380 8388608
#net.ipv4.tcp_wmem = 4096 87380 8388608

# increase Linux auto tuning TCP buffer limits
#net.core.rmem_max = 8388608
#net.core.wmem_max = 8388608
#net.core.netdev_max_backlog = 5000
#net.ipv4.tcp_window_scaling = 1

# increase system file descriptor limit
#fs.file-max = 65535

#Allow for more PIDs
#kernel.pid_max = 65536


Thanks
Alex
