From: Ian Batterbee <ian.batterbee@aut.ac.nz>
Subject: Newbie question about having multiple destination addresses in a
 chain entry
Date: Mon, 06 Jan 2003 00:39:35 +1300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E181977.4020204@aut.ac.nz>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Forgive me if this has been asked a hundred times, but there doesn't 
seem to be a search engine on the list archive, and I'm not going to 
download a 61mb index file to see if someone has already asked this.

I'm a newbie to iptables, but not to tcp/ip networking.

I'm using iptables to do transparent proxying. ie, I'm redirecting 
anything that comes through the router to the local port 3128 where 
squid can deal with it:

iptables -t nat -A PREROUTING -i eth0 -p tcp -m tcp --dport 80 -j 
REDIRECT --to-ports 3128

That much works.

The setup I have here is a linux box with a a dialup connection to work 
that's on all the time and includes the local subnet here (call it 
network 1 - address is unimportant), and a DSL modem plugged in over 
ethernet (network 2 / 192.168.0.0/24).

I don't want to proxy stuff from the webservers work, so I added an 
exclusion for that:

-d x.x.x.x/16

and that worked (yes, that's a class B)

The problem is that I also want iptables to allow un-redirected access 
for tcp/80 to network 2, so that I can get to the web interface on the 
DSL modem. I can telnet to it of course, but that's not the point.

 From what I've gathered with only a few hours of playing with iptables, 
I need to be able to specify either a "do nothing" jump target, or 
multiple -d arguments on the rule.

Unfortunately, I can't do multiple -d arguments:
iptables-restore v1.2.2: multiple -d flags not allowed

I'm not sure if that's changed in later versions, but the layout and 
design of the files in /proc and the output of -L seems to indicate that 
  iptables only ever expects a single -d argument.

So I'm left with trying to insert another rule before the redirect that 
will exit the chain without doing anything else.

And that's where I'm stuck.

I can create a new chain with -N NOTHING easily enough and I can send 
packets matching -d 192.168.0.0/24 (network 2) to it with the -j option, 
but it doesn't seem to make a lot of difference ... the accesses still 
show up in squid's access.log

So the jump to another rule doesn't seem to exit the current rule, 
because it matches the 2nd entry anyway.  I'm sure this isn't how I'm 
supposed to do it, because it seems kinda kludgy to have to create a 'do 
nothing' rule, and I'm not even sure that the idea is working in any case.

What I really need is to be able to reference an access list in the rule 
(ie, cisco style), and then be able to put multiple lines into the 
access list.. then there wouldn't be any issues with trying to specify 
multiple destination networks.

Or.. a way to tell it to stop processing the chain and exit without 
doing anything (which probably already exists, it's just I can't see it)

Here's the output from iptables -t nat -L

Chain PREROUTING (policy ACCEPT 16 packets, 1278 bytes)
  pkts bytes target     prot opt in     out     source 
destination
    26  1248 NOTHING    tcp  --  eth0   any     anywhere 
192.168.0.0/24     tcp dpt:www
    28  1344 REDIRECT   tcp  --  eth0   any     anywhere 
!x.x.0.0/16      tcp dpt:www redir ports 3128

Chain POSTROUTING (policy ACCEPT 29 packets, 1892 bytes)
  pkts bytes target     prot opt in     out     source 
destination

Chain OUTPUT (policy ACCEPT 24 packets, 1638 bytes)
  pkts bytes target     prot opt in     out     source 
destination

Chain NOTHING (1 references)
  pkts bytes target     prot opt in     out     source 
destination






