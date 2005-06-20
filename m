From: "terry l. ridder" <artisticforge@gmail.com>
Subject: Re: iptables leaking blocked ip addresses.
Date: Mon, 20 Jun 2005 15:39:20 -0500
Message-ID: <49bf7d705062013395648ac12@mail.gmail.com>
References: <49bf7d7050620083448c1dee9@mail.gmail.com>
	<200506201055.25861.rob0@gmx.co.uk>
	<49bf7d7050620091748a270fc@mail.gmail.com>
	<Pine.LNX.4.62.0506202125290.28510@mercury.sdinet.de>
Reply-To: "terry l. ridder" <artisticforge@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.62.0506202125290.28510@mercury.sdinet.de>
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
Content-Type: text/plain; charset="us-ascii"
To: Sven-Haegar Koch <haegar@sdinet.de>
Cc: netfilter@lists.netfilter.org

hello;

reply below.

On 6/20/05, Sven-Haegar Koch <haegar@sdinet.de> wrote:

<snip>

> And on your comment to another mail that you are not using connection
> tracking:
> This is wrong. If you have the nat table, you must have ip_conntrack
> loaded - and if its loaded it tracks your connections, even if you
> dont use -m state at all. There is no iptables nat without connection
> tracking.
>

i have checked and i was looking at the wrong window when i copied the
.config. i have corrected that mistake.

please refer to http://204.238.34.206/iptables-leaks.txt

>
> c'ya
> sven
>=20

--=20
terry l. ridder ><>

