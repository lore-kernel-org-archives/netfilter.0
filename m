From: Dave Cinege <dcinege-mlists-dated-1115427134.8327d0@psychosis.com>
Subject: Re: Linux forwarding Win XP hosts VERY slowly
Date: Sun, 1 May 2005 20:52:10 -0400
Message-ID: <200505012052.11014.dcinege-mlists@psychosis.com>
Reply-To: dcinege-mlists@psychosis.com
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org
Cc: "Taylor, Grant" <gtaylor@riverviewtech.net>

On Wednesday 31 December 1969 18:59, netfilter-request@lists.netfilter.org=
=20
wrote:

Grant,

> =A0 1) =A0Check to make sure that it is not a ""windowing issue, i.e. the
> MTU/MRU, MSS, etc.=20

Thanks for the hint. Looks like I should have some default 'clamp' rules as=
 a=20
start.

iptables -t filter -A FORWARD -p tcp --tcp-flags SYN,RST SYN -j TCPMSS=20
=2D-clamp-mss-to-pmtu=20

Correct? What about the traffic going to the appliance? This rule fails on=
=20
INPUT....

> 2) =A0I know that XP SP 2 changes the number of TCP/IP=20
> connections that a computer can have open at any given time. =A0I think t=
he
> default prior to XP SP 2 was 50 or there abouts. =A0Now the default for X=
P SP

This is a product I'm building. It's not a single Firewall in a shop. Once=
=20
it's out of my hands, I have no control over what is connecting to it. None=
 of=20
these people care their machine is broken. So, I need to do what i can in=20
Linux on the appliance.   : (

Dave



