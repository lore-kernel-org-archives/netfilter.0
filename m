From: raido <raido@elin.ttu.ee>
Subject: Re: DNAT forwarding problems
Date: Thu, 5 Aug 2004 15:32:47 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200408051525.38235.raido@elin.ttu.ee>
References: <411166D5.30105@galacticasoftware.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <411166D5.30105@galacticasoftware.com>
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
Cc: Adam Majer <adamm@galacticasoftware.com>

Hi!
> external IP addresses: [A], [B]
> internal IP address: [C] - not the NAT box
>
> I want all udp port 53 traffic from [A]->[C] and from [B]->[C]. So I set
> up the following rules
>
> When the packet comes over interface[B], it also gets to the PREROUTING
> chain, but it never gets to the FORWARD chain and thus never even gets
> to [C]. It just dissapears into thin air. My routing seems correct..

> PS. kernel 2.6.7, iptables 1.2.9
I wrote few days ago about my problem which seems to be alike, in this list. I 
have same configuration and I need to DNAT all traffic from [A] to [C] and 
packets also disapear in PREROUTING chain. I have also 2.6.7 kernel and  
iptables 1.2.9. Next I plan to upgrade to iptables 1.2.10. If this does not 
help, maybe it is time to make a bug report?


Raido

