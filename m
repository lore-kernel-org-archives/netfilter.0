From: "Edmund Turner" <eturner@monash.edu.my>
Subject: RE: ICMP floods
Date: Wed, 15 Oct 2003 15:29:21 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <024301c392ee$0dfd9460$de0018ac@admin.monash.edu.my>
References: <3F8CF4C7.7010909@iprimus.com.au>
Reply-To: <eturner@monash.edu.my>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F8CF4C7.7010909@iprimus.com.au>
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
To: 'Michael Kearey' <mutk@iprimus.com.au>
Cc: netfilter@lists.netfilter.org

Yes it is commented out. Ive added a limit to both echo-request and
echo-replies. Hope this would stop problems exhibit by the Welchia
Virus.

Regards
edmund

#####################
#####ICMP CHAINS#####
#####################
/sbin/iptables -N ICMP
/sbin/iptables -F ICMP
/sbin/iptables -A ICMP -m limit -p ICMP -i eth2 --limit 1 --limit-burst
10
/sbin/iptables -A ICMP -m limit -p ICMP -i eth1 --limit 1 --limit-burst
10
/sbin/iptables -A ICMP -m limit -p ICMP -i eth0 --limit 1 --limit-burst
10
/sbin/iptables -A ICMP -p icmp --icmp-type echo-reply -m limit --limit
5/second  -j ACCEPT
/sbin/iptables -A ICMP -p icmp --icmp-type echo-request -m limit --limit
5/second  -j ACCEPT
#/sbin/iptables -A ICMP -p icmp --icmp-type echo-request  -j ACCEPT
/sbin/iptables -A ICMP -p icmp --icmp-type destination-unreachable -j
ACCEPT
/sbin/iptables -A ICMP -p icmp --icmp-type source-quench -j ACCEPT
/sbin/iptables -A ICMP -p icmp --icmp-type time-exceeded -j ACCEPT
/sbin/iptables -A ICMP -p icmp -j LOG --log-level 5 --log-prefix "ICMP
DROP: "
/sbin/iptables -A ICMP -p icmp -j DROP


-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Michael Kearey
Sent: Wednesday, October 15, 2003 3:19 PM
Cc: netfilter@lists.netfilter.org
Subject: Re: ICMP floods

Alistair Tonner wrote:
<Snip>
>>/sbin/iptables -A ICMP -p icmp --icmp-type source-quench -j ACCEPT
>>/sbin/iptables -A ICMP -p icmp --icmp-type time-exceeded -j ACCEPT
>>#/sbin/iptables -A ICMP -p icmp --icmp-type echo-request  -j ACCEPT
   ^


>>/sbin/iptables -A ICMP -p icmp --icmp-type echo-request -m limit
--limit
>>5/second  -j ACCEPT
> 
> 
> The  limit rule above will never be used as the packets are allready
accepted 
> by the rule above it.
<Snip>

It's commented out isn't it?

Cheers,
Michael


