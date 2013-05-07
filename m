From: "tian fang" <tianfang@gmail.com>
Subject: RE: Fwd: ipset and counters
Date: Tue, 7 May 2013 20:05:04 +0800
Message-ID: <002b01ce4b1b$1e766980$5b633c80$@com>
References: <51752B00.8090908@metu.edu.tr> <51753143.8090908@metu.edu.tr> <alpine.DEB.2.00.1304221554230.16792@blackhole.kfki.hu> <5175432F.2060304@metu.edu.tr> <alpine.DEB.2.00.1304221921001.19576@blackhole.kfki.hu> <loom.20130506T151314-549@post.gmane.org> <alpine.DEB.2.00.1305061535250.12392@blackhole.kfki.hu> <003a01ce4a68$7ccb5e40$76621ac0$@com> <alpine.DEB.2.00.1305062022050.15306@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:from:to:cc:references:in-reply-to:subject:date
         :message-id:mime-version:content-type:content-transfer-encoding
         :x-mailer:thread-index:content-language;
        bh=YWIVdmbF2L+HqPkS/+/g9BUVOPGgNwkY2jruUaOMfGQ=;
        b=OChXfLIEG4AIt0VOlh0zSsOHQKQWnM2VTduscB+TEJPSOYZDizC5iCjMs3R5Rd4ZHD
         vBFKttvo8d60TO+/dBvA5JScSE4BqwZ19EoFtTAqnytUzrIJy+2TlnrXSJvDq1cGvqgG
         Lm9NOK0jLFq8IrfUzGzajv+cS0XhV8Vgf6Oz1OY/nCV9MiewiBa7ZF06mqv/1yWTQTHG
         tAVL9TOUP58FRaJ4iui7hruRJfgBk2TiI1s3E3ZdCwRDU2VM4p7aV6qkvQdOp3tFwoMe
         nIfpYTa180f8aTyyyySwFKY6Rz3bkgH0zGyquPkI7xPWqFH1XbenuGzyEsfJrlFUB0Tr
         mZVA==
In-Reply-To: <alpine.DEB.2.00.1305062022050.15306@blackhole.kfki.hu>
Content-Language: zh-cn
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: 'Jozsef Kadlecsik' <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org



-----Original Message-----
=46rom: Jozsef Kadlecsik [mailto:kadlec@blackhole.kfki.hu]=20
Sent: 2013=C4=EA5=D4=C27=C8=D5 2:28
To: tian fang
Cc: netfilter@vger.kernel.org
Subject: RE: Fwd: ipset and counters

On Mon, 6 May 2013, tian fang wrote:

> > > > create SETNAME bitmap:ip range IP/CIDR|FROM-TO
> > > >                [netmask CIDR] [timeout VALUE] [counters]
> > >=20
> > > So the ipset binary does support counters. Then what is the outpu=
t=20
> > > of "modinfo ip_set_bitmap_ip"? Also, if you had the previous ipse=
t=20
> > > kernel modules loaded in, then just installing them won't unload =
them.
> >
> >     I successfully built and executed ipset 6.19 ,but when I try to=
=20
> > run this command, I failed.
> >=20
> > iptables -t nat -A POSTROUTING -m set --match-set ipc src,dst -j=20
> > MASQUERADE
> > iptables: No chain/target/match by that name.
> >=20
> > could you please help me on this ?
>=20
> [There's no ipset 6.19 yet.]
>=20
> I succeeded after I sudo cp xt_set.ko
> /lib/modules/3.5.0-28-generic/kernel/net/netfilter/ .=20
> Thanks for your help.
> But I am just alittlebit curious why can't I do it by make install.

I suspect your "depmod" utility is not configured to process the
/lib/modules/`uname -r`/extra/ directory, in which the modules are inst=
alled
by the command "make modules_install".

It's strange. You're the second reporting such kind of problem.
What is your distribution and what's its version?

Best regards,
Jozsef
-
Jozsef=A3=AC
     I am using ubuntu 12.04 LTS.
And I got an issue ,I am sorry if I am wrong because I am a quite newbi=
e.

I am confused of the "--match-set setname src,dst" .  it seems only the=
 one
before the comma is functional. Please look at this .

I added an IP into the ipset sec,and set the iptables FORWARD Chain as =
"dst,
src" ,I guess this means dst OR src, but unfortunately ,my outgoing pac=
kages
was dropped.

If I set two separated lines ,it works.

Could you please help me on this?

Great appreciation !
Tian



tfang@gateway:~$ sudo iptables -nvL
Chain INPUT (policy ACCEPT 83 packets, 4308 bytes)
 pkts bytes target     prot opt in     out     source
destination

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source
destination
    0     0 ACCEPT     all  --  *      *       0.0.0.0/0
0.0.0.0/0            match-set sec dst,src
    4   252 DROP       all  --  *      *       0.0.0.0/0
0.0.0.0/0

Chain OUTPUT (policy ACCEPT 114 packets, 14440 bytes)
 pkts bytes target     prot opt in     out     source
destination




E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu PGP =
key :
http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Scie=
nces
          H-1525 Budapest 114, POB. 49, Hungary

