From: Alexandre Chaves <achaves@rbscomp.com.br>
Subject: Iptables and ipsec racoon
Date: Thu, 15 Jan 2015 10:55:55 -0200
Message-ID: <CABt0TT8rcd8Ng6i_n7zRDW+oW4yfmazmKb3nuvP2GRoe31cQMw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: netfilter@vger.kernel.org

Dear Friends,

I made up a Ipsec connection between my firewall ( in a debian 7.0)
and a Checkpoint.
I worked fine, the net admin from Checkpoint asked me that all packets
to be source nated to 192.168.191.231.
by that point everything was OK.

Lan -------------- Firewall Debian
--------------------------Checkpoint ------------- Remote Lan
192.168.3.0/24             nated to 192.168.191.231
                       172.26.51.27/32

So I did:

echo 1 > /proc/sys/net/ipv4/ip_forward
iptables -t nat -A POSTROUTING  -s 192.168.3.0/24 -j SNAT --to 192.168.=
191.231

This firewall is used just to this ipsec connection.

When I "tcdpump -i any"  I see the connection from my lan machine
going throught firewall (src 192.168.3.10, dst 172.26.51.27). I see
the connection nated src 192.168.191.231 and dst 172.26.51.27. I see
the return from 172.26.51.27 and dst 192.168.191.231, but seens that
my firewall cant take out the nat to delivery the packet to
192.168.3.10

I changed the nat to
iptables -t nat -A POSTROUTING  -j SNAT --to 192.168.191.231

And tryed to telnet 172.26.51.27 80 from the firewall. I see the nated
packets going and the return to 192.168.191.231, but it doesnt connect
anyway.


Have someone seen something like this? I have no Idea what should I do.

Thanks in advance,
#####################
07:50:49.502784 IP 179.253.9.161.56956 > 172.26.51.27.23: Flags [S],
seq 2265898310, win 14600, options [mss 1460,sackOK,TS val 62146 ecr
0,nop,wscale 5], length 0
07:50:51.506794 IP 179.253.9.161.56956 > 172.26.51.27.23: Flags [S],
seq 2265898310, win 14600, options [mss 1460,sackOK,TS val 62647 ecr
0,nop,wscale 5], length 0
07:50:55.667629 IP 179.253.9.161.36936 > 172.26.51.27.80: Flags [S],
seq 801693741, win 14600, options [mss 1460,sackOK,TS val 63687 ecr
0,nop,wscale 5], length 0
07:50:56.666790 IP 179.253.9.161.36936 > 172.26.51.27.80: Flags [S],
seq 801693741, win 14600, options [mss 1460,sackOK,TS val 63937 ecr
0,nop,wscale 5], length 0
07:50:58.670793 IP 179.253.9.161.36936 > 172.26.51.27.80: Flags [S],
seq 801693741, win 14600, options [mss 1460,sackOK,TS val 64438 ecr
0,nop,wscale 5], length 0
07:52:05.124955 IP 192.168.191.231.49751 > 172.26.51.27.80: Flags [S],
seq 3949439034, win 8192, options [mss 1460,nop,wscale
8,nop,nop,sackOK], length 0
07:52:05.125044 IP 192.168.191.231.49752 > 172.26.51.27.80: Flags [S],
seq 3520292356, win 8192, options [mss 1460,nop,wscale
8,nop,nop,sackOK], length 0
07:52:05.153495 IP 172.26.51.27.80 > 192.168.191.231.49751: Flags
[S.], seq 4066140458, ack 3949439035, win 8192, options [mss
1460,nop,wscale 8,nop,nop,sackOK], length 0
07:52:05.153540 IP 172.26.51.27.80 > 192.168.191.231.49752: Flags
[S.], seq 1445843914, ack 3520292357, win 8192, options [mss
1460,nop,wscale 8,nop,nop,sackOK], length 0
07:52:07.181609 IP 192.168.191.231.49777 > 172.26.51.27.80: Flags [S],
seq 3551917745, win 8192, options [mss 1460,nop,wscale
8,nop,nop,sackOK], length 0
07:52:07.205838 IP 172.26.51.27.80 > 192.168.191.231.49777: Flags
[S.], seq 3920706595, ack 3551917746, win 8192, options [mss
1460,nop,wscale 8,nop,nop,sackOK], length 0
07:52:08.122247 IP 192.168.191.231.49751 > 172.26.51.27.80: Flags [S],
seq 3949439034, win 8192, options [mss 1460,nop,wscale
8,nop,nop,sackOK], length 0
07:52:08.122309 IP 192.168.191.231.49752 > 172.26.51.27.80: Flags [S],
seq 3520292356, win 8192, options [mss 1460,nop,wscale
8,nop,nop,sackOK], length 0
07:52:08.145803 IP 172.26.51.27.80 > 192.168.191.231.49752: Flags
[S.], seq 1445843914, ack 3520292357, win 8192, options [mss
1460,nop,wscale 8,nop,nop,sackOK], length 0
07:52:08.153569 IP 172.26.51.27.80 > 192.168.191.231.49751: Flags
[S.], seq 4066140458, ack 3949439035, win 8192, options [mss
1460,nop,wscale 8,nop,nop,sackOK], length 0
07:52:10.177842 IP 192.168.191.231.49777 > 172.26.51.27.80: Flags [S],
seq 3551917745, win 8192, options [mss 1460,nop,wscale
8,nop,nop,sackOK], length 0
07:52:10.206642 IP 172.26.51.27.80 > 192.168.191.231.49777: Flags
[S.], seq 3920706595, ack 3551917746, win 8192, options [mss
1460,nop,wscale 8,nop,nop,sackOK], length 0
07:52:14.118140 IP 192.168.191.231.49751 > 172.26.51.27.80: Flags [S],
seq 3949439034, win 8192, options [mss 1460,nop,nop,sackOK], length 0
07:52:14.118195 IP 192.168.191.231.49752 > 172.26.51.27.80: Flags [S],
seq 3520292356, win 8192, options [mss 1460,nop,nop,sackOK], length 0
07:52:14.146954 IP 172.26.51.27.80 > 192.168.191.231.49752: Flags
[S.], seq 1445843914, ack 3520292357, win 65535, options [mss
1460,nop,nop,sackOK], length 0
07:52:14.153770 IP 172.26.51.27.80 > 192.168.191.231.49751: Flags
[S.], seq 4066140458, ack 3949439035, win 65535, options [mss
1460,nop,nop,sackOK], length 0
07:52:16.177248 IP 192.168.191.231.49777 > 172.26.51.27.80: Flags [S],
seq 3551917745, win 8192, options [mss 1460,nop,nop,sackOK], length 0
07:52:16.206543 IP 172.26.51.27.80 > 192.168.191.231.49777: Flags
[S.], seq 3920706595, ack 3551917746, win 65535, options [mss
1460,nop,nop,sackOK], length 0
07:52:26.148287 IP 172.26.51.27.80 > 192.168.191.231.49752: Flags [R],
seq 1445843915, win 0, length 0
07:52:26.155181 IP 172.26.51.27.80 > 192.168.191.231.49751: Flags [R],
seq 4066140459, win 0, length 0
07:52:28.181149 IP 192.168.191.231.49806 > 172.26.51.27.80: Flags [S],
seq 2491764335, win 8192, options [mss 1460,nop,wscale
8,nop,nop,sackOK], length 0
07:52:28.205334 IP 172.26.51.27.80 > 192.168.191.231.49806: Flags
[S.], seq 3075031182, ack 2491764336, win 8192, options [mss
1460,nop,wscale 8,nop,nop,sackOK], length 0
07:52:28.206865 IP 172.26.51.27.80 > 192.168.191.231.49777: Flags [R],
seq 3920706596, win 0, length 0
07:52:31.190385 IP 192.168.191.231.49806 > 172.26.51.27.80: Flags [S],
seq 2491764335, win 8192, options [mss 1460,nop,wscale
8,nop,nop,sackOK], length 0
07:52:31.208032 IP 172.26.51.27.80 > 192.168.191.231.49806: Flags
[S.], seq 3075031182, ack 2491764336, win 8192, options [mss
1460,nop,wscale 8,nop,nop,sackOK], length 0
07:52:37.190906 IP 192.168.191.231.49806 > 172.26.51.27.80: Flags [S],
seq 2491764335, win 8192, options [mss 1460,nop,nop,sackOK], length 0
07:52:37.208951 IP 172.26.51.27.80 > 192.168.191.231.49806: Flags
[S.], seq 3075031182, ack 2491764336, win 65535, options [mss
1460,nop,nop,sackOK], length 0
07:52:49.208786 IP 172.26.51.27.80 > 192.168.191.231.49806: Flags [R], =
seq 3

Abra=C3=A7os,

Alexandre Chaves
+55 61 9244-4654
