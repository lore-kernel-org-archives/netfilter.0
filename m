From: Krunk <krunkalot@hotpop.com>
Subject: RE: Curious problem with my iptable rules.....detailed
	postinside,help appreciated.
Date: Sun, 18 Apr 2004 20:58:16 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1082339896.4467.105.camel@james>
References: <20040419001151.A20563B97@sterenborg.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040419001151.A20563B97@sterenborg.info>
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
To: Rob Sterenborg <rob@sterenborg.info>
Cc: 'Netfilter' <netfilter@lists.netfilter.org>

On Sun, 2004-04-18 at 19:11, Rob Sterenborg wrote:
> -s has no parameter ; it's a typo. It should read 192.168.1.0/24 ?
> 
Sorry, the actual script does have that, error in copying over.

> You have set INPUT policy to ACCEPT, so this rule has nothing to do.
I did this since the second client still couldn't connect...I was making 
"double sure" that http access was ACCEPTED.


> I don't know what is working for you. You're executing 2 scripts, where the
> second is overruling the first in some points, some not.
I know that's exactly what my problem is. I have this little script that I wrote
just get things up and going...sort of a "ok, now everything is working
lets build some rules script". But my real script (the larger one) does
not allow internet access to my second client unless I run this little
script first. The reason I'm confused is that before each script is run
all the rules and chains are deleted.....so they *shouldn't* be
affecting one another. This is covered in the intial post.

> Yes. Setting the policy to DROP means filtering.
Cool, that's what I thought...just making sure.
> 
> > $IPT -t nat -A PREROUTING                        -j ACCEPT
> 
> First, you set policy to DROP, next you allow everything with this rule. Why
> are you doing this ?
I was following the general security guideline of "Deny, than ACCEPT".
Setting Policy to DROP intially, than later on..when more packet
filtering rules are in place, setting to accept.

> 
> - Reboot the PC.
> - Don't execute your firewall scripts.
> - Leave the policies of the nat and mangle table alone. Default is ACCEPT
> and that is correct in most cases. AFAICS in your case too.
> - Use filtering rules in the filter table (you can explicitly use -t filter
> or omit it)
> - Use NAT rules in the nat table (-t nat)
> - Use packet altering rules in the mangle table (-t mangle)
> - Don't mix the three above.
> - Start with a small script (only one) and expand the script when it's
> working. What I understand is that you biggest problem is getting NAT to
> work.
> Start with a small script like this (I forgot the RELATED,ESTABLISHED rules
> before) :
> 
> echo 0 > /proc/sys/net/ipv4/ip_forward
> iptables -P INPUT DROP
> iptables -P FORWARD DROP
> iptables -F FORWARD
> iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
> iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
> iptables -A FORWARD -i eth1 -o ppp0 -s 192.168.1.0/24 -j ACCEPT
> iptables -A FORWARD -i eth2 -o ppp0 -s 192.168.2.0/24 -j ACCEPT
> iptables -t nat -A POSTROUTING -o ppp0 -s 192.168.1.0/24 -j MASQUERADE
> iptables -t nat -A POSTROUTING -o ppp0 -s 192.168.2.0/24 -j MASQUERADE
> echo 1 > /proc/sys/net/ipv4/ip_forward

After a fresh reboot, the script above enables access to my first client
on eth1 but NOT my second on eth2. However, I've eliminated the nat DROP
policy and now my main script works at boot up. So I can carry on with
my incremental troubleshooting minus the irritating
reboots........Thanks!

The book I'm reading didn't go into detail on why it set the policy of
the nat chains int particular to DROP but included it in the section
which suggested setting all policies to drop before flushing at the
beginning of a script.
Flushing is done to ensure a clean slate for the rule set (obviously)
and setting to Drop is to ensure no packets are passed while the rules
are flushed. 

I understand this is unnecessary/excessive in a soho set-up, but
wouldn't filtering the nat table be a good thing in large networks where
you would want to prevent unauthorized internal ip's from passing
through the nat chain? 

Thanks for all the help.

James



