From: "Iskender GUNUSEN" <iskendergunusen@hotmail.com>
Subject: need help for IPTABLES configuration...
Date: Sat, 01 Jun 2002 22:53:58 +0300
Sender: netfilter-admin@lists.samba.org
Message-ID: <F81nxXUCj9VKfl8ClFV00009afe@hotmail.com>
Reply-To: iskender.gunusen@datapro.com.tr
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; format=flowed; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: netfilter@lists.samba.org

I am using redhat 7.2 with IPTABLES ,

my network consists of 1 LAN and 2 LEASED LINES.

LOCAL NETWORK is 10.1.0.0
WAN1 is x.x.x.64 , SM is 255.255.255.192
(begins from x.x.x.65 to x.x.x.127)
WAN2 is y.y.y.176 , SM is 255.255.255.248
(begins from y.y.y.177 to y.y.y.183)

what I want to do is ,

- match 10.1.1.11 with x.x.x.125 SMTP/POP3 server SNAT and DNAT
- match user access with y.y.y.180 (http,..etc.)
- in other words for some traffic use WAN1 and use WAN2 for some

all the examples include 1 LAN and 1 WAN, what if I have 2 ?

thanks from now

iskender

_________________________________________________________________
Join the world=92s largest e-mail service with MSN Hotmail.=20
http://www.hotmail.com


