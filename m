From: "Rob Sterenborg" <rsterenborg@xs4all.nl>
Subject: RE: opening a port..
Date: Thu, 9 Jan 2003 09:21:11 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FD8F124A387AD6119F7900A0D218B321019AA0@hslex01.hslbz.local>
References: <1042080082.606.21.camel@nirvana>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1042080082.606.21.camel@nirvana>
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
To: netfilter <netfilter@lists.netfilter.org>

> > # netstat -an|grep 4662
> > should tell you if your box is listening at all on port 4662.
> > 
> > If you run eDonkey server on the firewall box, open port in 
> the INPUT
> > chain.
> > If your eDonkey server is *behind* the firewall, open the 
> port in the
> > FORWARD chain, and add a DNAT rule in the nat table -> 
> PREROUTING chain.
> 
> the edonkey server is behind the firewall
> 
> 210.54.175.12--->eth0 (Router) 10.0.0.6(eth1)--->10.0.0.x
> 
> iptables -t nat -A PREROUTING -p tcp -i eth0 -d 210.54.175.12 
> --dport 4662 -j DNAT --to 10.0.0.6:4662
> iptables -A FORWARD -p tcp -i eth0 -d 10.0.0.6 --dport 4662 -j ACCEPT
> 
> like that?

If default policy for FORWARD is ACCEPT then it should work without the
FORWARD, else you need it.

For me such a setup works.

If you do a netstat -an on the eDonkey box (you don't need netcat to do
that) and it doesn't report 4662 then eDonkey is not running/listening
and you can never connect.

About opening ports for eDonkey, from the eDonkey website :
(http://www.edonkey2000.com/documentation/index.html)
====
2. Software Firewall
If you are running software like Norton Personal Firewall, Tiny
Firewall, Zone Alarm, BlackIce or <...snip...>
Alternatively, with some more advanced firewalls, or firewall settings
you will need to open ports 4661 and 4662 TCP for both incoming and out
going connections, as well as port 4665 UDP for both incoming and
outgoing connections.

3. Hardware firewall
Setting up your hardware firewall is a tad more difficult, but if you
have one chances are you know what your doing. You will need to set it
to allow both incoming and outgoing connections on 4661 & 4662 TCP and
port 4665 UDP. 
====
So you need to open more ports than just 4662/tcp I think.
And IMHO you want a statefull packetfilter, if you haven't made it
already statefull.
(iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT)


Rob


