From: "Hard__warE" <hard__ware@hotmail.com>
Subject: RE: Two Interfaces Same Network / Netmask
Date: Wed, 12 Jun 2002 05:05:41 +1000
Sender: netfilter-admin@lists.samba.org
Message-ID: <000501c2117a$fae21cc0$7b0010ac@dynamicaccess.lan>
Reply-To: "Hard__warE" <hard__ware@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org
Cc: jpappas@sharemedia.com

Re:  Two Interfaces Same Network / Netmask..


yer thats my Problem the kenel selects the path, then from there you have no
control of packets on which adapetr they leave ect ...

yes both Adapters will be on the same Physical Network / Ethernet

and about my IPROUTE question i belive what is going to be alot better for
me ... :D

im going to use either Zebra or Gated as BGP / RiP and OSPF Router that will
notify

all its peer Routers (eg my ISP's Router) that it is the gateway to access
that Entire Class C

Network i own ... :D

then i can have a IPTABLES box /w Bridgeing,  that will allow me to Drop
packets

Redirect / LOG  Packets ,  while still acting as the Bridge from my Local
Lan to my BGP Router which

will be my Deafult Gateway to the net ...


thanks for ya Help eveyone on reminding me what a BGP  Router does / is ....
lol

damm brain has had to much lack of Rest while ive been working on this
Project  ... lol .. :D

catch yas ..


