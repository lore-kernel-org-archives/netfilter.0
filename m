From: "j davis" <davis_compz@hotmail.com>
Subject: Re: simple, but not for me
Date: Sun, 30 Jun 2002 19:35:48 +0000
Sender: netfilter-admin@lists.samba.org
Message-ID: <F44d3MI9VsZDgw0V8Lr00002504@hotmail.com>
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


if you are dnating from 192.168.0.1:80 to whatever:80 you do not
need to say port 80 again....whatever port you list as destination,
as long as you need to dnat to the same port, will be the port
traffic is dnated to.

jd
also rules needed....

iptables -A PREROUTING -d 192.168.0.1 -p tcp --dport 80 -j DNAT=20
--to-destination 192.168.0.8

iptables -A FORWARD -d 192.168.0.8 -p tcp --dport 80 -j ACCEPT
iptables -A FORWARD -s 192.168.0.8 -m state --state RELATED,ESTABLISHED


>From: Marc Carter <marccarter@speakeasy.net>
>To: netfilter@lists.samba.org
>Subject: Re: simple, but not for me
>Date: Sun, 30 Jun 2002 12:48:37 -0400
>MIME-Version: 1.0
>Received: from [198.186.203.85] by hotmail.com (3.2) with ESMTP id=20
>MHotMailBEE882880019400431A4C6BACB55895D0; Sun, 30 Jun 2002 09:53:32 -0700
>Received: from va.samba.org (localhost [127.0.0.1])by lists.samba.org=20
>(Postfix) with ESMTPid 879E9416F; Sun, 30 Jun 2002 09:53:30 -0700 (PDT)
>Received: from mail.speakeasy.net (mail14.speakeasy.net [216.254.0.214])by=
=20
>lists.samba.org (Postfix) with ESMTP id 956F7411Bfor=20
><netfilter@lists.samba.org>; Sun, 30 Jun 2002 09:52:06 -0700 (PDT)
>Received: (qmail 20398 invoked from network); 30 Jun 2002 16:51:59 -0000
>Received: from unknown (HELO speakeasy.net) ([66.93.84.18])=20
>(envelope-sender <marccarter@speakeasy.net>)          by=20
>mail14.speakeasy.net (qmail-ldap-1.03) with RC4-MD5 encrypted SMTP        =
 =20
>for <netfilter@lists.samba.org>; 30 Jun 2002 16:51:59 -0000
From netfilter-admin@lists.samba.org Sun, 30 Jun 2002 09:54:28 -0700
>Delivered-To: netfilter@lists.samba.org
>Message-ID: <3D1F3665.3020204@speakeasy.net>
>User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.0rc3)=20
>Gecko/20020523
>References: <20020630132725.896984212@lists.samba.org>
>Sender: netfilter-admin@lists.samba.org
>Errors-To: netfilter-admin@lists.samba.org
>X-BeenThere: netfilter@lists.samba.org
>X-Mailman-Version: 2.0.8
>Precedence: bulk
>List-Help: <mailto:netfilter-request@lists.samba.org?subject=3Dhelp>
>List-Post: <mailto:netfilter@lists.samba.org>
>List-Subscribe:=20
><http://lists.samba.org/listinfo/netfilter>,<mailto:netfilter-request@list=
s.samba.org?subject=3Dsubscribe>
>List-Id: netfilter user discussion list <netfilter.lists.samba.org>
>List-Unsubscribe:=20
><http://lists.samba.org/listinfo/netfilter>,<mailto:netfilter-request@list=
s.samba.org?subject=3Dunsubscribe>
>List-Archive: <http://lists.samba.org/pipermail/netfilter/>
>
>
>
>netfilter-request@lists.samba.org wrote:
>
>[snip]
>
> > This is what you need to port forward (assuming standard ports):
> >
> > #Forward web services to internal host iptables -t nat -A PREROUTING
> > -p tcp -d $extip --dport 80 -j DNAT--to 192.168.0.8:80
> >
> > #Forward ssh to internal host iptables -t nat -A PREROUTING -p tcp -d
> > $extip --dport 22 -j DNAT--to 192.168.0.8:22
> >
> > #Forward mysql to internal host iptables -t nat -A PREROUTING -p tcp
> > -d $extip --dport 3306 -j DNAT--to 192.168.0.8:3306
> >
> > Remember to shut off the above services on your firewall box.
>
>This last has me curious.  If I shut off ssh (port 22) on the firewall,
>then I can't get into it to work on it (it's headless and far far away
>from a chair -- and just now what seems more important, a fan).
>
>Right now, ssh into the firewall box from the ext_if goes straight to
>one of the internal machines (but only allowed from one other trusted
>machine, 1.2.3.4 in the e.g.), but an ssh request from the internal
>network (into the int_if) stays on the firewall box.
>
>Sort of looks like this:
>
>All chains are flushed and set to default DROP
>
>The nat chain rules are
>
>$IPTABLES -t nat -A PREROUTING -i $EXT_IF -s 1.2.3.4 \
>   -d my.static.ip.address -p tcp --dport 22 -j DNAT \
>   --to 192.168.1.2
>
>$IPTABLES -t nat -A POSTROUTING -o $EXT_IF -s 192.168.1.2 \
>   -p tcp --sport 22 -j SNAT --to my.static.ip.address
>
>The FORWARD chain rule allows port 22 (originating from trusted machine)
>from the firewall to the internal box and then drops the rest
>
>$IPTABLES -A FORWARD -s 1.2.3.4 -d 192.168.1.2 -p tcp -j ACCEPT
>$IPTABLES -A FORWARD -p tcp --dport 22 -j DROP
>
>And then an INPUT rule to allow getting into the box from the internal
>network
>
>$IPTABLES -A INPUT -s $INT_NET -i INT_IF -j ACCEPT
>
>but disallows spoofing from the outside
>
>$IPTABLES -A INPUT -s INT_NET -i EXT_IF -j DROP
>
>This seems to work.  If anyone sees anything stupid here, let me know.
>I hate being stupid.
>
>Thanks.
>
>m
>
>
>
>--
>Marc Carter
>Assistant Professor, Itinerant Scientist,
>         Inveterate Skeptic, Former Surfer.
>---
>"You can't have a market system that really depends
>on everybody behaving as saints."
>------
>Ken Rose, OSU's National Regulatory Research Institute
>
>


thanks,
jd

jd@taproot.bz
http://www.taproot.bz

_________________________________________________________________
Join the world=92s largest e-mail service with MSN Hotmail.=20
http://www.hotmail.com


