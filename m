From: Andrew Beekhof <beekhof@gmail.com>
Subject: Re: Masquerade difficulties
Date: Sat, 8 Jan 2005 11:03:22 +0100
Message-ID: <26ef5e7050108020312386f9c@mail.gmail.com>
References: <20050107221238.GA10943@pog.tecnopolis.ca>
Reply-To: Andrew Beekhof <beekhof@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050107221238.GA10943@pog.tecnopolis.ca>
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
To: Trevor Cordes <trevor@tecnopolis.ca>
Cc: netfilter@lists.netfilter.org

On Fri, 7 Jan 2005 16:12:38 -0600, Trevor Cordes <trevor@tecnopolis.ca> wrote:
> > I'm having some difficulties getting masquerading to work and hoping
> > for some pointers...
> 
> I can try to help.  But you'll need to better describe your network
> layout.  Can you draw a little diagram showing where A, B & C are?

Sure, A & B are connected directly to a netgear DSL modem/hub.  C is
part of my company's network which I'm accessing over the internet
with ipsec.  I've also tried replacing C with google.com (after
specifying an appropriate routing rule) with no success.

Does that clear things up?

> 
> Are you sure that BoxC doesn't have some firewall on (XP SP2) that is
> eating the ping packets?

XP? God no!  All the machines are linux boxes running either SLES9 or
Gentoo :)  No firewall on B or C.

From what I can tell, the packets from BoxB are getting lost on BoxA. 
I just tried using telnet and tcpdump and although I get logs like
this:

Jan  8 08:35:55 BoxA IN=eth0 OUT=eth0 SRC=192.168.9.22 DST=10.10.2.86
LEN=60 TOS=0x10 PREC=0x00 TTL=63 ID=48952 DF PROTO=TCP SPT=34452
DPT=69 WINDOW=3840 RES=0x00 SYN URGP=0

... the packets never actually arrive at BoxC (10.10.2.86).  I dont
think they ever leave BoxA but I'm not sure I understand the tcpdump
output enough to say for sure.

A dump of my iptables in case it helps...

mayo linux # iptables -L -t nat
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination         

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination         
LOG        all  --  anywhere             anywhere            LOG level warning 
MASQUERADE  all  --  anywhere             anywhere            

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination         

mayo linux # iptables -L -t filter
Chain INPUT (policy ACCEPT)
target     prot opt source               destination         

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination         

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination         

mayo linux # iptables -L -t mangle
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination         

Chain INPUT (policy ACCEPT)
target     prot opt source               destination         

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination         
LOG        all  --  anywhere             anywhere            LOG level debug 

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination         

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination

