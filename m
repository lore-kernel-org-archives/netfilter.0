From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Curious problem with my iptable rules.....detailed postinside, help appreciated.
Date: Sun, 18 Apr 2004 21:47:58 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040418194758.8E5A6474C@sterenborg.info>
References: <1082311801.5336.38.camel@james>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1082311801.5336.38.camel@james>
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
To: 'Netfilter' <netfilter@lists.netfilter.org>

> From what I read, this is to prevent a "hole" from opening up. By 
> having
> a default policy of DROP, anything overlooked is by default 
> dropped. I was under the impression that having only 
> explicitly accepted packets allowed is a good thing.

That is indeed what you're doing when you set policy to DROP and then write
rules to accept what you want to accept. (Or any other rule, like REJECT
packets on port 113/tcp instead of DROPping them, which might speed up
connecting to certain ftp sites.)
What I saw in your script was logging and dropping together in a user chain.
Nothing wrong with that but you seem to be logging a lot :-). I don't know
if you want all that information.

At the end of your script there is :
$IPT -A INPUT -j DROPl
$IPT -A OUTPUT -j REJECTl
$IPT -A FORWARD -j DROPl
Which effectively becomes your "policy" : log and DROP/REJECT, since it
matches everything.
(Again, it's not wrong.)

> problem I commented out the initial DROP Policies....the same 
> problem persisted. Since the only remedy I've found for 
> getting it working again after initially running the script 
> is a hard reboot, it greatly complicates the troubleshooting. 

Well, I don't know exactly what you tried but don't filter in the nat table.
It's easy to forget that you do and although it's possible ; you have the
filter table for that.
Flushing all rules and setting policy to ACCEPT should keep you from
rebooting.

iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -F
(iptables -X)

But I suppose you already tried this..
If it doesn't I'm curious what the output is of "iptables -nvL" and
"iptables -t nat -nvL".

> I'm in the process of reading it now, I've read several other 
> tutorials...but this is the most thorough I've seen yet. 

Yeah, it's good and it's free ;-)..

> Thank you.

You're welcome.

Reading your first post, one problem was : "eth1 can access the internet,
but eth2 cannot". I took another look at your script, and I'll focus on nat
only.
This should nat clients on both eth1 and eth2 :

echo 0 > /proc/sys/net/ipv4/ip_forward
iptables -P FORWARD DROP
iptables -F FORWARD
iptables -A FORWARD -i eth1 -o ppp0 -s <net_lan_1> -j ACCEPT
iptables -A FORWARD -i eth2 -o ppp0 -s <net_lan_2> -j ACCEPT
iptables -t nat -A POSTROUTING -o ppp0 -s <net_lan_1> -j MASQUERADE
iptables -t nat -A POSTROUTING -o ppp0 -s <net_lan_2> -j MASQUERADE
echo 1 > /proc/sys/net/ipv4/ip_forward

Of course, you have to make sure your routing table on the iptables box as
well as on the clients is correct.
In my experience (I also have a ppp0 for internet) you cannot use SNAT for
ppp interfaces.


Gr,
Rob


