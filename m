From: =?ISO-8859-1?Q?Leonardo_Rodrigues_Magalh=E3es?= 
	<leolistas@solutti.com.br>
Subject: monitoring network question
Date: Wed, 12 Nov 2008 11:57:28 -0200
Message-ID: <491AE0C8.1080705@solutti.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: ML netfilter <netfilter@vger.kernel.org>


    Hello Guys,

    i'm trying to setup a box and i'd like to present my ideas and,=20
luckly, got some as well :)

    im setting up a small linux box with 2 NICs working as a bridge.=20
That's OK, no problem on that. Maybe the interesting point is that it's=
=20
a Routerboard 450 with OpenWRT, so i dont have the same flexibility of =
a=20
full linux box. But the bridge part is working just fine, i have frames=
=20
flowing through interfaces.

    So, at the exact moment, i can use this box to monitor some network=
=20
segment and see, on the box, tcpdump for example, everything that passe=
s=20
from one ethernet to another with no logical changes to the network. No=
=20
need of IP changing, no need on routing changing. Of course it has an i=
p=20
address, but that's just for management.

    next step would be, with this box, export netflow traffic so i coul=
d=20
analyse it better on any netflow collector/analyzer software, which=20
would give me a MUUUCH better network analyzis than simple iptraf that=20
i'm actually using.

    the problems .....

    i cannot use normal iptables -j ULOG rules, because there's no IP=20
traffic flowing on the box. Traffic flowing are ethernet frames on the=20
bridge.

    i have tried ebtables with ulog as well:

ebtables -A FORWARD --ulog -j CONTINUE

    and then fprobe-ulog to export packets, configuration with works=20
just fine with iptables ULOG, but didnt worked with ebtables ulog. Mayb=
e=20
i'm missing some ebtables rule or different target than ulog ..... this=
=20
is the first time i've used ebtables anyway.

    but .... i got a third idea on how to accomplish that. My idea, wit=
h=20
this box, is to put it right in front the firewall (yes, with proper=20
authorization, nothing illegal here), so i would have the whole network=
=20
in one side of the bridge and the firewall on the other side of the=20
bridge. In other words ..... several MACs which i dont know which would=
=20
be on one side, and just a single MAC, known one, on the other side of=20
the bridge.

    based on this, i tought on doing some arpspoof thing, having this=20
box to fake arp replies to the firewall MAC address and sending it's ow=
n=20
and then forwarding the frames to the real firewall.

    i dont know how to do this and dont know neither if this setup woul=
d=20
help me acchieving what i need.

    well .... i would like to hear some ideas on how to acchieve my=20
goals. Can anyone help me on this scenario ?

--=20


	Atenciosamente / Sincerily,
	Leonardo Rodrigues
	Solutti Tecnologia
	http://www.solutti.com.br

	Minha armadilha de SPAM, N=C3O mandem email
	gertrudes@solutti.com.br
	My SPAMTRAP, do not email it





