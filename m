From: "Bob Avery-Babel" <Bob@yellowbugcomputers.com>
Subject: Still an IPTABLES newbie
Date: Tue, 26 Nov 2002 13:49:36 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <006101c29584$f31904c0$8f8aa0cf@um.umsystem.edu>
References: <20021122155352.GA5665@gnjilux.srk.fer.hr> <200211241945.38762.netfilter@newkirk.us> <20021126105429.GB9457@gnjilux.srk.fer.hr> <200211260853.46333.netfilter@newkirk.us> <20021126140315.GA12281@gnjilux.srk.fer.hr>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Thanks to everyone for the tips on my last question. If anyone on this list
lives close to Columbia, MO, and would like to tutor me just give me a
holler. :-) Here are my new questions, after reading and re-reading the
first 128 pages of "Linux Firewalls" by Robert Ziegler.

My setup is a RH 8 box with an internal and an external nic. I also run all
my services (ssh, http, samba) on this box, as I am poor and this is only a
test box. :-). I have set all of my initial policies to drop as was
suggested here. Now I've slowly been trying to learn how to add exceptions
and understand just how the rules are constructed.

Many of the scripts I've looked at, and in Ziegler's book, they mention
"Symbolic Constants" that look like this:

INTERNET="eth0"        #Internet connected interface

Does IPTABLES recognize things like this, or is this just a convention to
help humans read the rules easier? If I defined all of the symbolic
constants at the start, where in the iptables script would I specifically
put them? Is there a command line option to add them or do I edit the file
directly to add the constants? When I tried to add the constants to the
beginning of my script it errored out on me.

Another question I have is how to add iptable rules. Usually when I set up
the first script I enter in the lines one at a time, and then when I've
added all of the lines I want I'll enter a command like:

iptables-save > /etc/sysconfig/iptables

Then I'll have a working iptables script. However, if I want to add
additional rules one by one at the cli and then do another iptables-save it
overwrites what I originally had. Are there easier options to do this, or is
it best just to edit the file itself?

My third question is about the format of the examples Robert Zeigler gives
in his Linux Firewalls book. He writes all of his rules like this, without
any explanation as to why. I guess it is supposed to be obvious? For
example:

iptables -A OUTPUT -o $INTERNET -p tcp \
-m multiport --destination-port \
$NFS_PORT,$OPENWINDS_PORT,$SOCKS_PORT,SQUID_PORT \
--syn -j DROP

Are these "\" just to indicate line breaks? Sorry if that is an obvious
question. oy!

Final question for the month, I swear...

In trying to understand forwarding the packets from my internal nic to my
public nic and vice versa. Do I need to make a rule for both inbound and
outbound traffic to each nic?

For instance, to allow Samba traffic to flow, here is what I am thinking:

Allow Internal network traffic to my internal nic card, does the traffic
need to flow to my public IP? I've only bound my samba server on my internal
nic and localhost.

Do I need to put a rule in place that looks something like:

-A OUTPUT -o eth1 -p tcp --sport 445 -j ACCEPT
#Anything headed outbound to the private nic, destined for port 445, Accept

I don't think that is right, but it is kind of how I understand (or don't
understand) the concept.

Thanks in advance to everyone!

Bob




