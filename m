From: mdew <mdew@mdew.dyndns.org>
Subject: RE: opening a port..
Date: 09 Jan 2003 22:51:18 +1300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1042105878.487.40.camel@nirvana>
References: <FD8F124A387AD6119F7900A0D218B321019AA0@hslex01.hslbz.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <FD8F124A387AD6119F7900A0D218B321019AA0@hslex01.hslbz.local>
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
To: Rob Sterenborg <rsterenborg@xs4all.nl>
Cc: netfilter <netfilter@lists.netfilter.org>

On Thu, 2003-01-09 at 21:21, Rob Sterenborg wrote:
> > > # netstat -an|grep 4662
> > > should tell you if your box is listening at all on port 4662.
> > > 
> > > If you run eDonkey server on the firewall box, open port in 
> > the INPUT
> > > chain.
> > > If your eDonkey server is *behind* the firewall, open the 
> > port in the
> > > FORWARD chain, and add a DNAT rule in the nat table -> 
> > PREROUTING chain.
> > 
> > the edonkey server is behind the firewall
> > 
> > 210.54.175.12--->eth0 (Router) 10.0.0.6(eth1)--->10.0.0.x
> > 
> > iptables -t nat -A PREROUTING -p tcp -i eth0 -d 210.54.175.12 
> > --dport 4662 -j DNAT --to 10.0.0.6:4662
> > iptables -A FORWARD -p tcp -i eth0 -d 10.0.0.6 --dport 4662 -j ACCEPT
> > 
> > like that?
> 
> If default policy for FORWARD is ACCEPT then it should work without the
> FORWARD, else you need it.
> 
> For me such a setup works.
> 
> If you do a netstat -an on the eDonkey box (you don't need netcat to do
> that) and it doesn't report 4662 then eDonkey is not running/listening
> and you can never connect.
> 
> About opening ports for eDonkey, from the eDonkey website :
> (http://www.edonkey2000.com/documentation/index.html)
> ====
> 2. Software Firewall
> If you are running software like Norton Personal Firewall, Tiny
> Firewall, Zone Alarm, BlackIce or <...snip...>
> Alternatively, with some more advanced firewalls, or firewall settings
> you will need to open ports 4661 and 4662 TCP for both incoming and out
> going connections, as well as port 4665 UDP for both incoming and
> outgoing connections.
> 
> 3. Hardware firewall
> Setting up your hardware firewall is a tad more difficult, but if you
> have one chances are you know what your doing. You will need to set it
> to allow both incoming and outgoing connections on 4661 & 4662 TCP and
> port 4665 UDP. 
> ====
> So you need to open more ports than just 4662/tcp I think.
> And IMHO you want a statefull packetfilter, if you haven't made it
> already statefull.
> (iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT)
> 
> 
> Rob
> 
> 

ok heres my current script, yes its inefficient, but thats not the major
problem.. 4662 port :/ I relise that theres more ports available for
edonkey to use, but opening ONE port would be a start.

i added "iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j
ACCEPT" without anything happening...


/sbin/modprobe ip_conntrack_ftp
/sbin/modprobe ip_conntrack_irc
/sbin/modprobe ip_nat_irc
/sbin/modprobe ip_nat_ftp

# <<<<< COMPLETE-BLOCKAGE SMB/Samba Traffic >>>>>

iptables -A FORWARD -o eth1 -p tcp --dport 135:139 -j REJECT
iptables -A FORWARD -o eth1 -p udp --dport 135:139 -j REJECT
iptables -A FORWARD -o eth1 -p tcp --sport 135:139 -j REJECT
iptables -A FORWARD -o eth1 -p udp --sport 135:139 -j REJECT

iptables -A FORWARD -o eth0 -p tcp --dport 135:139 -j REJECT
iptables -A FORWARD -o eth0 -p tcp --sport 135:139 -j REJECT
iptables -A FORWARD -o eth0 -p udp --sport 135:139 -j REJECT
iptables -A FORWARD -o eth0 -p udp --dport 135:139 -j REJECT
iptables -A INPUT -i eth0 -p tcp --dport 135:139 -j REJECT
iptables -A INPUT -i eth0 -p udp --dport 135:139 -j REJECT
iptables -A INPUT -i eth0 -p tcp --sport 135:139 -j REJECT
iptables -A INPUT -i eth0 -p udp --sport 135:139 -j REJECT

iptables -A INPUT -i eth1 -p tcp --dport 135:139 -j REJECT
iptables -A INPUT -i eth1 -p udp --dport 135:139 -j REJECT
iptables -A INPUT -i eth1 -p tcp --sport 135:139 -j REJECT
iptables -A INPUT -i eth1 -p udp --sport 135:139 -j REJECT

iptables -A OUTPUT -o eth0 -p tcp --dport 135:139 -j REJECT
iptables -A OUTPUT -o eth0 -p udp --dport 135:139 -j REJECT
iptables -A OUTPUT -o eth0 -p tcp --sport 135:139 -j REJECT
iptables -A OUTPUT -o eth0 -p udp --sport 135:139 -j REJECT

iptables -A OUTPUT -o eth1 -p tcp --dport 135:139 -j REJECT
iptables -A OUTPUT -o eth1 -p udp --dport 135:139 -j REJECT
iptables -A OUTPUT -o eth1 -p tcp --sport 135:139 -j REJECT

iptables -A OUTPUT -o eth1 -p udp --sport 135:139 -j REJECT

iptables -A INPUT -i eth0 -p tcp --dport 113 -j ACCEPT
iptables -A INPUT -i eth1 -p tcp --dport 113 -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --sport 113 -j ACCEPT
iptables -A INPUT -i eth1 -p tcp --sport 113 -j ACCEPT

iptables -A FORWARD  -p tcp --dport auth -i eth0 -j ACCEPT
iptables -A FORWARD  -p tcp --sport auth -i eth0 -j ACCEPT

iptables -A FORWARD  -p tcp --dport auth -i eth1 -j ACCEPT
iptables -A FORWARD  -p tcp --sport auth -i eth1 -j ACCEPT

iptables -A FORWARD -o eth0 -p tcp --dport 113 -j ACCEPT
iptables -A FORWARD -o eth1 -p tcp --dport 113 -j ACCEPT
iptables -A FORWARD -i eth0 -p tcp --dport 113 -j ACCEPT
iptables -A FORWARD -i eth1 -p tcp --dport 113 -j ACCEPT

iptables -A FORWARD -p tcp -s 10.0.0.9 --dport 4665 -m limit --limit
1/hour -j ACCEPT
iptables -A FORWARD -p udp -s 10.0.0.9 --dport 4665 -m limit --limit
1/hour -j ACCEPT
iptables -A FORWARD -p udp -s 10.0.0.9 --sport 4665 -m limit --limit
1/hour -j ACCEPT
iptables -A FORWARD -p tcp -s 10.0.0.9 --sport 4665 -m limit --limit
1/hour -j ACCEPT

# Block Outside the Network
iptables -A FORWARD -o eth0 -p tcp --dport 111 -j REJECT
iptables -A INPUT -i eth0 -p tcp --dport 111 -j REJECT
iptables -A FORWARD -o eth0 -p tcp --dport 199 -j REJECT
iptables -A INPUT -i eth0 -p tcp --dport 199 -j REJECT
iptables -A FORWARD -o eth0 -p tcp --dport 826 -j REJECT
iptables -A INPUT -i eth0 -p tcp --dport 826 -j REJECT
iptables -A FORWARD -o eth0 -p tcp --dport 953 -j REJECT
iptables -A INPUT -i eth0 -p tcp --dport 953 -j REJECT

# Block Inside the Network
iptables -A FORWARD -o eth1 -p tcp --dport 111 -j REJECT
iptables -A INPUT -i eth1 -p tcp --dport 111 -j REJECT
iptables -A FORWARD -o eth1 -p tcp --dport 199 -j REJECT
iptables -A INPUT -i eth1 -p tcp --dport 199 -j REJECT
iptables -A FORWARD -o eth1 -p tcp --dport 826 -j REJECT
iptables -A INPUT -i eth1 -p tcp --dport 826 -j REJECT
iptables -A INPUT -i eth1 -p tcp --dport 953 -j REJECT

iptables -A INPUT -i eth0 -p tcp --dport 4661 -j ACCEPT
iptables -A INPUT -i eth0 -p udp --dport 4661 -j ACCEPT
iptables -A INPUT -i eth1 -p udp --dport 4661 -j ACCEPT
iptables -A INPUT -i eth1 -p tcp --dport 4661 -j ACCEPT
iptables -A INPUT -i eth1 -p tcp --sport 4661 -j ACCEPT
iptables -A INPUT -i eth1 -p udp --sport 4661 -j ACCEPT
iptables -A INPUT -i eth0 -p udp --sport 4661 -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --sport 4661 -j ACCEPT

iptables -A FORWARD -o eth0 -p tcp --dport 4661 -j ACCEPT
iptables -A FORWARD -o eth1 -p tcp --dport 4661 -j ACCEPT
iptables -A FORWARD -o eth1 -p udp --dport 4661 -j ACCEPT
iptables -A FORWARD -o eth0 -p udp --dport 4661 -j ACCEPT
iptables -A FORWARD -o eth0 -p udp --sport 4661 -j ACCEPT
iptables -A FORWARD -o eth1 -p udp --sport 4661 -j ACCEPT
ptables -A FORWARD -o eth0 -p tcp --sport 4661 -j ACCEPT

iptables -A INPUT -i eth0 -p tcp --dport 4662 -j ACCEPT
iptables -A INPUT -i eth0 -p udp --dport 4662 -j ACCEPT
iptables -A INPUT -i eth1 -p udp --dport 4662 -j ACCEPT
iptables -A INPUT -i eth1 -p tcp --dport 4662 -j ACCEPT
iptables -A INPUT -i eth1 -p tcp --sport 4662 -j ACCEPT
iptables -A INPUT -i eth1 -p udp --sport 4662 -j ACCEPT
iptables -A INPUT -i eth0 -p udp --sport 4662 -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --sport 4662 -j ACCEPT

iptables -A FORWARD -o eth0 -p tcp --dport 4662 -j ACCEPT
iptables -A FORWARD -o eth1 -p tcp --dport 4662 -j ACCEPT
iptables -A FORWARD -o eth1 -p udp --dport 4662 -j ACCEPT
iptables -A FORWARD -o eth0 -p udp --dport 4662 -j ACCEPT
iptables -A FORWARD -o eth0 -p udp --sport 4662 -j ACCEPT
iptables -A FORWARD -o eth1 -p udp --sport 4662 -j ACCEPT
iptables -A FORWARD -o eth1 -p tcp --sport 4662 -j ACCEPT
iptables -A FORWARD -o eth0 -p tcp --sport 4662 -j ACCEPT

iptables -A INPUT -i eth0 -p tcp --dport 4665 -j ACCEPT
iptables -A INPUT -i eth0 -p udp --dport 4665 -j ACCEPT
iptables -A INPUT -i eth1 -p udp --dport 4665 -j ACCEPT
iptables -A INPUT -i eth1 -p tcp --dport 4665 -j ACCEPT
iptables -A INPUT -i eth1 -p tcp --sport 4665 -j ACCEPT
iptables -A INPUT -i eth1 -p udp --sport 4665 -j ACCEPT
iptables -A INPUT -i eth0 -p udp --sport 4665 -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --sport 4665 -j ACCEPT

iptables -A FORWARD -o eth0 -p tcp --dport 4665 -j ACCEPT
iptables -A FORWARD -o eth1 -p tcp --dport 4665 -j ACCEPT
iptables -A FORWARD -o eth1 -p udp --dport 4665 -j ACCEPT
iptables -A FORWARD -o eth0 -p udp --dport 4665 -j ACCEPT
iptables -A FORWARD -o eth0 -p udp --sport 4665 -j ACCEPT
iptables -A FORWARD -o eth1 -p udp --sport 4665 -j ACCEPT
iptables -A FORWARD -o eth1 -p tcp --sport 4665 -j ACCEPT
iptables -A FORWARD -o eth0 -p tcp --sport 4665 -j ACCEPT




