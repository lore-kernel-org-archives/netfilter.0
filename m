From: "Laila Winblad Berntsen" <john@pepco.no>
Subject: Re: SNAT firewall maybe compromised. Misconfiguration?
Date: Tue, 29 Apr 2003 19:08:01 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <003001c30e71$e4213260$010a0a0a@suburban>
References: <004301c30e61$541d5190$1800a8c0@medusa>
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
Content-Type: text/plain; charset="us-ascii"
To: Thiago Lima  <thiagolima@webforce.com.br>, netfilter@lists.netfilter.org

This is only telling whats the policy of the chain, setting it to DROP
will drop all packets that dont match a rule in the chain.

A good idea would be to put them first.

Regards
John Berntsen

----- Original Message ----- 
From: "Thiago Lima " <thiagolima@webforce.com.br>
To: <Alistair@nerdnet.ca>; <netfilter@lists.netfilter.org>
Sent: Tuesday, April 29, 2003 5:09 PM
Subject: RE: SNAT firewall maybe compromised. Misconfiguration?


> 
> No, I did not. 
> 
> The script was cut off, but only in some portforwarding rules, just more
> 5 redirects. 
> 
> Should I use this -P INPUT DROP -P FORWARD DROP in both interfaces? In
> the end of my script?
> 
> thanks
> thiago.
> 
> 
> -----Original Message-----
> From: Alistair Tonner [mailto:Alistair@nerdnet.ca] 
> S
> 
> You aren't showing us your policies, and that leads me to
> believe
> that the chain policies might be ACCEPT ... which is very not
> good.
> Also it ranter looks like this script was cut off.... so I can't
> be sure...
> 
> $IPTABLES -P INPUT DROP
> $IPTABLES -P FORWARD DROP
> 
> ?? do you do this at all??
> -- 
> 
> Alistair Tonner
> nerdnet.ca
> Senior Systems Analyst - RSS
> 
>      Any sufficiently advanced technology will have the appearance of
> magic.
> Lets get magical!
> 
> 


