From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: Problem with FTP trought iptables.
Date: Thu, 21 Nov 2002 21:23:25 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200211212123.25464.netfilter@newkirk.us>
References: <F171brl26XyrAaDJs2L00017900@hotmail.com>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <F171brl26XyrAaDJs2L00017900@hotmail.com>
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
To: =?iso-8859-1?q?H=E9lio=20Dubeux?= <hdubeux@hotmail.com>, netfilter@lists.netfilter.org

On Tuesday 19 November 2002 01:00 pm, H=E9lio Dubeux wrote:
> I has a Linux box act as a gateway eith iptables, i had already enabled=
 the
> ftp and irc conntrack modules, NAT is configured too. I have a windows =
98
> connected to this gateway and i have about 5 machines connected by a HU=
B to
> this W98 machine sharing the internet connection. I trie to use a progr=
am
> called CuteFTP to access remote ftp sites and i can not download or upl=
oad
> files. What=B4s wrong? Do i have to enable some other module in my kern=
el???
> I set transfer module in DOS to binary and didn=B4t work as well.

Make sure you are allowing ESTABLISHED/RELATED state packets through the=20
filter FORWARD chain, to allow for additional ports (IE data instead of=20
control) being opened during/by the FTP session.

Something like:
/sbin/iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
should do the trick.  You can specify -i or -o if that is useful in your=20
set-up, but make sure you allow both directions in the end.

BTW, is there any particular reason you don't have the gateway right on t=
he=20
hub?  It can handle the connection sharing better than Win98, and you're=20
already performing NAT in it, it seems redundant (at best) to then perfor=
m=20
NAT again in the Win98 machine.  This would also eliminate the requiremen=
t=20
that the Win98 machine always be up for the other machines to connect.  A=
lso,=20
if you already have the above state matches enabled, it is possible that =
the=20
double-nat is causing the Win98 connection sharing to bungle the NAT of=20
RELATED connections.  (if it even handles them correctly to begin with, I=
=20
don't know...)

j


