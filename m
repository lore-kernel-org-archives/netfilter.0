From: Aaron Clausen <mightymartianca@gmail.com>
Subject: Gateway With Multiple Internal Networks
Date: Thu, 13 Oct 2011 20:06:09 -0700
Message-ID: <CAEH2fGyA9+sXV6toN9f7azg0emBnrTtsE-Q_CdJ_KfQ1bSe5dQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=XkqDFwieVQuh8RB/SelrcKueQUAbBsnq+ExhYTcZPB8=;
        b=gBlQU7EKXRdLD0usngDItC1Vhy5udg3tEeNUhlHJBQOYy5ytgDDlanQQOYM7fj9oLw
         SmLHQ1FPLL58Ie9Ts9n7lIwIDZOtZMDtZYAPTWz1tb6HrxaoiMEPRO1xT8p7qp75L72B
         UMfMvCfnaLjoYY3qG/Sm65ed3KZnfJbntyjrQ=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

This is driving me crazy, and I cannot seem to get it working
properly.  I have a gateway with two internal networks served by
different interfaces:

eth0 - External interface
eth1 - Internal network #1
eth2 - Internal network #2
tun0 - OpenVPN server interface

Basically I want the computers on eth1 and tun0 to be able to have
full access to each other and to workstations on eth2.  Computers on
eth2 should only have access via NAT redirection to any machines on
eth1 and tun0, with the exception of one server on internal network #2
which I would like to have full access to any machines on eth1 and
tun0 interfaces.

I have it semi-working, but what appears is that the server on the
eth2 network that I want to have full access to eth1 and tun0 seems to
basically stop being able to be accessed from computers on those
networks for certain periods of time.  If I start pinging from that
computer, the outside computers can start seeing it again.

I'm no wizard at iptables, so have come up with this iptables ruleset
via Webmin.  Apologies for it being chaotic and messy.

*nat
:PREROUTING ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
:POSTROUTING ACCEPT [0:0]
-A POSTROUTING -s 192.168.1.0/24 -d 192.168.1.5 -j SNAT --to-source
192.168.1.254
-A POSTROUTING -s 192.168.1.0/24 -d 192.168.1.221 -j SNAT --to-source
192.168.1.254
-A PREROUTING -p tcp -m tcp -d xxx.xxx.xxx.xxx --dport 80 -j DNAT
--to-destination 192.168.1.5
-A PREROUTING -p tcp -m tcp -d xxx.xxx.xxx.xxx --dport 8080 -j DNAT
--to-destination 192.168.1.221
-A PREROUTING -s 192.168.1.21 -i eth1 -j ACCEPT
-A PREROUTING -s 192.168.1.222 -i eth1 -j ACCEPT
-A PREROUTING -p tcp -m tcp -m state -s 192.168.1.0/24 ! -d
192.168.1.0/24 -i eth1 --dport 80 --sport 1024:65535 --state
NEW,ESTABLISHED,RELATED -j REDIRECT --to-ports 3128
-A PREROUTING -p tcp -m tcp -i eth0 --dport 25 -j DNAT
--to-destination 192.168.1.5:25
-A PREROUTING -p tcp -m tcp -i eth0 --dport 53 -j DNAT
--to-destination 192.168.1.5:53
-A POSTROUTING -s 10.0.2.0/23 -d 192.168.1.5 -j SNAT --to-source 192.168.1.254
-A PREROUTING -p udp -m udp -i eth0 --dport 53 -j DNAT
--to-destination 192.168.1.5:53
-A PREROUTING -p tcp -m tcp -i eth0 --dport 80 -j DNAT
--to-destination 192.168.1.5:80
-A PREROUTING -p tcp -m tcp -i eth0 --dport 110 -j DNAT
--to-destination 192.168.1.2:110
-A PREROUTING -p tcp -m tcp -i eth0 --dport 143 -j DNAT
--to-destination 192.168.1.2:143
-A PREROUTING -p tcp -m tcp -i eth0 --dport 2525 -j DNAT
--to-destination 192.168.1.2:2525
-A PREROUTING -p tcp -m tcp -i eth0 --dport 8000 -j DNAT
--to-destination 192.168.1.2:8000
-A PREROUTING -p tcp -m tcp -i eth0 --dport 8080 -j DNAT
--to-destination 192.168.1.221:8080
-A PREROUTING -j ACCEPT
-A POSTROUTING -s 10.0.2.0/23 -d 192.168.1.221 -j SNAT --to-source 192.168.1.254
-A POSTROUTING ! -s 192.168.0.0/255.255.248.0 -o tun0 -j SNAT
--to-source 192.168.1.254
-A POSTROUTING -o eth0 -j MASQUERADE
COMMIT
*mangle
:PREROUTING ACCEPT [311:25759]
:INPUT ACCEPT [311:25759]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [228:49714]
:POSTROUTING ACCEPT [228:49714]
COMMIT
*filter
:FORWARD ACCEPT [0:0]
:INPUT ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
-A INPUT -m state -i eth0 --state RELATED,ESTABLISHED -j ACCEPT
-A INPUT -i eth1 -j ACCEPT
-A INPUT -i eth2 -j ACCEPT
-A FORWARD -s 10.0.2.2 -j ACCEPT
-A FORWARD -d 10.0.2.2 -j ACCEPT
-A INPUT -i lo -j ACCEPT
-A FORWARD -m state -d 192.168.1.0/24 -i eth2 --state
ESTABLISHED,RELATED -j ACCEPT
-A FORWARD -m state -i eth2 -o tun+ --state ESTABLISHED,RELATED -j ACCEPT
-A FORWARD -i eth1 -o eth0 -j ACCEPT
-A INPUT -i tun+ -j ACCEPT
-A FORWARD -m state -i eth0 -o eth1 --state RELATED,ESTABLISHED -j ACCEPT
-A FORWARD -i tun+ -j ACCEPT
-A FORWARD -p tcp -m tcp -s 10.0.2.0/23 -d 192.168.1.2 --dport 8530 -j ACCEPT
-A FORWARD -p tcp -m tcp -s 10.0.2.0/23 -d 192.168.1.5 --dport 80 -j ACCEPT
-A FORWARD -p tcp -m tcp -s 10.0.2.0/23 -d 192.168.1.221 --dport 8080 -j ACCEPT
-A FORWARD -i eth2 -o eth1 -j DROP
-A FORWARD -i eth2 -o tun+ -j DROP
COMMIT


-- 
Aaron Clausen
mightymartianca@gmail.com
