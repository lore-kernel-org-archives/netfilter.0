From: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Subject: Re: NAT & MySQL
Date: Tue, 25 Nov 2003 16:24:55 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3FC3C8A7.2030301@Loudoun-Fairfax.com>
References: <200311251923.hAPJNpiu001203@server5.bandwidthco.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200311251923.hAPJNpiu001203@server5.bandwidthco.com>
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
To: netfilter@lists.netfilter.org

Mark E. Donaldson wrote:

> The ACK packets you see in your dump are probably being dropped at the 
> firewall because a state table entry does not exist.  So you need to 
> add a NEW rule to do this:
>  
> iptables -A FORWARD -i ppp0 -o eth0 -m state --state NEW -j ACCEPT
>  
> this rule will then allow your ESTABLISHED,RELATED rule to work and 
> permit those ACK packets to pass.
>
>

Hi Mark,

I'm not sure I understand what this rule does for him. Only the first 
packet from the web client would be NEW and based on his FORWARD rules 
that's been accepted and the dump shows it went through (although I'd 
still like to see his SNAT rule). Your rule would open his mysql server 
to any NEW packet. Are you saying that the RELATED ACK packets won't go 
through unless the first packet is matched with a NEW state and makes an 
entry in the state table?

Jeff



