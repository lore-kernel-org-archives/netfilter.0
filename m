From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: the impossible "iptables -C" option
Date: Sat, 24 Jul 2004 07:45:45 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1090669545.2012.33.camel@grendel>
References: <01be01c4710c$440a79e0$5100a8c0@egp>
	 <200407240856.03201.Antony@Soft-Solutions.co.uk>
	 <1090664200.2012.21.camel@grendel>
	 <200407241127.25946.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407241127.25946.Antony@Soft-Solutions.co.uk>
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
To: netfilter <netfilter@lists.netfilter.org>

On Sat, 2004-07-24 at 06:27, Antony Stone wrote:
>
> > Not quite true as you would just use a sting match, same as you would in
> > a filtering rule.
> 
> I'll assume you meant the "string" match :)   Although the idea of a sting 
> match in a firewall rule is an interesting one....

Dooh! Typing before my morning Pepsi. I think we already sort of have a
"sting" option, its called "Tarpit" ;-)

> I agree that for textual content you could say "a packet from this IP address 
> to TCP port 23 containing the string 'root'", however lots of protocols use 
> binary data

Agreed but that's kind of outside of the scope of the check option. ;-)

We're getting more into "what does a better job of checking payload,
stateful inspection or proxy". I agree proxies are better when it comes
to payload content, but I find the string match useful mostly because of
its simplicity. No proprietary, undocumented language to learn, just set
a few command line switches and away you go. :)

> However, as discussed by other people, there is more than one reason why 
> "check" is hard to implement, payload is just one of them (and I agree that 
> state is a more significant problem, and much harder to deal with).

Ya why burn cycles on trying to code something you can easily check with
nmap, hping & tcpdump. ;-)

Cheers!
Chris



