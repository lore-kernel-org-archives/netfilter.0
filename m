From: Michael <mutk@iprimus.com.au>
Subject: Re: forward is not forwarding
Date: Fri, 06 Sep 2002 16:46:14 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3D784F36.7020105@iprimus.com.au>
References: <EF33C96B91C212479FA2B0B0A96868F80102C886@sydxch02.veritas.com>
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
To: IPtables Users <netfilter@lists.samba.org>

Did you enable Kernel to do forwarding??


ie
echo 1 > /proc/sys/net/ipv4/ip_forward

Cheers,
Michael

Abraham Kim wrote:

> Just installed RedHat, with two NICs, 10.1.1.1 and 192.168.1.1 each.
> Added 2 rules in FORWARD, but I can't ping from 10.1.1.2 to 
> 192.168.1.2, vice versa.
> (those 2 are Sun machines, got default route to 10.1.1.1 and 
> 192.168.1.1 each)
>  
> iptables -i eth0 -o eth1 -A FORWARD -j ACCEPT
> iptables -i eth1 -o eth0 -A FORWARD -j ACCEPT
>  
> Did I miss anything simple here?
> Should I arrange a routing module separately?
>  
> Thanks in advance,
> Abraham





