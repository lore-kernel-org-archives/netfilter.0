From: =?iso-8859-1?q?Tato=20L?= <tatolv@yahoo.es>
Subject: Help  NAT
Date: Thu, 29 May 2003 08:39:53 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030529063953.55409.qmail@web42006.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org
Cc: dannymo20@yahoo.com

Hi friends

I have a problem I need help

My Net is :

eth0 :200.200.200.2
eth1:192.168.20.1
web/mail nic1:192.168.20.3   Public:200.200.200.2
web/mail nic2:192.168.50.3
wingate nic1:192.168.20.2
wingate nic2:192.168.50.1

workstation:192.168.50.X


            eth0|     |eth1        =20
ROUTER----------|LINUX|-----------|Wingate|---
	 	|     |              192.168.50.x =20
		|     |           |Web/Mail|---


By administrative reasons my network is this form :(

But firewall in front of the Wingate has been put
=20

The rules of firewall apparently are ok !, services as
SMTP, POP3,Web  are ok.... but
in my localnet since  a workstation  i cant access
www.midomain.com( domain of my comany ), just for IP
local (192.168.20.3)
I dont have a separate DNS for my LAN .

I tried  "Destination NAT Onto the Same Network"=20
http://www.netfilter.org/documentation/HOWTO//NAT-HOWTO-10.html
but dont work

Some help please, several days and I cant solve this
problem

Thanks

TaTo










___________________________________________________
Yahoo! Messenger - Nueva versi=F3n GRATIS
Super Webcam, voz, caritas animadas, y m=E1s...
http://messenger.yahoo.es

