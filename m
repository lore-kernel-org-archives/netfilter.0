From: "Sadus ." <sadus@swiftbin.net>
Subject: Re: Internal PC/external Gateway
Date: Sat, 14 May 2005 21:30:10 +0300
Message-ID: <1116095410.18707.14.camel@debianbox>
References: <1116061176.12835.20.camel@debianbox>
	<20050514153608.GA24455@bender.817west.com>
	<1116087634.18707.2.camel@debianbox>
	<20050514164144.GA24669@bender.817west.com>
	<1116090083.18707.6.camel@debianbox>
	<20050514172613.GA24810@bender.817west.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050514172613.GA24810@bender.817west.com>
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
To: Jason Opperisano <opie@817west.com>
Cc: netfilter@lists.netfilter.org

Before continuing, thanks alot for your help.

                                           +------------+        
                                           |            |       |
                                       ----+ Provider 1 +-------
192.168.1.2                          |   | 10.2.2.1  |     /
   PC1__/  \_         +------+-------+ |   +------------+    |
   _/        \__      |              | |                    /
  /             \     | 10.2.2.253 | |                    |
 | Local network -----+Linux GW  eth0|-                     |Internet
  \_           __/    |192.168.0.141 |                   |
    \__     __/       |              | |                    \
   PC2 \___/          +------+-------+ |   +------------+    |
192.168.1.3                          |   |            |     \
                                       ----+ Provider 2 +-------
                                           |192.168.0.173     |
                                           +------------+        

so a little reminder. i just want 192.168.1.3 to take Internet from
192.168.0.173
my GW has as you see has 2 IPs in eth0, and i can reach both of my
Providers with that setup.

btw, is there any article to read about the priority of rules while
writing an iptables script?

best regards,

On Sat, 2005-05-14 at 13:26 -0400, Jason Opperisano wrote:

> On Sat, May 14, 2005 at 08:01:22PM +0300, Sadus . wrote:
> > this is after your email my current setup.
> > 
> > iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to 10.2.2.1
> > iptables -t nat -A POSTROUTING -s 192.168.1.3  -j SNAT --to
> > 192.168.0.141
> 
> um--that second rule will never match, assuming the packets from
> 192.168.1.3 are being routed out eth0--which from your OP it is.  put
> the rule for 192.168.1.3 first.
> 
> > #!/bin/bash
> > 
> > IF1=eth0
> > 
> > #Provider 1
> > P1=10.2.2.1
> 
> is the IP address of P1's router 10.2.2.1, or is the IP of the linux
> gateway on eth0 10.2.2.1?  you're using the same IP in your SNAT rule
> and routing table--one of them is wrong.
> 
> > #Provider 2
> > P2=192.168.0.173
> > 
> > ip route add default via $P2 table T2
> > ip rule add from 192.168.1.3 table T2
> > ip route flush cache
> > 
> > can't i keep it like that? or i have to set T1 too?
> 
> setting up T1 is for completeness, and for the benefit of the roughly 6
> people on the planet that actually search ML archives instead of posting
> the same 5 questions over and over and over and over and over again.  T1
> is not strictly necessary in your specific case.
> 
> the devil is in the details--if you're not sure of what specific IP's
> need to go where--you need to tell us what's what.  the output of
> 'ip -4 -o addr sh' on the linux gw would help, the IP's of the P1 and
> P2 routers would help, and the IP's of PC1 and PC2 would help.
> 
> -j
> 
> --
> "Meg: Dad, if I don't get my driver's license, I'll never have any
>  boyfriends, I'll never get married and I'll have to adopt a kid like
>  Rosie O'Donnell. 
>  Peter: Meg... are you implying that Rosie O'Donnell cant drive?"
>         --Family Guy
> 
