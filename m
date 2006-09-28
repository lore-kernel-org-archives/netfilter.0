From: Burak Ozgoren <BOzgoren@gunessigorta.com.tr>
Subject: Re: how to write different ip sources on a single rule
Date: Thu, 28 Sep 2006 16:00:01 +0300
Message-ID: <OF15DCC8F4.3BF8C98F-ONC22571F7.0046BDAF-C22571F7.0047B2A8@gunessigorta.com.tr>
References: <59382.193.173.147.3.1159447584.squirrel@webmail.sterenborg.info>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <59382.193.173.147.3.1159447584.squirrel@webmail.sterenborg.info>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

> On Thu, September 28, 2006 14:22, Burak Ozgoren wrote:
> > I know about range, and mask but need a rule like for example:
> >
> > Accept port 22 connections from 192.168.0.5, 10.10.60.163, 212.12.X.X
> >
> > Now i am writing 3 different rules for these.
> 
> You can't with iptables, but although I'm not familiar with it myself, I
> thought you could do (something like) this with ipset.
> 
> http://ipset.netfilter.org/features.html
> 
> 
> Grts,
> Rob
> 

I made a chain named ADMIN

-A ADMIN -s 192.168.0.5 -j ACCEPT 
-A ADMIN -s 10.10.60.163 -j ACCEPT 
-A ADMIN -s 212.12.X.X -j ACCEPT

And running that chain if my situation is ok.

-A INPUT -p tcp -m tcp -m multiport --dports 22,10000 -m state --state NEW 
-j ADMIN 

I think i can group ip's in a chain, and run that group whereas needed.

Will look for the ipset.

Thank you very much.

