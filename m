From: "Samuel Jean" <sj-netfilter@cookinglinux.org>
Subject: Re: --set-mark
Date: Wed, 12 Jan 2005 09:59:14 -0500 (EST)
Message-ID: <32492.142.169.215.10.1105541954.squirrel@142.169.215.10>
References: <41E52B7C.9070802@uplink-verein.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41E52B7C.9070802@uplink-verein.ch>
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
To: Moritz Gartenmeister <moritz@uplink-verein.ch>
Cc: netfilter@lists.netfilter.org

On Wed, January 12, 2005 8:51 am, Moritz Gartenmeister said:
> hi all
>
> i have a problem with -j MARK --set-mark
>
> everthing was working until i changed the kernel and iptables ;-)
>
> before i had kernel 2.6.7 and iptables 1.2.9 (and everything was workin=
g
> perfectly)

ipt_MARK suffered of new versioning system. However, it's only in SVN and
should work perfectly since testsuite for 2.6.10 works.

>
> now i have kernel 2.6.10 and iptables 1.2.10

Haven't tested with 1.2.10 tho. Will do.

> error message:
> iptables: Invalid argument

Looks like checkentry() didn't like something. Are you sure both
userspace and kernelspace share the same structure (i.e.: you compiled
iptables against your 2.6.10 source and do _use_ that iptables binary) ?

> MARK target exists:
> sudo /usr/local/sbin/iptables -I FORWARD -j MARK
> iptables v1.2.11: MARK target: No action

So you are using iptables-1.2.11 finally ?

> was something changed in the syntax? do i have to use another modul?

I can't tell you (cause my boss is watching me) but ipt_MARK sure
has been modified to add new 'AND' & 'OR' mark features.

I don't think it's in released iptables and kernel yet. (AFAIK)

(I might be wrong since I don't play with ipt_MARK)

>
> regards
> moritz

Will give a try at home,

Samuel


