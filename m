From: varun <varun_saa@rediffmail.com>
Subject: RE: not able to ssh from the firewall
Date: Fri, 08 Sep 2006 07:52:16 +0530
Message-ID: <1157682136.4889.4.camel@nirvana.aurokruti.in>
References: <001701c6d2c0$4d588b00$0101000a@tanjian>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <001701c6d2c0$4d588b00$0101000a@tanjian>
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
Content-Type: text/plain; charset="us-ascii"
To: Rob Sterenborg <rob@sterenborg.info>
Cc: netfilter@lists.netfilter.org

On Thu, 2006-09-07 at 22:57 +0200, Rob Sterenborg wrote:
> >>> I am not able to ssh from the firewall
> >>> to a client. Though the reverse is
> >>> working.
> >>> 
> >>> I would also like to put :
> >>> 
> >>> -A OUTPUT -j DROP
> >>> 
> >>> But if I do that clients are not able to connect
> >>> to the net. I need add a rule which I could
> >>> not figure out.
> >> 
> >> You should allow SSH out when you want to be able to use it.
> >> SSH listens on port 22, so this should do it:
> >> 
> >> -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> >> -A OUTPUT -p tcp --dport 22 -j ACCEPT
> >> -A OUTPUT -j DROP
> > 
> > No that did not work.
> 
> Of course not. AFAIK your current OUTPUT policy is still ACCEPT (see
> below) so that should not be the problem. (Don't mess with the OUTPUT
> chain untill your INPUT chain is working as you want it to.)
> 
> >>> :INPUT ACCEPT [80:13056]
> >>> -A INPUT -i eth0 -m state --state ESTABLISHED,RELATED -j ACCEPT
> >> 
> >> It looks like eth0 is connected to the internet and eth1 to your LAN.
> >> Check if outgoing ssh works using:
> >> 
> >> -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> 
> Did you try this?
> If it doesn't work, put a LOG rule just before the DROP rule to see what
> get's dropped when you're trying to setup an ssh session.
> 
> >>> :OUTPUT ACCEPT [80:13056]
> >>> -A OUTPUT -j ACCEPT
> >>> -A OUTPUT -o lo -j ACCEPT

OK, I had set :

-A OUTPUT -j DROP

So nothing worked.

If OUTPUT is set to :

-A OUTPUT -j ACCEPT

Then everthing works. I can ssh, ping to clients .

So how do I get it working with OUTPUT as DROP ?



> 
> Here is where I see you're not dropping anything in the OUTPUT chain.
> The first rule accepts everything so the second will never match and is
> useless. Further, your chain polocy is ACCEPT, so if you're not going to
> drop anything: why have rules in that chain to accept packets that would
> be accepted anyway? Just get rid of the OUTPUT rules for now and leave
> it's policy ACCEPT.
> 
> 
> Gr,
> Rob
> 
> 
> 


