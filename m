From: "Lloyd Standish" <lloyd@crnatural.net>
Subject: Re: redundancy with Adsl modem
Date: Wed, 04 Jan 2012 14:55:16 -0600
Message-ID: <op.v7ku07khx1lyi3@debiandesk2.net>
References: <CAMTjHrw92RRMe4Y2cGfVsS6eBrvL-=1pYCueOC7vOW=RT_-=7g@mail.gmail.com> <1325574854.2270.130.camel@andybev-desktop> <CAMTjHrxMUCb1b4tKeQon9QuJCxp3YunwJ7BiPfBtCokGFLYkWg@mail.gmail.com> <op.v7jefiizx1lyi3@debiandesk2.net> <4F041738.9090908@freemail.hu> <op.v7kb75oyx1lyi3@debiandesk2.net> <4F0493D5.3040001@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4F0493D5.3040001@freemail.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed	delsp=yes"
To: =?iso-8859-1?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Cc: Andrew Beverley <andy@andybev.com>, =?iso-8859-1?Q?Usu=E1rio_do_Sistema?= <maiconlp@ig.com.br>, Mail List - Netfilter <netfilter@vger.kernel.org>

On Wed, 04 Jan 2012 12:00:53 -0600, G=E1sp=E1r Lajos <swifty@freemail.h=
u> wrote:

> I think that both of these approaches has pros and cons.
>Maybe you also know that (in Linux) the kernel chooses the output inte=
rface depending on the routing table and not the source IP...
> So if the ping is not bound to a specific interface then it is "usele=
ss"...
> (There is an oping utility that can be set up to use a specific inter=
face.)
> I do not know LSM but I hope that it is also aware of this.

lsm ("link status monitor") does direct its pings through the interface=
 specified in the config file, to a "ping IP."  However, to make sure t=
his happens I use a unique ping IP for each interface, with policy rout=
ing rules like this:
ip rule add to <pingIP> table T<n>  (where T<n> is the name of a table =
that routes through a particular interface.)

lsm can of course monitor several interfaces at once.  I am using multi=
ple uplinks to give both Internet connection redundancy and increased t=
otal bandwidth for a firewalled LAN.  I have 5 uplinks of 5 Mbit each, =
throttled to 4 Mbit to prevent queuing at the ISP.  I use a separate ro=
uting table for each interface, and handle routing by fw-marking packet=
s with iptables rules, and routing with rules like "ip rule add fwmark =
<n>..."

>Besides this, pinging is not always accurate and may lead the applicat=
ion think that link quality is dropping down...
> Just imagine that the pinged host(s) can be under a DOS attack and th=
e reply times can go high...

True.  If the "ping IP" can't be pinged or if the ping statistics are p=
oor enough, the interface will be removed from routing.  If the ping IP=
 host fails for any reason, that will give a "false positive."  However=
, since we have 5 interfaces, it would not be a serious problem for us.

> (Not to mention that the pinging generates traffic and that requires =
resources. Probably not too much resources at all :D)
>Other question is that how often/rarely do you ping? If often then it =
is too much traffic. If rarely then do you REALLY KNOW that the interfa=
ce was all the time up?

I have configured lsm to ping the test IPs every second.  In my configu=
ration, a response is considered "timed out" or "lost" if it takes more=
 than 1000ms to get a reply to a ping.  The system determines that the =
link quality is too low if there are 7 consecutive lost packets, or 15 =
lost packets in a 60 second interval.

To consider that a "down" interface should come back up, it looks for 5=
 or less "lost" (timed out) packets in a 60 second interval.  All these=
 parameters are configurable.  I left the default settings for most thi=
ngs.

>To repeat myself: I do not know LSM
>It seems to me that LSM is some kind of line quality checking software=
=2E..

Right.

>OTOH my match checks the interface state when the packet is in the que=
ue...
> With that info you can mark the packets and let the kernel decide abo=
ut the routing depending on the mark..
>But my match does not know anything about the "quality" of the connect=
ion just about the state of the interface...
>Returning to the main question:
> If an interface goes down then the associated connections will most l=
ikely break down...
> Without knowing the required "high-availability" services, for exampl=
e you can use "fallback_relay" in postfix; multiple remote lines in ope=
nvpn, etc. etc. etc.
> So maybe the redundancy is not the right word for the main requiremen=
t...
> I would ask myself: Do I really need redundancy or do I need alternat=
ivity?

Again, in our case the primary service is Internet connectivity for an =
internal LAN, with no services running on any of the outward-facing int=
erfaces.  lsm is perfect for our situation, but it may not be best for =
others.

--=20
Lloyd Standish
Tropical Health Foods LLC
information on carao for blood health: http://www.bloodhealth.net
Use Suggetions: http://www.bloodhealth.net/files/use-suggestions.htm
selling website: http://www.tropicalhealthfoods.com
order form: https://www.tropicalhealthfoods.com/order.shtml.
New York, USA: 347 352 0058
other countries: +506 8816 1658
time zone CST (GMT-6)

--
Carao fruit is a food product intended to help support blood health.  I=
t is not intended to treat any disease.  Furthermore, statements in thi=
s email should not be interpreted as medical advice or counsel.  All st=
atements regarding carao fruit are the responsibility of Tropical Healt=
h Foods LLC.
