From: Chris Wilson <chris@netservers.co.uk>
Subject: Re: PCAnywhere and netfilter
Date: Mon, 30 Jun 2003 13:27:13 +0100 (BST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0306301314470.31613-100000@localhost>
References: <3F00135A.5070707@belfordhk.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F00135A.5070707@belfordhk.com>
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
To: cc <cc@belfordhk.com>
Cc: netfilter@lists.netfilter.org

Hi Edmund,

On Mon, 30 Jun 2003, cc wrote:

> ACCEPT     tcp  --  anywhere             192.168.5.31       tcp dpt:5631
> ACCEPT     udp  --  anywhere             192.168.5.31       udp dpt:5632
> ACCEPT     tcp  --  192.168.5.31         anywhere           tcp dpt:5631
> ACCEPT     udp  --  192.168.5.31         anywhere           udp dpt:5632

Is this a listing from FORWARD or PREROUTING? In fact, could you send 
the output of "iptables -L -n -v" and "iptables -t nat -L -n -v"?

> I've even modified the script to the following:
> (Yes, it is a trial and error effort as I've exhausted
> my limited knowledge in what's going on.)
> 
> PC_INT_IP="192.168.5.31"
> EX_IP="aa.bb.cc.dd"
> 
> $IPTABLES -t nat -A PREROUTING -i eth0 -d $EX_IP -p tcp \
>           --dport 5631 -j DNAT --to $PC_INT_IP
> $IPTABLES -t nat -A PREROUTING -i eth0 -d $EX_IP -p udp \
>           --dport 5632 -j DNAT --to $PC_INT_IP

Which interface is your external, and which is internal? If eth0 is 
external, and you have an ACCEPT ESTABLISHED rule, then all you need is 
the two rules above, and:

> $IPTABLES -A FORWARD -i eth0 -d $PC_INT_IP -p tcp --dport 5631 -j ACCEPT
> $IPTABLES -A FORWARD -i eth0 -d $PC_INT_IP -p udp --dport 5632 -j ACCEPT

> Here's where I'm completely confused.  Let's say:
>  I = some Internet IP
>  L = some LAN IP
> Fo = firewall's external IP,
> Fi = firewall's internal IP
>  P = PCAnywhere machine.
> 
> I -> Fo -> Fi -> P

I think this is the wrong way to look at NAT, although it's probably OK 
for routing.

Basically there are 3 stages:

- Packet arrives at machine (destination field is EX_IP)
- Packet passes through PREROUTING which rewrites the destination to 
  PC_INT_IP. The source address is not changed and the Firewall internal 
  IP (Fi) is not involved.
- Packet passes through FORWARD and is filtered based on the NEW 
  destination IP address (PC_INT_IP)

The reply packets should be covered by an ESTABLISHED rule, if any.

You could try to telnet from outside to EX_IP port 5631. If it says "Press 
[ENTER]" then your rules are OK. If it gives "Connection refused" then the 
internal machine is not listening. If it times out after 30 seconds then 
the NAT is still broken.

Please send tcpdumps of internal interface, along with "iptables -L ..."
as requested above.

> Does anyone have a working PCAnywhere-permitted firewall script?

Not a script, but it works for us here.

I've added netfilter@lists.netfilter.org back onto the CC: list, so that 
you can benefit from the advice of others as well as me, and our 
discussion should be recorded to help others in future.

Cheers, Chris.
-- 
   ___ __     _
 / __// / ,__(_)_  | Chris Wilson -- UNIX Firewall Lead Developer |
/ (_ / ,\/ _/ /_ \ | NetServers.co.uk http://www.netservers.co.uk |
\ _//_/_/_//_/___/ | 21 Signet Court, Cambridge, UK. 01223 576516 |




