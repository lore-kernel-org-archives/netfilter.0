From: Michal Ludvig <mludvig@suse.cz>
Subject: Re: ip_conntrack_max vs ip_conntrack
Date: Thu, 30 Sep 2004 11:59:49 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <415BD915.9000206@suse.cz>
References: <4154A112.20308@suse.cz> <4154A476.8030405@lanl.gov>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4154A476.8030405@lanl.gov>
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
To: Stephen J Smoogen <smoogen@lanl.gov>
Cc: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Stephen J Smoogen told me that:
> Michal Ludvig wrote:
> 
>> Hi all,
>>
>> could someone please explain me what is the relation between the number
>> in /proc/sys/net/ipv4/ip_conntrack_max and number of lines in
>> /proc/net/ip_conntrack?
>>
>> On one of our very loaded firewalls (with 1GB RAM) we are still getting
>> "ip_conntrack: table full, dropping packet." message. We tried to tweak
>> all different parameters, e.g. hashsize to up to 1048576,
>> ip_conntrack_max, ip_conntrack_tcp_timeout_established, etc.
>> Unfortunately sooner or later the kernel always starts dropping packets.
>> At the same time however there are at most a few thousands of lines in
>> /proc/net/ip_conntrack.
>>
>> I instrumented the kernel to dump the same output via printk() once
>> ip_conntrack_count reaches ip_conntrack_max. When I set _max=128 and run
>> nmap through the firewall it of course very soon prints the "dropping
>> packets" message, but along with only 6 (=six!) lines of connections.
>> Where was the rest, 122 connections, lost? What does the
>> ip_conntrack_count actually count?
> 
> Ok one thing you might want to do is check to see if you dont have a bug
> in your kernel somewhere.. I found the one I talked about earlier by
> doing the following:
> 
> cat /proc/slabinfo |grep ip_conntrack
> cat /proc/net/ip_conntrack | wc -l
> 
> Not the best and very racy.. but the 2 did NOT match up in any shape or
> form. I then played around with various conntrack modules until I figure
> d it out to being something with conntrack_irc and conntrack_ftp in the
> kernel I was running. Removing those allowed for the 2 to match up
> closely when doing  HTTP crashloads on the firewall. Adding either one
> of them caused what looked like a resource leak.
> 
> As far as I can tell.. a POM-only patched 2.4.26 did not exhibit this
> problem.

I can see it on 2.6.5 but not on 2.6.9-rc2. Does anyone have the patch
or the cset number that fixed this? I hope I won't have to binary search
for it... ;-)

Michal Ludvig
- --
SUSE Labs                    mludvig@suse.cz
(+420) 296.542.396        http://www.suse.cz
Personal homepage http://www.logix.cz/michal
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFBW9kTDDolCcRbIhgRAl3MAJ9T3SH/leXz3v4oScV/j4Q9vS6BggCfTFOh
WhXvdntlqi2W1bIs0o4E6as=
=48El
-----END PGP SIGNATURE-----

