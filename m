From: Anders Fugmann <afu@fugmann.dhs.org>
Subject: Re: Firewalll script
Date: Mon, 23 Dec 2002 16:14:18 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E07284A.1030001@fugmann.dhs.org>
References: <00cc01c2aa7f$64e82860$1a01a8c0@vishal>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <00cc01c2aa7f$64e82860$1a01a8c0@vishal>
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
To: system@eluminoustechnologies.com
Cc: iptables <netfilter@lists.netfilter.org>

system@eluminoustechnologies.com wrote:
> Hi All,
> 
> Following is the policy that my firewall generation script gives, but my 
> system hangs when i execute this, I am using ssh to execute this script. 
> My aim is very simple to close all unused ports. My entire scripts goes 
> like this. Can you please help me in correcting the script.

Your ssh connection hangs because you close off communication to port 
22. The lines:
 > echo "Allow SSH(22/tcp)"
 > $IPTABLES -A INPUT -p tcp --sport 22 -j ACCEPT
 > $IPTABLES -A OUTPUT -p tcp --dport 22 -j ACCEPT
Are wrong, as you want to match the destination port on input and sport 
on output.

In general, it is not considered offensive to have and
iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
which will also make the rules alot simpler. For starters, I would even 
recomment that you allow all outgoing packets.

The lines:
 > echo "Disabling IP Spoofing attacks"
 > echo 2 > /proc/sys/net/ipv4/conf/all/rp_filter
Are somewhat incorrect. It should be '1' and not '2'. I have seen many 
scripts and tutorials with this misconseption of what to set where, but 
in the kernel source says 0|1.

 > echo "Logging martians (packets with impossible addresses)"
 > echo 1 > /proc/sys/net/ipv4/conf/all/log_martians
This is incorrect. The setting determines if packets violating RFC1122 
should be logged or not. Setting this to '1', disables logging.

Hope it helps.

Regards
Anders Fugmann

--
Author of FIAIF.
FIAIF is an intelligent firewall
http://fiaif.fugmann.dhs.org



