From: Rob Sterenborg <rob@sterenborg.info>
Subject: Re: Curious problem with my iptable rules.....detailed post
	inside, help appreciated.
Date: Sat, 17 Apr 2004 21:09:43 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1082228983.2270.33.camel@katala.sterenborg.info>
References: <1082158518.4759.40.camel@james>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1082158518.4759.40.camel@james>
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
To: Netfilter <netfilter@lists.netfilter.org>

On Sat, 2004-04-17 at 01:35, Krunk wrote:
> Setup: 
> I have one external NIC (ppp0) and two internal NIC's (eth1, eth2). I
> also have two rule sets. The first a bare minimum "get it up and going
> script" I used for testing and my main rule set. 
> 
> Problem: 
> After a fresh start-up if I initialize my basic rule set everything
> works perfectly. If I than initialize my main rule set (which deletes
> all chains and flushes all rules) it still works perfectly. However if I
> initialize my main script first. eth1 can access the internet, but eth2
> cannot. All internal connections are still up everyone can ping everyone
> else, etc., etc. Even odder is if I clear all rules and Policies and
> delete all chains than load the bare minimum script, it doesn't work
> either. The only thing I've found is to do a hard reboot (which makes me
> get that funny feeling like I've done something sacreligious, hehe),
> load the minimum and than load the main script. 

<strip lots of script>


>>> DON'T set policy to DROP in the nat table. If you want to do packet
filtering ; do it in the filter table with the INPUT, OUTPUT and FORWARD
chains. You probably get unexpected results if you filter in the nat or
mangle table.


Maybe it's a bit easier if you also told us what it is that you want to
achieve (and why you're using 2 scripts) because I think your script can
be a lot shorter than the main script you're using right now.
(Btw, I didn't read all of the script.)

There's a lot of DROPping going on while in the same time you have set
policy to DROP for the INPUT, OUTPUT and FORWARD chains. That means
*everything* is closed already : you can't get in, out or through the
box. Only  packets you have set an ACCEPT rule for can be received, sent
or forwarded/routed.

Setting OUTPUT policy to DROP is good. Only it might be easier to
troubleshoot your script if you first set it to ACCEPT, do some testing
untill it works. Then set OUTPUT to DROP and get it working again (if it
doesn't, because then only the iptables box won't be able to send
packets so your clients on eth1 and eth2 shouldn't notice it).

You have the RELATED/ESTABLISHED rules at the bottom of your script.
As most (accepted) packets will be matched by these rules, put these
close to the top of your script.

Put : echo 0 > /proc/sys/net/ipv4/ip_forward
at the top of your script, so there won't be any packet forwarding, even
if there are rules already.
Put : echo 1 > /proc/sys/net/ipv4/ip_forward
at the bottom of your script so forwarding starts when all rules are in
place.

You realize that the :
- INPUT chain is for incoming packets, DESTINED FOR the iptables box.
- OUTPUT chain is for outgoing packets, COMING FROM the iptables box.
- FORWARD chain is for packets going through the iptables box in either
way.
Every packet will *only* go through one chain. 

Did you read Oskar's iptables tutorial ?
http://iptables-tutorial.frozentux.net/iptables-tutorial.html


Gr,
Rob



