From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: Masqureading issues... packets go over wrong link
Date: Fri, 13 Aug 2004 17:25:54 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF591E354@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: dravya <dravya@magma.ca>, Netfilter mailing list <netfilter@lists.netfilter.org>

> You mention these rules for my scenario... but can I use ppps instead
> of eth0 and eth1.

Yes, it'll work fine with dialup's as well, although it doesn't have
network link loss detection. I'm making the assumption that your lines
are up. Any new sessions pointing to a dead link will fail.

> Also, we have implemented a TCP cache (makes sure
> (ties to) that packets of each session go over the correct link) and
> a load balancing alogrithm.

Neat

> I am guessing these rules will override
> them.

Yes, but of you use the OUTPUT chain to send the traffic out, you can do
some work to get netfilter to do what you want it to:

IP1=3D1.1.1.1
IP2=3D2.2.2.2

	iptables -t mangle -A OUTPUT -j CONNMARK --restore-mark
	iptables -t mangle -A OUTPUT -m mark ! --mark 0 -j ACCEPT
	iptables -t mangle -A OUTPUT --source ${IP1} -m mark --mark 0 -j
MARK ${MY_POLICY_ETH0}
	iptables -t mangle -A OUTPUT --source ${IP2} -m mark --mark 0 -j
MARK ${MY_POLICY_ETH1}
	iptables -t mangle -A OUTPUT -m mark --mark 0 -j MARK
${MY_POLICY_DEFAULT}
	iptables -t mangle -A OUTPUT -j CONNMARK --save-mark

You can see the opbious problem here: You'd have to call this script
again each time any of the IP addresses changed, and since you use PPP,
I imagine that happens more than 0 times.


> As of right now I don't know what exactly your mentioned rules
> are doing .. . but how exactly is the load balancing working? for
> more than 2 links?

	The load balancing is taken care of by the nth target. Help
page:
	nth v1.2.9 options:
	   --every     Nth              Match every Nth packet
	  [--counter]  num              Use counter 0-15 (default:0)
	  [--start]    num              Initialize the counter at the
number 'num'
	                                instead of 0. Must be between 0
and Nth-1
	  [--packet]   num              Match on 'num' packet. Must be
between 0
      	                          and Nth-1.
=09
      	                          If --packet is used for a counter than
            	                    there must be Nth number of --packet
                  	              rules, covering all values between
0 and
                        	        Nth-1 inclusively.
=09
	It is a simple round-robbin algorithm that can be easily be
applied to connections. If this isn't sufficient, you can always get
into Linux Quality of Service from lartc.org. It is 'the' source for IP
level stuff. My solution is more robust in that it session tracks so
that ICMP replies to a tcp connection return on the same connection, FTP
NAT, etc.. The tradeoff being you have to manually update the pool by
detecting dead paths and removing them. A shell script could be easily
done to accomidate.

=09
>..... How exactly does it mark a packet?Does it
> modify the actual packet? =20

No. The packet is only 'mark'ed inside the kernel. There aren't any
payload changes.

> This will be a big step for me, as then I am guessing we will not
> need our own created TCP cache and load balancing.

Depending on your needs, this system may be more useful you. Once you
have a better look at what netfilter can do, you may find that all
problems can be solved.

> Will all these rules work for only icmp if I wanted? just use -p
> icmp? Would it at all conflict with TCP packets???

Yes. ICMP replies to echo requests should correctly be redirected back
to the destined source. I'm not sure off hand if ICMP errors based on
TCP connections will be routed properly though.=20

> Appreciate it if you can answer my questions. As you can tell I am a
> total newbie on this. Is there any documentation regarding these
> issues?=20

I didn't find much on the subject when I was looking around. It was just
by chance that I caught a notice for CONNMARK and said: Will that solve
this?? I'm glad to say it did.

Looking more at iproute2 based documentation may be helpful.
http://lartc.org
http://www.linuxgrill.com/iproute2.doc.html
CONNMARK page may be some use to you. It confused the heck out of me
until it worked.
http://home.regit.org/connmark.html

