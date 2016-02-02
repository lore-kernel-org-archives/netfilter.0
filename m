From: GUNA <gbalasun@gmail.com>
Subject: Failed to start IPv4 firewall with iptables
Date: Tue, 2 Feb 2016 15:10:11 -0500
Message-ID: <CAHW=wSe8p2=2Rwfx3y0Go9rAYBwOANCO0cnEj0_CzpUcT6g=Mg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=gzg7EoOelJz+hRitJZAQZcqbdKjV+WRbC0Yign7nHsc=;
        b=WxCodC0zViz3ni73ZelTCqAIsHFV2oyBKd7KynA9lZ5eWdrpKuGtlc693tz7/MwjKs
         /rv14H2D46BJ+dNRiJCV3VI2JkfLHq0J55+ezsq0W+pyW1eBeBfsmjK3nA1OZGo4V7/6
         xlJzoW3cXuW+cfbJ2O2cR/KYMzmKZiDCq+28FjmkDU7ZPOhRmpgwVnB81nPP84ijQgIu
         bpXarPHjqp/0JTvXw6R9EN0WGq3QwmFblypKRNdltS22IhjKpVk77WMll5ZJwJjwYwVl
         xIEZf0/lZ7lliktWzCi1C6WlrTZR73swRO1l+mAGknHkv/GFJWUf3uN3GOFFk7Zybwzb
         uBvQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,

I have updated Fedora core 16 Kernel from 3.4.2 to 4.4.0. Once the
system is rebooted with new kernel 4.4.0, the iptables loaded but not
started.

// logs
Failed to start IPv4 firewall with iptables [FAILED]
See 'systemctl status iptables.service' for details.
Started IPv6 firewall with ip6tables [ OK ]

[root@localhost grub2]# systemctl status iptables.service
iptables.service - IPv4 firewall with iptables
Loaded: loaded (/lib/systemd/system/iptables.service; enabled)
Active: failed since Wed, 27 Jan 2016 09:20:39 -0500; 5h 7min ago
Process: 936 ExecStart=/usr/libexec/iptables.init start (code=exited,
status=1/FAILURE)
CGroup: name=systemd:/system/iptables.service

Here are list of modules loaded related to ip:
lsmod |grep ip
iptable_nat 16384 0
nf_nat_ipv4 16384 1 iptable_nat
nf_nat 24576 1 nf_nat_ipv4
nf_log_ipv4 16384 0
nf_log_common 16384 1 nf_log_ipv4
ip6t_REJECT 16384 0
nf_reject_ipv6 16384 1 ip6t_REJECT
nf_conntrack_ipv6 20480 0
nf_defrag_ipv6 36864 1 nf_conntrack_ipv6
ip6table_filter 16384 1
nf_conntrack_ipv4 16384 3
ip6_tables 28672 1 ip6table_filter
nf_defrag_ipv4 16384 1 nf_conntrack_ipv4
nf_conntrack 106496 5
nf_nat_ipv4,nf_nat,nf_conntrack_ipv6,nf_conntrack_ipv4,xt_state

After started the service manually, then the iptables started as follows:
systemctl start iptables.service
systemctl status iptables.service
iptables.service - IPv4 firewall with iptables
Loaded: loaded (/lib/systemd/system/iptables.service; enabled)
Active: active (exited) since Fri, 01 Jan 2010 14:52:20 -0500; 1s ago
Process: 18474 ExecStart=/usr/libexec/iptables.init start
(code=exited, status=0/SUCCESS)
CGroup: name=systemd:/system/iptables.service

Here are the rules:
more /etc/sysconfig/iptables

# Firewall configuration written by system-config-firewall
# Manual customization of this file is not recommended.
*filter
:INPUT ACCEPT [0:0]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
-A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
-A INPUT -p icmp -j ACCEPT
-A INPUT -i lo -j ACCEPT
-A INPUT -m state --state NEW -m tcp -p tcp --dport 22 -j ACCEPT
-I FORWARD -m physdev --physdev-is-bridged -j ACCEPT
COMMIT

I rebuilt the kernel and tested with all of the Netfilter options on,
but issue remains same.

Please confirm iptables v1.4.12 is compatible with latest Kernel 4.4.0 as well.

Note, the ip6_tables loaded and started without any issue.

Any help is appreciated.

Thank you,
Guna
