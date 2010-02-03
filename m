From: paddy joesoap <paddyjoesoap@gmail.com>
Subject: Does stateful filtering automatically prevent nmap and bogon spoofing 
	or are stateless rules also required?
Date: Wed, 3 Feb 2010 20:55:46 +0000
Message-ID: <ac5c74141002031255y10f64f0cq755efac338d55650@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type;
        bh=wdEjCn4bk1gu2+/BR/NP8zzWmvFa01Hy3zODgNjGKgc=;
        b=YA48yWs6tQHdLA01RNE/UTQkxLpRXPW+YJN+4IscGJWuDVH6kt4wP1h4lbFI1fnJ/B
         FXqoJHFza4YjpgxDvncJHsWYEEHW1r9C5Wzk/RVOt1vcj5IVZ6OxuuEuXYiaUyKdtbba
         puY2iEpHfP42aeeRCdITRu4sEUkHgJosLAeOQ=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi there,

It is advisable to employ anti-spoofing filter rules and nmap scanning
filter rules inconjuction with a simple stateful firewall rule-set on
a laptop for example?

# drop policy
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT DROP

# Allow unlimited traffic on the loopback interface.
iptables -A INPUT  -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

#Stateful rules:
# Allow TCP/UDP by stateful tracking
iptables -A INPUT  -p tcp -m state --state ESTABLISHED  -j ACCEPT
iptables -A OUTPUT -p tcp -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A INPUT  -p udp -m state --state ESTABLISHED  -j ACCEPT
iptables -A OUTPUT -p udp -m state --state NEW,ESTABLISHED -j ACCEPT

Question: Does stateful tracking handle network ports scans
automatically. For example, it knows if a packet created by an
nmap-ack scan has previous history in the state table. If the state
table has no record, that is, a corresponding SYN packet or other
related ACK packets then drop the nmap-ack packet.

Or perhaps it is advisable to put these rules in front of the stateful rules.
Comments?

#Prevent nmap scans
IPTABLES -A INPUT -p tcp --tcp-flags SYN,ACK SYN,ACK -m state --state
NEW -j DROP
iptables -A INPUT -p tcp --tcp-flags ALL NONE -j DROP
iptables -A INPUT -p tcp --tcp-flags SYN,FIN SYN,FIN -j DROP
iptables -A INPUT -p tcp --tcp-flags SYN,RST SYN,RST -j DROP
iptables -A INPUT -p tcp --tcp-flags ALL SYN,RST,ACK,FIN,URG -j DROP
iptables -A INPUT -p tcp --tcp-flags FIN,RST FIN,RST -j DROP
iptables -A INPUT -p tcp --tcp-flags ACK,FIN FIN -j DROP
iptables -A INPUT -p tcp --tcp-flags ACK,PSH PSH -j DROP
iptables -A INPUT -p tcp --tcp-flags ACK,URG URG -j DROP

Question: does stateful tracking detect spoofed packets claiming to
come from the internal network?
My guess is no, or at least based on the stateful rules I defined above.
Perhaps I need to place the following RFC1918 and RFC3330
recommendations before my stateful rules also.
Comments?

# RFC bogon recommendations
iptables -A INPUT -s 10.0.0.0/8     -j DROP
iptables -A INPUT -s 172.16.0.0/12  -j DROP
#iptables -A INPUT -s 192.168.0.0/16 -j DROP # network laptop operates
in uses this ip range.
iptables -A INPUT -s 224.0.0.0/4    -j DROP
iptables -A INPUT -s 240.0.0.0/5    -j DROP
iptables -A INPUT -s 127.0.0.0/8    -j DROP
iptables -A INPUT -s 0.0.0.0/8       -j DROP
iptables -A INPUT -d 255.255.255.255 -j DROP
iptables -A INPUT -s 169.254.0.0/16  -j DROP

In addition, perhaps controlling ICMP packets or UDP DNS and DHCP
traffic flows are also required.

All comments welcome,
Paddy.
