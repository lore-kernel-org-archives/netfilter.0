From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Strange Behaviour with ICMP in SNAT
Date: Wed, 23 Jun 2004 20:06:28 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406232006.29042.Antony@Soft-Solutions.co.uk>
References: <B732FD42D68974438C1451C73C1D030FAEE9F7@FR92EX02.eu.abxlogistics.com>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <B732FD42D68974438C1451C73C1D030FAEE9F7@FR92EX02.eu.abxlogistics.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Wednesday 23 June 2004 7:18 pm, IZEM Farid wrote:

> Hi all,
>
> We are currently testing NetFilter on Linux Slackware 9.0.
> We have configured our netfilter to make SNAT and DNAT.
> Some issues have been observed while configuring SNAT to allow ICMP.
> When implemented this rule, it takes some time before icmp being able to
> work.
> When rebooting the NetFilter box, the same strange behaviour is
> occurring.
> Howewer all other SNAT/DNAT rules implemented are working immediately,
> It' takes about 5 minutes until ICMP is working again.
>
> It's a very strange behaviour, isn't it?
>
> Please find the rule for ICMP:
>
> Iptables -A POSTROUTING -p icmp -s 192.168.1.42 -d
> 172.19.92.0/255.255.255.0 -j SNAT --to-source 172.19.93.200
>
> Any help would be appreciated.

Please can you:

1. Post the full ruleset, not just the one you think is interesting to the 
problem.   The output from "iptables -L -nvx; iptables -L -t nat -nvx" is 
good, because it shows us all the rules in the correct order, which 
interfaces they apply to, and what the packet / byte counts are for each 
rule.

2. Describe in more detail how you are testing the setup.

3. Show us the output of any packet sniffer or LOG rules which you have tried 
to investigate what's going on.

4. Post the output of /proc/net/ip_conntrack during the tests which are 
failing.

Regards,

Antony.

-- 
In science, one tries to tell people
in such a way as to be understood by everyone
something that no-one ever knew before.

In poetry, it is the exact opposite.

 - Paul Dirac

                                                     Please reply to the list;
                                                           please don't CC me.


