From: Fabio Corneti <fabio@gekolab.it>
Subject: Re: Problems after recompiling iptables 1.2.7 ..
Date: Mon, 20 Jan 2003 14:32:52 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200301201432.52665.fabio@gekolab.it>
References: <1043049590.1543.5.camel@rayw.knowledgefactory.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1043049590.1543.5.camel@rayw.knowledgefactory.co.za>
Content-Disposition: inline
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

On Monday 20 January 2003 08:59, Raymond Leach wrote:
> Hi
>
> I have a problem with NAT after recompiling iptables and my kernel.
>
> This line gives an 'invalid argument' error:
> iptables -t nat -A PREROUTING -i eth0 -s 192.168.0.0/24 -j SNAT
> --to-source 196.4.160.2
>
> Is there something wrong with the above line, or is there something
> wrong with my kernel or iptables?
>
> kernel version = 2.4.20 - 'Full Nat' is enabled
> patch-o-matic 'time' patch applied
> iptables version = 1.2.7
>
> There were no errors during compile. Although, after rebooting the
> machine complains about a missing map file.
>
> Regards
>
> Ray

Shouldn't be specified an output interface/address with the -o option? 
Moreover, I think that if you want to do source nat, you should do it in the 
POSTROUTING chain. Try this (the existence of another network card eth1 is 
presumed):

iptables -t nat -A POSTROUTING -i eth0 -o eth1 -s 192.168.0.0/24 -j SNAT
--to-source 196.4.160.2

-- 
Fabio Corneti
fabio@gekolab.it

