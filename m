From: Mohamed Eldesoky <eldesoky.lists@gmail.com>
Subject: Re: ip_conntrack_max vs ip_conntrack
Date: Tue, 28 Sep 2004 10:59:37 +0300
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1403218a0409280059123fa77f@mail.gmail.com>
References: <4154A112.20308@suse.cz>
Reply-To: Mohamed Eldesoky <eldesoky.lists@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4154A112.20308@suse.cz>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@lists.netfilter.org>

But still,
The /proc/net/ip_conntrack should contain all connections tracked by
that firewall (ie, passing through the firewall), am I right ??


On Sat, 25 Sep 2004 00:34:58 +0200, Michal Ludvig <mludvig@suse.cz> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Hi all,
> 
> could someone please explain me what is the relation between the number
> in /proc/sys/net/ipv4/ip_conntrack_max and number of lines in
> /proc/net/ip_conntrack?
> 
> On one of our very loaded firewalls (with 1GB RAM) we are still getting
> "ip_conntrack: table full, dropping packet." message. We tried to tweak
> all different parameters, e.g. hashsize to up to 1048576,
> ip_conntrack_max, ip_conntrack_tcp_timeout_established, etc.
> Unfortunately sooner or later the kernel always starts dropping packets.
> At the same time however there are at most a few thousands of lines in
> /proc/net/ip_conntrack.
> 
> I instrumented the kernel to dump the same output via printk() once
> ip_conntrack_count reaches ip_conntrack_max. When I set _max=128 and run
> nmap through the firewall it of course very soon prints the "dropping
> packets" message, but along with only 6 (=six!) lines of connections.
> Where was the rest, 122 connections, lost? What does the
> ip_conntrack_count actually count?
> 
> Thanks in advance!
> 
> Michal Ludvig
> - --
> SUSE Labs                    mludvig@suse.cz
> (+420) 296.545.373        http://www.suse.cz
> Personal homepage http://www.logix.cz/michal
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.2.4 (GNU/Linux)
> Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org
> 
> iD8DBQFBVKEQDDolCcRbIhgRAupGAKCF4F6Mvk0YARZMj5S21vI/95u71ACfWDn2
> UVB5lEV0YC58et/rvFbJEEY=
> =AryG
> -----END PGP SIGNATURE-----
> 
> 



-- 
Mohamed Eldesoky
www.eldesoky.net
RHCE

