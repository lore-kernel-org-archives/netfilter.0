From: "Tarek W." <ticallion@terra.net.lb>
Subject: Re: DNS
Date: Wed, 12 Feb 2003 07:06:40 -0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1045040802.1500.0.camel@carve.localdomain>
References: <3E22A883.103@mattiamartinello.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <3E22A883.103@mattiamartinello.com>
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

ur second forward rule matches tcp conns when it should match udp.

On Mon, 2003-01-13 at 09:52, Mattia Martinello wrote:
> Hi all
> 
> I wish to open DNS connections and redirect it from the gateway and the 
> server on the DMZ.
> I tried these rules:
> 
> iptables -t nat -A PREROUTING -p tcp -i ppp0 -d [public IP] --dport 53 
> -j DNAT --to [private IP]:53
> iptables -A FORWARD -i ppp0 -d [private IP] -p tcp --dport 53 -j ACCEPT
> 
> iptables -t nat -A PREROUTING -p udp -i ppp0 -d [public IP] --dport 53 
> -j DNAT --to [private IP]:53
> iptables -A FORWARD -i ppp0 -d [private IP] -p tcp --dport 53 -j ACCEPT
> 
> But if I try to query my DNS server from the Internet my query goes in 
> timeout.
> The connections between [private IP] and the Internet are allowed (all 
> other services work good without any problem, the only service that gets 
> me some problems is DNS).
> 
> What have I to open to allow DNS connections from the gateway and the DMZ?
> 
> Thank you very much
> Bye
> Mattia
> 
> 




