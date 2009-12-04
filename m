From: Patrick McHardy <kaber@trash.net>
Subject: Re: nat problem: What's so special with traffic from audibank.de?
Date: Fri, 04 Dec 2009 07:14:44 +0100
Message-ID: <4B18A8D4.901@trash.net>
References: <20091203154831.ac38cf77.lars.taeuber@gmx.net>	<87ljhj3dfs.fsf@isengard.friendlyfire.se> <20091203235443.9d5bb632.lars.taeuber@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20091203235443.9d5bb632.lars.taeuber@gmx.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-15?Q?Lars_T=E4uber?= <lars.taeuber@gmx.net>
Cc: netfilter@vger.kernel.org

Lars T=E4uber wrote:
> Hi Mattias,
>=20
> On Thu, 03 Dec 2009 23:22:47 +0100 Mattias R=F6nnblom <hofors@lysator=
=2Eliu.se> wrote:
>> I'll do some guessing here. It looks like the first large (MSS-sized=
)
>> segment is lost. I've seen this happening in networks where Path MTU
>> Discovery didn't work (because ICMP Fragmentation Needed was
>> filtered).
>=20
> you're absolutely right.
> I could solve my problem with either allow any icmp traffic from outs=
ide to any destination or use the clamp-to-pmtu in the server settings =
for the firewall. This is a switch in fwbuilder.
>=20
> Why is such an ICMP message not RELATED in the meaning of
>    echo "-A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT"
> with a _related_ tcp connection?

It should be. Please post a dump of the relevant ICMP message
and the connection tuples from /proc/net/nf_conntrack for the
original TCP connection.
