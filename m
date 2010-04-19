From: John Engelke <john.engelke@gmail.com>
Subject: Re: Possible IPTables bug in INPUT interface filtering?
Date: Mon, 19 Apr 2010 15:15:53 -0700
Message-ID: <t2w464fbb2d1004191515hd4f9fe2cofe500bab85945682@mail.gmail.com>
References: <p2l464fbb2d1004152012p719184c9g57ac7c7562994929@mail.gmail.com>
	 <4BC880E0.3070100@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:received:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=2GWRWWxdeWpOS8QaL3QcVcaxeGemNomNfjTHDu9bzO0=;
        b=Ix04oXDMnspgCdYcIXWr0PDJJPyvg/bwPLbnbRV83vKfTY0JznZN1E1ObiccAzNCAz
         nVTGUMBkY+RgtKZBvcSlL/Cc4Fs/oQIR70FUjWVqSBWGtLQzC/WxUhTgKXC5uh38gU7U
         i3kge2JaoWnyZiWkUYLWNx11Q0Rn9ywA1eSBU=
In-Reply-To: <4BC880E0.3070100@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

On Fri, Apr 16, 2010 at 8:23 AM, Pascal Hambourg <pascal.mail@nnnnnn.or=
g> wrote:
> Hello,
>
> John Engelke a =E9crit :
>> Hello IPFilter Guru World,
>
> This list is about Netfilter, not IPFilter.

Right. Well filters and tables aside this message is about IPTables. I
believe that this is the right list, please correct me if it is not.

>
>> I've encountered some strangeness in filtering on a multihomed Linux
>> box, CentOS 5, x86_64, 2.6.18-164.15.1.el5, where using the interfac=
e
>> flag (-i) does not work.
>>
>> So this box has two interfaces on the local subnet, eth0 and eth1.
>
> Are both interfaces connected to the same subnet ? If so, I don't cal=
l
> this "multihomed".

According to the link at http://en.wikipedia.org/wiki/Multihoming ,
this setup can be described as "Multiple Interfaces, Single IP address
per interface". So I'm actually trying to limit load on one interface
using IPTables, which is a little different but nonetheless a variant
on the concept.

>
>> I
>> would like to restrict VNC to only one of the interfaces, eth1. At t=
he
>> start, VNC does not work. So I add this:
>>
>> -A INPUT -i eth1 -p tcp -m multiport --port 5900 -j ACCEPT
>>
>> Then, VNC starts working on eth0 AND eth1.
>
> Are you sure ? How do you know ?

Well I know because I added the line to the iptables rules file in
/etc/sysconfig and restarted the service. It didn't work before I
added the line and restarted. I tested both IPs before and after.

>
>> Since I know the address of eth1, I then put it in explicitly as:
>>
>> -A INPUT -i eth1 -p tcp -d 192.168.1.34 -m multiport --port 5900 -j =
ACCEPT
>>
>> Amazingly, this works and now VNC traffic is only allowed on eth1
>> (address 192.168.1.34). So I believe I am concluding correctly that
>> interface filtering *does not work* for INPUT statements in multihom=
ed
>> machines. I also wonder if it does not work at all for any interface=
=2E
>
> It works for lots of people - including myself - who run multihomed
> boxes such as routers.

So are you stating that without providing the IP address that you are
able to filter solely on the interface name (i.e. -i eth0 or -i eth1)?
I bet there is something else different like subnet addressing, but I
really don't think that should matter, anyway.

>
> If both interfaces are connected to the same subnet, by default your =
box
> accepts packets destined to any local non-loopback address on any
> interface, including packets destined to the address assigned to eth1=
 on
> eth0 and vice versa. This is because Linux enforces the "weak" host m=
odel.

Okay, fine. But I don't see anything in either the man pages for
IPTables nor in the examples linked from netfilter.org to indicate
this. If the '-i' interface flag only works under certain conditions
the documentation ought to state those conditions. I RTFM for this
one. Bottom line is interface filtering doesn't really work when it
requires IP/subnet parameters too. Bug or not it's unexpected
behavior.
