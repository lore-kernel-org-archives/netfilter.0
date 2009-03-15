From: "Nikolay S. Rybaloff" <nowhere@hakkenden.ath.cx>
Subject: Re: Creating an equivalent to ESFQ using flow classifier
Date: Sun, 15 Mar 2009 21:07:52 +0300
Message-ID: <1237140472.28333.10.camel@hakkenden>
References: <328bad7c0259fd816ae31c8405313e1e@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <328bad7c0259fd816ae31c8405313e1e@localhost>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Andrew Beverley <andy@andybev.com>
Cc: netfilter@vger.kernel.org

Hi Andrew,

That's right, you have configured hashing based on src/dst address +
src/dst port + protocol, which is almost classical SFQ hash. In your
case you should try only nfct-src, which will create queues per source
IP and service these queues fairly within htb class.

=D0=92 =D0=92=D1=81=D0=BA, 15/03/2009 =D0=B2 16:29 +0000, Andrew Beverl=
ey =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> I have a server which I am using to share an ADSL line between a numb=
er of
> users. I am successfully shaping traffic based on type using 4 differ=
ent
> classes, but I also want to share traffic within those classes evenly
> between computers (rather than between connections). I used to use ES=
=46Q for
> this, but am trying to move to the new flow classifier as described i=
n
> http://www.mail-archive.com/netdev@vger.kernel.org/msg60634.html
>=20
> I have set up the following rules. However, if I start 4 downloads on=
 one
> PC and 1 download on another PC, then the first PC will get 4/5 of th=
e
> available bandwidth and the second PC one 1/5. I would expect them to=
 get
> half each. I am using HTB to shape between each class.
>=20
> # Add a HTB qdisc to the root device
> tc qdisc add dev eth0 root handle 1: htb
>=20
> # Rate limit it
> tc class add dev eth0 parent 1: classid 1:1 htb rate 2200kbit
>=20
> # Add 4 classes to it for different traffic
> tc class add dev eth0 parent 1:1  classid 1:10 htb \
>         rate 100kbit ceil 100kbit prio 0
> tc class add dev eth0 parent 1:1  classid 1:30 htb \
>         rate 1000kbit ceil 1000kbit prio 1
> tc class add dev eth0 parent 1:1  classid 1:40 htb \
>         rate 1000kbit ceil 1000kbit prio 2
> tc class add dev eth0 parent 1:1  classid 1:60 htb \
>         rate 100kbit ceil 100kbit prio 3
>=20
> # Add SFQ qdisc to each HTB class
> tc qdisc add dev eth0 parent 1:10 handle 10: sfq perturb 10
> tc qdisc add dev eth0 parent 1:30 handle 30: sfq perturb 10
> tc qdisc add dev eth0 parent 1:40 handle 40: sfq perturb 10
> tc qdisc add dev eth0 parent 1:60 handle 60: sfq perturb 10
>=20
> # Filter the traffic to each class based on MARK
> tc filter add dev eth0 parent 1:0 protocol ip handle 10 fw flowid 1:1=
0
> tc filter add dev eth0 parent 1:0 protocol ip handle 30 fw flowid 1:3=
0
> tc filter add dev eth0 parent 1:0 protocol ip handle 40 fw flowid 1:4=
0
> tc filter add dev eth0 parent 1:0 protocol ip handle 60 fw flowid 1:6=
0
>=20
> # Share traffic between each PC evenly
> tc filter add dev eth0 parent 10: protocol ip handle 10 flow hash key=
s \
>         nfct-src,nfct-dst,proto,nfct-proto-src,nfct-proto-dst divisor=
 1024
> tc filter add dev eth0 parent 30: protocol ip handle 30 flow hash key=
s \
>         nfct-src,nfct-dst,proto,nfct-proto-src,nfct-proto-dst divisor=
 1024
> tc filter add dev eth0 parent 40: protocol ip handle 40 flow hash key=
s \
>         nfct-src,nfct-dst,proto,nfct-proto-src,nfct-proto-dst divisor=
 1024
> tc filter add dev eth0 parent 60: protocol ip handle 60 flow hash key=
s \
>         nfct-src,nfct-dst,proto,nfct-proto-src,nfct-proto-dst divisor=
 1024
>=20
>=20
> It is the last part that I am unsure about. I do not get any errors w=
ith
> the commands, but they do not seem to make any difference to the shap=
ing.
>=20
> I am using linux-2.6.26 on Debian Lenny but have also tried linux-2.6=
=2E28
>=20
> Thanks in advance
>=20
> Andy Beverley
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

