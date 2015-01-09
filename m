From: Glen Miner <shaggie76@hotmail.com>
Subject: Stateless NAT with iptables
Date: Fri, 9 Jan 2015 13:38:34 -0500
Message-ID: <SNT152-W84CAD14ACDD2F149C65D88B8440@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>


After a day of hacking around and trolling the internet I'm more or les=
s convinced this isn't possible with iptables but I figured I should as=
k in case I missed something.

What we're trying to do is set up UDP NAT proxy for a pair of clients o=
n demand.

The mappings are preceded by some application layer traffic used to fig=
ure out where the mapping should go -- we're essentially trying to use =
the netfilter stack to do a blazing fast STUN/TURN server with no packe=
t overhead. We need to bounce a few packets around on the ports we're g=
oing to proxy because this is how we figure out the remote peer address=
 & ports we'll need to bind together.

In my prototype this works but there's a problem: nf_conntrac gets in t=
he way of the hand-off between the application layer socket and the NAT=
 rule. I've tried telling iptables to go stateless:

iptables -t raw -F

iptables -t raw -I PREROUTING -j NOTRACK
iptables -t raw -I OUTPUT -j NOTRACK

But of course this means that none of my -t nat rules are checked; I've=
 read the documentation several times now and I can't seem to find a wa=
y to have my cake and eat it too.

In more detail here's how it currently works (and what goes wrong):

Alice sends a message to the relay server saying "can you help me talk =
to Bob?" (the mechanics of this communication channel are unimportant)

The relay server binds a pair of UDP sockets $anPort and $bnPort to be =
used for the proxy on $nAddr and tells

Alice: send me a packet to $nAddr:$bnPort so I can figure out how your =
router NATs to that endpoint
- this gives us $aAddr and $aPort

Bob: send me a packet to $anPort=A0
- this gives us $bAddr and $bPort

With that, the server then has enough information to create the followi=
ng rules

# A->B
iptables -t nat -I PREROUTING -p udp -s $aAddr --sport $aPort -d $nAddr=
 --dport $bnPort -j DNAT --to $bAddr:$bPort
iptables -t nat -A POSTROUTING -p udp -d $bAddr --dport $bPort -j SNAT =
--to $nAddr:$anPort
iptables -t nat -I OUTPUT -p udp -s $aAddr --sport $aPort -d $nAddr --d=
port $bnPort -j DNAT --to $bAddr:$bPort

# B->A (NOTE: these are not needed per se if Alice sends a packet to Bo=
b first)
iptables -t nat -I PREROUTING -p udp -s $bAddr --sport $bPort -d $nAddr=
 --dport $anPort -j DNAT --to $aAddr:$aPort
iptables -t nat -A POSTROUTING -p udp -d $aAddr --dport $aPort -j SNAT =
--to $nAddr:$bnPort
iptables -t nat -I OUTPUT -p udp -s $bAddr --sport $bPort -d $nAddr --d=
port $anPort -j DNAT --to $aAddr:$aPort

And now as far as Alice is concerned Bob is at $nAddr:$bnPort and as fa=
r as Bob is concerned Alice is at $nAddr:$anPort

We can technically close the sockets we used to discover the bind point=
s -- they aren't needed any more -- but here's the rub: nf_conntrack_ud=
p_timeout seconds has to elapse with NO traffic from Alice or Bob to th=
e bind ports; evidently there is a connection kicking around that is pr=
eventing the NAT rules I added from taking over and the system default =
is 30 seconds.

I can see the connection with this command:

conntrack -L --proto udp --dport=3D$anPort

Until this times out I get no joy and any stray packet from the respect=
ive peer will reset the countdown.

There are two workarounds I can think of:

1) reduce nf_conntrack_udp_timeout=A0
2) try a conntract -D command to clear the connection
3) before binding the local sockets I create rules to NOTRACK them whil=
e they're in userland

The fourth option that I dream of, however, is a "please don't bother w=
ith nf_conntrack, I really don't need it, honest" -- this would be the =
ideal case but try as I might I can't find any way to make this work. N=
OTRACK means no -t nat and you can't rewrite source or dest headers wit=
hout -t nat.

Here's why I'd really like to ditch conntrack: it's a waste of resource=
s for us. In fact, when we get up to around 40,000 users on a server (n=
ot doing this NAT stuff, just doing other things), the conntrack table =
can overflow and cause all kinds or problems. I could be wrong but I'm =
pretty confident we don't need it for anything -- our firewall rules ca=
n be really simple.

I read some of the new nftables documentation but as far as I can tell =
it's still doing the same hooks and doesn't get me any closer to succes=
s. As far as I can tell I can't escape conntrack for what I'm doing.

If you've read this far, thanks for reading; if you have any light to s=
hed, thanks in advance!

-g


 		 	   		  