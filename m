From: uniplex <uniplex@maximum-linux.net>
Subject: Re: -m recent
Date: Thu, 23 Jan 2003 15:59:46 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E301172.101@maximum-linux.net>
References: <3E2FEA1C.9030305@maximum-linux.net> <20030123191505.GL484@ns.snowman.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter <netfilter@lists.netfilter.org>

Stephen Frost wrote:

>>iptables -A INPUT -i eth0 -p all -m recent --name icmps --update -j DROP
>>
>>iptables -N icmps
>>iptables -A INPUT -i eth0 -p icmp -j icmps
>>iptables -A icmps -m recent --name icmps --set -j DROP
>>iptables -A icmps -j DROP
> 
> 
> This looks good to me..  Can you tell me what version of ipt_recent
> you're using?  An old version had a bug where the --name only worked
> when it was the last option, that may be the problem.
> 
> 	Stephen

Hey Stephen,

How can I tell what version of ipt_recent I have? I downloaded the 
latest version of patch-o-matic and installed your patch from there.

I tried using --name in different places but it still doesn't seem to 
work for whatever reason. Here's what I've tested with now.

iptables -A INPUT -i eth0 -p all -m recent --update -j DROP --name icmps

iptables -N icmps
iptables -A INPUT -p icmp -i eth0 -j icmps
iptables -A icmps -m limit --limit 2/hour --limit-burst 1 -j LOG 
--log-level alert --log-prefix "icmp: "
iptables -A icmps -m recent --set -j DROP --name icmps
iptables -A icmps -j DROP

Thanks.


