From: Francesco Ciocchetti <primero@fastwebnet.it>
Subject: Re: philosophical question regarding NAT
Date: Tue, 10 May 2005 15:11:48 +0200
Message-ID: <4280B314.6090701@fastwebnet.it>
References: <1115723584l.29661l.0l@server.moose.blogdns.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1115723584l.29661l.0l@server.moose.blogdns.org>
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
To: iml@zip.com.au, "netf >> \"Netfilter lista (iptables)\"" <netfilter@lists.netfilter.org>

Ian Laurie wrote:

>
> which enforces NAT, ie, only NATed things can get through.  While you
> can achieve the same thing by setting policy of FORWARD to DROP and
> allowing only RELATED and ESTABLISHED stuff through (which I do)
> I am surprised I have not seen this PREROUTING rule used more often as
> a safety measure.
>
> It doesn't seem to break anything, does anyone know why this technique
> isn't seen more often?
>
> Ian
>
>
It does not break anything to put a DROP Target Rule in Prerouting Chain
of nat table ,  but it should be done not because of a ... convention :)

i mean , there are 3 Tables ok? and each of them has its scope.

NAT for Address Translations.
FILTER for filtering packets.
MANGLE for dealing with packet flags and so on ...

Why DROPPING in NAT Table instead of doint this in its chain ? i don't
think is a Performance Issue ... ok, Dropping as soon as possible can
reserve some resources, but do you really need to reserve these ? how
many rules u have ?

Use Tables for what is its scope because of Packet Traversing Scheme and
Flow Control, this is my Hint.

BTW is Normal that using only NAT will leave a lot of Holes in your
Firewall, NAT is just one piece of your NET Security ... Filtering is
another one ;)

Bye


