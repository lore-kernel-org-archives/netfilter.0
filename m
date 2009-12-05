From: Lars =?UTF-8?B?VMOkdWJlcg==?= <lars.taeuber@gmx.net>
Subject: Re: nat problem: What's so special with traffic from audibank.de?
Date: Sat, 5 Dec 2009 23:19:11 +0100
Message-ID: <20091205231911.bcb9fcc0.lars.taeuber@gmx.net>
References: <20091203154831.ac38cf77.lars.taeuber@gmx.net>
	<87ljhj3dfs.fsf@isengard.friendlyfire.se>
	<20091203235443.9d5bb632.lars.taeuber@gmx.net>
	<4B18A8D4.901@trash.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4B18A8D4.901@trash.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Hallo Patrick,

On Fri, 04 Dec 2009 07:14:44 +0100 Patrick McHardy <kaber@trash.net> wr=
ote:
> > I could solve my problem with either allow any icmp traffic from ou=
tside to any destination or use the clamp-to-pmtu in the server setting=
s for the firewall. This is a switch in fwbuilder.

sorry i was wrong.
At first i tried the =C2=BBclamp-to-pmtu=C2=AB setting and it worked. A=
fter removing this setting and inserting a gloabl rule to accept every =
icmp traffic it still worked.
But I didn't realized that this global rule had no effect at all.


> >=20
> > Why is such an ICMP message not RELATED in the meaning of
> >    echo "-A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT"
> > with a _related_ tcp connection?
>=20
> It should be. Please post a dump of the relevant ICMP message
> and the connection tuples from /proc/net/nf_conntrack for the
> original TCP connection.

No such icmp message ever reached my firewall though I tryed hard to re=
cord such an icmp message. My guess is that it must have been filtered =
out on the way.
The clamp-to-pmtu seemed to have a lasting success.

What I'm wondering is why it just works on the firewall itself but not =
with the natted computers in the private network?

Sorry for replying so late.
Lars
