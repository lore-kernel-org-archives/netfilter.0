From: Tib <tib@tigerknight.org>
Subject: Re: Rules not taking effect - 2nd try
Date: Thu, 17 Oct 2002 17:32:39 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0210171713000.6045-100000@altaica.tigerknight.org>
References: <20021017233505.MZJE27697.mta05-svc.ntlworld.com@there>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021017233505.MZJE27697.mta05-svc.ntlworld.com@there>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Fri, 18 Oct 2002, Antony Stone wrote:

> > I'm using 1.2.6a-5 for debian, using init.d scripts. 
iptables v. 1.2.6a package for debian, init.d scripts for 
start/stop/save_active/save_inactive, etc.

> >The problem is that when I write a rule, it does not take effect.

When I write this rule at the command prompt:

iptables -t nat -A PREROUTING -p tcp -d 216.36.67.63 --dport 40000:40200 
-j DNAT --to-destination 192.168.1.22

it gets added to the table/chain correctly, but does not take effect. IE 
if you telnet to 216.36.67.63 on port 40000, it does not get forwarded to 
192.168.1.22 as it should.

> > I have also found that a rule I had in place from earlier and I flushed it,
> > still worked even though iptables -t nat -L showed nothing.

This rule was already in existance and working fine:

iptables -t nat -A PREROUTING -p tcp -d 216.36.67.63 --dport 4996:5000 
-j DNAT --to-destination 192.168.1.4

But when I flushed it (iptables -t nat -F or iptables -t nat -C PREROUTING 
-D 1), the rule still worked even though iptables -t nat -L showed a blank 
prerouting ruleset.

> You mention -t nat specifically.

Yes, I'm not sure what this comment means though.

> You should be aware that existing connections which have been NATted bypass 
> the explicit rules in the nat table, in order to perform forward and reverse 
> NAT transparently, automatically and efficiently.

But there are were no existing connections on ports 40000:40200, this was
an attempt to forward activity on these ports to a host inside my network
in anticipation of using a program through my firewall.

> If your FORWARD chain (I'm assuming this is a routing firewall) contains a 
> rule to allow ESTABLISHED packets then further packets in a connection stream 
> will continue to pass through the firewall even if you remove the rule/s 
> which originally allowed the connection to get set up.

So as soon as the connection is gone, it would time out and the new rules 
would apply?

> What exactly are you trying to do ?   What rules are you trying to remove, or 
> what traffic are you trying to block ?

Ok - here's my setup:

DSL connection
||
router (which forwards all traffic by default to linux box)
||
linux box (acts as default gateway/masquerade box for internal network. 
||         has web/mail/etc services on it which router forwards traffic 
||         to)
internal network (192.168.1.x - has a host that I am running a program on 
                  that I want incoming connections to reach. it uses ports 
                  40000 to 40200)


Here's the ruleset:

altaica:~# iptables -t filter -L
Chain INPUT (policy ACCEPT)
target     prot opt source               destination         

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination         

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination         


altaica:~# iptables -t nat -L
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination         
DNAT       tcp  --  anywhere             216.36.67.63       tcp 
dpts:4996:5000 to:192.168.1.4 

DNAT       tcp  --  anywhere             216.36.67.63       tcp 
dpts:40000:40200 to:192.168.1.22 

DNAT       udp  --  anywhere             216.36.67.63       udp 
dpts:40000:40200 to:192.168.1.22 

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination         
MASQUERADE  all  --  anywhere             anywhere           

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination         


altaica:~# iptables -t mangle -L
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination         

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination


The rule for ports 4996:5000 is to forward dcc connections on irc to my 
desktop machine (this one works, and stayed in effect even when I deleted 
the rule and there were no irc programs running or active connections on 
these ports).

The rules for 40000:40200 are the new rules I added but that don't seem to 
have taken effect. There were no existing connections on these ports since 
there was no service on the linux box on these ports, and no one was 
attempting to connect to them before I setup the rules.


I am trying to find out if, after I write the rules, there is some 
'reload' command I need to feed the system to have it look at iptables 
again and update it's current handling. I had always thought that rules in 
iptables take immediate effect, but someone I know mentioned this having 
something to do with the ip_conntrack module - though I have no idea what 
to do about it.

<EOL>
Tib


