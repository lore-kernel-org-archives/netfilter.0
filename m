From: =?iso-8859-1?Q?Leonardo_Rodrigues_Magalh=E3es?=
	<leolistas@solutti.com.br>
Subject: Re: firewall rules for subinterfaces
Date: Fri, 15 Oct 2004 09:03:58 -0300
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <009301c4b2af$0e653070$8b00000a@casa>
References: <20041015035535.GA19170@clifford.headnut.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: Chris Verges <squirrel@headnut.org>, netfilter@lists.netfilter.org


    Short answer: NO

    Better answer: iptables cannot use subinterfaces. What you can do is, 
instead of using the subinterface as your criteria, use your IP addresses. 
So, in your situation, you can do:

iptables -A INPUT -i eth0 -p icmp -d 192.168.1.1 -j DROP
iptables -A INPUT -i eth0 -p icmp -d 192.168.2.1 -j ACCEPT

    If you REALLY need to difference subinterfaces, then you should try to 
split subinterfaces in two real interfaces.


    Sincerily,
    Leonardo Rodrigues

----- Original Message ----- 
From: "Chris Verges" <squirrel@headnut.org>
To: <netfilter@lists.netfilter.org>
Sent: Friday, October 15, 2004 12:55 AM
Subject: firewall rules for subinterfaces


> Hey,
>
> Is there a way to add firewall rules for subinterfaces?  I'm
> trying to do the equivalent of:
>
>  eth0   Intel Pro 10/100
>    eth0:0   192.168.1.1
>    eth0:1   192.168.2.1
>
>  iptables -A INPUT -p icmp -i eth0:0 -j DENY
>  iptables -A INPUT -p icmp -i eth0:1 -j ACCEPT
>
> When I try to do this at the command line, iptables spits back
> an error about how colons (:) are not allowed in the interface
> name.  That brings up the interesting question of how to do this
> whole thing ...
>
> Any advice or insight is greatly appreciated!
>
> Thanks,
>
> chris
> -- 
> http://headnut.org
> squirrel@headnut.org
>
> 


