From: "Nicolas" <nmeillet@wanadoo.Fr>
Subject: TR: rtsp-conntrack help needed...
Date: Sat, 17 Jan 2004 16:12:04 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040117151211.AE5A83000476@mwinf0201.wanadoo.fr>
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

Hello Antony,

And thanks for your answer.

I'll try to give you more details. First of all, my network =
configuration.
In fact, I'm the manager of a UMTS validation platform. That means that =
my
clients won't be any computers but rather some 3G mobile phones.

However, it doesn't make a big difference because when these handsets =
access
the IP world, they are assigned with an IP address (typically :
10.150.33.xx). So on my LAN, this client is, for example, 10.150.33.41. =
This
is the first point.

Now, I browse on the WEB to a streaming server (Packet Video platform) =
and
this servers 'sees' me with my public IP address (as the firewall is =
doing
NAT and Masquerading) : IP_PUB.xxx.xxx so it replies to this address. In =
an
Ethereal log, I can see that RTSP and RTCP packets (which transit over =
TCP)
go through my firewall without any problem. But in this log, all RTP =
packets
(coming over UDP) are missing =3D> that's why I assume they are dropped =
by the
FW.

Moreover, I think that I'm not missing the appropriate rule (well, in =
fact,
yes, but that's not the main point now) but rather that my Redhat kernel
doesn't have the possibility to track this streaming connection. That's =
why
I'd like to install the appropriate rtsp-conntrack.

I've tried once to install it but I couldn't compile my kernel. =
Installing
the patch was OK though... the readme was clear enough ;o)

I don't know if this gives you more details... I'm at home now and I =
won't
be able to post my rules here before Monday. Anyway, they are really =
simple
: IF public source IP:port THEN private IP:port. Really nothing
extraordinary...

Hope this helps a bit.

Regards,
Nicolas=20

-----Message d'origine-----
De=A0: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] De la part de Antony Stone
Envoy=E9=A0: samedi 17 janvier 2004 13:09
=C0=A0: netfilter@lists.netfilter.org
Objet=A0: Re: rtsp-conntrack help needed...

On Saturday 17 January 2004 10:21 am, meillnco wrote:

> Hello all,
>
> This is my first post on this list but I've known netfilter for a =
while
> now... I'm just about to start using it though.
>
> Here is my question / problem : I have a generic configuration LAN =
<=3D>
> FIREWALL <=3D> INTERNET. My goal is to be able to play a video =
streamed by a
> public server. However, for the moment, my local clients can't stream =
as
> all RTP packets are stopped by the firewall.

Why are they being stopped?   What is your ruleset?

> Here comes (maybe ?) rtsp-conntrack...

Maybe, but let's not assume that's the solution until we've clearly
identified=20
the problem.

> I was wondering if anyone had already (and successfully) installed =
this
> patch ? I've been facing this problem for soooo long, any help would =
be
> much appreciated.

Have you attempted installing this patch and had a problem?   Or are you
just=20
asking "how do I install a patch"?

> Especially regarding installation / compliation tips and
> examples of the rules to add in my firewall configuration file.

Tell us what rules you have now and we may be able to suggest what to
change.  =20
We can't tell you what rules you should be using because we don;t know =
the=20
rest of your protocol requirements or your network configuration.

> PS : sorry if this message is inaccurate, I'm not so deep into =
Linux...

No problem - it's not Linux we need details of - it's your network and =
your=20
firewall rules.

Regards,

Antony.

--=20
The words "e pluribus unum" on the Great Seal of the United States are =
from
a=20
poem by Virgil entitled "Moretum", which is about cheese and garlic =
salad=20
dressing.

                                                     Please reply to the
list;
                                                           please don't =
CC
me.




