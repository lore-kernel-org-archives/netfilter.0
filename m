From: =?ISO-8859-1?Q?Jos=E9_Irigon?= <irigon@gmail.com>
Subject: Re: iptables + MRTG
Date: Sat, 28 Aug 2004 13:56:03 -0300
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <2cbad29704082809562ecf1ec5@mail.gmail.com>
References: <a0f69e5040828042815b5e61e@mail.gmail.com>
	<1910446864.20040828172355@op.pl>
Reply-To: =?ISO-8859-1?Q?Jos=E9_Irigon?= <irigon@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1910446864.20040828172355@op.pl>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter <netfilter@lists.netfilter.org>

Hi all,=20
I read all messages sent to list about topics like this, but none
of them solved my doubt.
I want to do a stealth firewall, a firewall + bridge which an
mallicious client can=B4t* find it.

This is the idea:
When a packet arrive at the bridge (from de outside) if the rules of
iptables/ebtables permit it continue, ok. If not, the bridge should
reply with packages with the client=B4s ip and rejecting these packages.
The problem is I tried use "-j REJECT --reject-with tcp-reset" for
example, but the bridge seems to can not reply that packages.
At begining I thought it was cause haven=B4t the bridge ip, it couldn=B4t
send packages back, but I read in
http://sourceforge.net/mailarchive/forum.php?thread_id=3D4073001&forum_id=
=3D8573
that it is possible.
I recompile kernel and tried anything I believe could be the erlevant,
(ip_forward, etc)
but nothing.
Can anyone tell me what could be!?

I=B4m using Slackware 9.1 with kernel 2.6.8.1, but I tried with 2.4.22
and didn=B4t work either...

[]=B4s!

