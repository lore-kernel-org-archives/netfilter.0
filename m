From: "Dharmendra T." <dharmu@nsecure.net>
Subject: Re: Strange Behaviour with ICMP in SNAT
Date: 24 Jun 2004 11:52:07 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1088058139.8976.21.camel@dharmu.nsecure.net>
References: <B732FD42D68974438C1451C73C1D030FAEE9F7@FR92EX02.eu.abxlogistics.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

On Wed, 2004-06-23 at 23:48, IZEM Farid wrote:
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
> 
> Best regards,172.19.92.0/255.255.255.0 -j SNAT --to-source 172.19.93.200
> 
> Farid
> Email : farid.izem@abxlogistics.fr
> 
> 

Try out this rule and let us know what happened!

Iptables -t nat -A POSTROUTING -p icmp -s 192.168.1.42 -d
172.19.92.0/255.255.255.0 -o <out going interface> -j SNAT --to-source
172.19.93.200


Dharmendra T.
Linux Security and Admin,
www.nsecure.net




