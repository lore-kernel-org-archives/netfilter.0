From: Payal Rathod <payal-iptables@staticky.com>
Subject: Re: default policy
Date: Mon, 25 Aug 2003 14:56:35 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030825145635.GA29591@staticky.com>
References: <20030826083534.GA1573@linux.local> <1061801982.1507.38.camel@kermit>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1061801982.1507.38.camel@kermit>
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
Content-Transfer-Encoding: 7bit
To: Ralf Spenneberg <lists@spenneberg.org>
Cc: Netfilter <netfilter@lists.netfilter.org>

On Mon, Aug 25, 2003 at 10:59:42AM +0200, Ralf Spenneberg wrote:
> Am Die, 2003-08-26 um 10.35 schrieb Payal Rathod:
> > $IPTABLES -P INPUT DROP
> > $IPTABLES -P OUTPUT ACCEPT
> > $IPTABLES -P FORWARD DROP
> > 
> > $IPTABLES -t nat -A POSTROUTING -j MASQUERADE
> > 
> > $IPTABLES -A FORWARD -s 125.125.125.0/24 -p tcp -m tcp --dport 21 -j ACCEPT
> > $IPTABLES -A FORWARD -s 125.125.125.0/24 -p tcp -m tcp --dport 80 -j ACCEPT
> > $IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
> > $IPTABLES -A FORWARD -p icmp --icmp-type 0 -j ACCEPT
> > 
> > When I make FORWARD POLICY as ACCEPT it works, but not when I make it
> > to DROP? Is there any bad rule anywhere?
> Yes, apply masquerading only to the external interface, like
> $IPTABLES -t nat -A POSTROUTING -o eth1 -j MASQUERADE

Both the ips are connected to real world. One is connected to the ISDN
router (internal ip) and the other to lease line.
Some people use ISDN route some lease line route.
I have 1 default gateway for each interface.
Is this OK?

> If 125.125.125.0 is your internal ip-range you should be able to browse
> to:
> http://217.160.128.61
> But since you do not allow any DNS traffic you can't resolve any
> hostnames.
> 

Yes I releasied that. I have added tcp and udp for dns too.
Waiting for the mail.
With regards,
-Payal

-- 
For GNU/Linux Success Stories and Articles visit:
          http://payal.staticky.com

