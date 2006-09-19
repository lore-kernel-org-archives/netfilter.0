From: varun <varun_saa@rediffmail.com>
Subject: RE: not able to ssh from the firewall
Date: Tue, 19 Sep 2006 19:08:32 +0530
Message-ID: <1158673112.4691.0.camel@nirvana.aurokruti.in>
References: <001101c6d307$bcf914b0$0101000a@tanjian>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <001101c6d307$bcf914b0$0101000a@tanjian>
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

Thanks a lot Rob,

I did manage to figure that out.

Varun


On Fri, 2006-09-08 at 07:29 +0200, Rob Sterenborg wrote:
> > OK, I had set :
> > 
> > -A OUTPUT -j DROP
> > 
> > So nothing worked.
> > 
> > If OUTPUT is set to :
> > 
> > -A OUTPUT -j ACCEPT
> > 
> > Then everthing works. I can ssh, ping to clients .
> > 
> > So how do I get it working with OUTPUT as DROP ?
> 
> I take it you have:
> -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> as your first INPUT rule to take care of returning packets.
> 
> An SSH server binds to port 22/tcp: you will be connecting to
> destination port 22/tcp which is what you'll have to ACCEPT. Therefore
> this should do it:
> 
> :OUTPUT DROP [80:13056]
> -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> -A OUTPUT -m state --state NEW -o lo -j ACCEPT
> -A OUTPUT -m state --state NEW -p tcp --dport 22 -j ACCEPT
> 
> This way you'll be blocking *everything* else, including DNS lookups.
> So, before you say it doesn't work, without these rules you'd only be
> able to connect using an IP address:
> -A OUTPUT -m state --state NEW -p tcp --dport 53 -j ACCEPT
> -A OUTPUT -m state --state NEW -p udp --dport 53 -j ACCEPT
> 
> If it doesn't work , add this to see what packets get logged when you're
> trying to connect to the SSH server:
> -A OUTPUT -j LOG --log-prefix "IPT: "
> 
> If you want to be able to do *anything* else, you must write a rule to
> accept it.
> 
> 
> Gr,
> Rob
> 
> 
> 


