From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: using iptables to share itunes 4.7 from home to work
Date: Tue, 23 Nov 2004 14:18:42 -0600
Message-ID: <41A39B22.2070705@pbl.ca>
References: <005901c4d0e6$ceadd210$fa00a8c0@developer>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <005901c4d0e6$ceadd210$fa00a8c0@developer>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Netfilter User Mailinglist <netfilter@lists.netfilter.org>

Brian French wrote:
> I have Itunes 4.7 running with all of my music at home.
> 
> I would like to be able to listen to that music on my itunes 4.7 here at
> my office.
> 
> I know that itunes 4.7 no longer allowes you to share over the internet.
> 
>  
> 
> My home and office network basically have a static ip address. 
> 
> Both are natted with private subnets behind the routers 
> 
>  
> 
> As far as I understand it, when itunes is running, it scans your local
> subnet for any other itunes that have sharing enabled.
> 
> It there any way, using iptables, to trick my office computer to think
> that my office router is actually my home computer on the port that
> itunes uses (3689) and do the same for my home? If so, what are the
> iptables commands to do so?

You'd probably need to sniff both your home and work network to see what
is exactly going on during those broadcasts.

If you are not into building a tunnel between two networks (so that they
look like one virtual network, which you *should not* do between your
home and work), you can try something like this (I won't go into
commands, since I don't know details about the protocol):

You need to get the broadcast packet from your home into yuor office.
src of that packet will be home-pc-private, dst will be home-broadcast
(it might also be 255.255.255.255, tcpdump will tell you which one).
Port will probably be 3689 (check with tcpdump).  So you'd need both
dnat and snat on your home firewall.  Rewrite dst to be office-public in
PREROUTING chain of nat table.  In FORWARD chain of filter table allow
this rewritten packet to go out.  In POSTROUTING chain of nat table
rewrite src to be home-public and hope source port hasn't changed.

It might look something like (this is not working, and probably not too
safe to use, so don't cut and paste without understanding what it does,
or you'll be *very* sorry one day).  I assumed protocol is UDP, and
invented some IP addresses.  If you understand what this does, you'll be
able to change them to correct ones.  If you don't understand what this
does, don't use this.

    iptables -t nat -A PREROUTING -s 192.168.0.2 -d 192.168.0.255
             -p udp --dport 3689 -j DNAT --to-destination 1.2.3.4
    iptables -t nat -A POSTROUTING -s 192.168.0.2 -d 1.2.3.4
             -p udp --dport 3689 -j SNAT --to-source 4.3.2.1
    iptables -A FORWARD -s 192.168.0.2 -d 1.2.3.4
             -p udp --dport 3689 -j ACCEPT

So, the packet is now on its way to your work firewall.

On your work firewall, in PREROUTING chain of nat table, rewrite dst to
be work-broadcast (or 255.255.255.255, if that is the way iTunes
broadcasts).  Allow this rewritten packet to pass in FORWARD chain of
filter table.  In POSTROUTING chain of nat table rewrite src to be
firewall-private.

So, the rules might look something like this (again, maybe you don't
need this rules, not sure if Netfilter is able to handle mangling with
broadcast addresses correctly).

    iptables -t nat -A PREROUTING -s 4.3.2.1 -d 1.2.3.4
             -p udp --dport 3689 -j DNAT --to-destination 192.168.1.255
    iptables -t nat -A POSTROUTING -s 4.3.2.1 -d 192.168.1.255
             -p udp --dport 3689 -j SNAT --to-source 192.168.1.1
    iptables -A FORWARD -s 4.3.2.1 -d 192.168.1.255
             -p udp --dport 2689 -j ACCEPT

The packet is now on your work network, and it looks like a broadcast
from the firewall's private IP address.

Now, since this is broadcast packet, I don't think internal logic of
Netfilter will handle it properly.  Somebody correct me if I'm wrong.
So you will need to write another set of rules for return packets.  The
difference is that return packets will be generated with src of your
work pc, and dst of your work firewall (no broadcasts here anymore).
Use the PREROUTING and POSTROUTING chains of both firewalls to get this
packet across and make it look to your home PC as if it came from
internal interface of your home firewall (home-firewall-private).

Repeat all this for the other way around (broadcasts from your work PC
to your home PC).

Might work, might not work.  But your work network security will
certanly be lower afer this.

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7


