From: =?ISO-8859-15?Q?Pedro_Gon=E7alves?= <pedro.pandre@gmail.com>
Subject: Re: IPTables and different types of NAT
Date: Wed, 07 Feb 2007 18:23:05 +0000
Message-ID: <45CA1909.6000807@gmail.com>
References: <45C9F509.8010309@gmail.com> <45C9FBFB.9090607@riverviewtech.net>
	<45CA160E.90102@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45CA160E.90102@plouf.fr.eu.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: Mail List - Netfilter <netfilter@lists.netfilter.org>

Pascal Hambourg wrote:
>> "Full Cone Nat" could easily be implemented with inbound redirection 
>> to the internal system.
>
> "Full cone NAT" can be implemented with 1-to-1 bidirectional NAT using 
> SNAT+DNAT or NETMAP.
>
>> "Port Restricted Cone NAT" is nothing more than "Restricted Cone NAT" 
>> with port filtering.  This is what is usually done if you have a 
>> server behind a NATing router / firewall.  In this case, you only 
>> port forward the ports that you need.
>
> No. Please read more carefully the definitions of "restricted cone 
> NAT" and "port restricted cone NAT". Neither can be implemented with 
> iptables because they do not fit in the per-connection model.
>
>> I'm not sure if there is inherent support for "Symmetric NAT" or not. 
>
> "Symmetric NAT" works on a per-connection basis and is the NAT form 
> that is the easiest to implement with iptables using SNAT or MASQUERADE.

This is the main reason why I am asking: some people say it is possible 
to implement all this types of NAT, some say it's not.

Pascal, can you tell me where can I find information regarding the 
implementation of "Full Cone NAT" and "Symmetric NAT" using IPTables?
All I can find is discussions about whether it is possible or not to 
implement this.

Thanks a lot
Pedro


