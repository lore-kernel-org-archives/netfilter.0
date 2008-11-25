From: Joris Korbeeck <korbeeck@hotmail.com>
Subject: Tracking broadcasting replies *only* using 'conntrack'
Date: Tue, 25 Nov 2008 04:42:28 +0100
Message-ID: <COL106-W8151DEB519AE7145178A79D30B0@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org


 /proc/net/ip_conntrack shows the following record after running 'nmblo=
okup =ABhostname=BB':

udp 17 26 src=3D192.168.1.2 dst=3D192.168.1.255 sport=3D43290 dport=3D1=
37 packets=3D3 bytes=3D234 [UNREPLIED] src=3D192.168.1.255 dst=3D192.16=
8.1.2 sport=3D137 dport=3D43290 packets=3D0 bytes=3D0 mark=3D0 secmark=3D=
0 use=3D1

 Almost all traffic has been blocked using Ubuntu's ufw (thus actually =
iptables). I want to *allow* replies on this broadcast request using a =
rule which looks like:

-A ufw-before-input -m conntrack --ctstate ESTABLISHED -p udp -s 192.16=
8.1.0/24 --sport 137 -j ACCEPT

 But unfortunately 'conntrack' doesn't recognize the sender's IP addres=
s (e.g. 192.168.1.3) as a 'member' of 192.168.1.255. Does anyone have a=
 solution to allow these replies to hostname resolution requests which =
make use of random ports?

_________________________________________________________________
Express yourself instantly with MSN Messenger! Download today it's FREE=
!
http://messenger.msn.click-url.com/go/onm00200471ave/direct/01/