From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: FORWARD-chain packets go through INPUT-chain ?
Date: Wed, 26 Apr 2006 11:34:20 +0200 (CEST)
Message-ID: <Pine.LNX.4.58.0604261128290.16145@blackhole.kfki.hu>
References: <444F32A3.7050900@trans.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <444F32A3.7050900@trans.net>
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
Content-Type: TEXT/PLAIN; charset="utf-8"
To: Philip Westphal <philip@trans.net>
Cc: netfilter@lists.netfilter.org

On Wed, 26 Apr 2006, Philip Westphal wrote:

> i think my problem is quit simple, but i=C2=B4m a little bit under pressu=
re,
> and google didn=C2=B4t help. i have a firewall machine, with ip6tables
> running on it, and behind this firewall there is a webserver with
> apache2 running. the network looks like this:
[...]
> my problem is, that packets from the LAPTOP to the APACHE (and
> vice-versa) go through all 3 chains INPUT, OUTPUT and FORWARD. if i
> don=C2=B4t make any rules, i have to set all 3 chains to ACCEPT to get
> packets through. if i have INPUT and OUTPUT on drop (FORWARD is all the
> time on ACCEPT), i need to allow especially packets to or from port 80
> or icmpv6 on the INPUT and OUTPUT chain.

IPv6 is not just IPv4 with bumped up address space: ARP is replaced by ND
(Neighbour Discovery), which is performed over ICMPv6. So if you block
ICMPv6 completely in INPUT/OUTPUT, you actually disable IPv6.

Have a look at the IETF draft 'Best Current Practice for Filtering ICMPv6
Messages in Firewalls':

http://www.ietf.org/internet-drafts/draft-ietf-v6ops-icmpv6-filtering-bcp-0=
1.txt

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

