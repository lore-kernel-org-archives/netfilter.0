From: mdew <mdew@mdew.dyndns.org>
Subject: RE: opening a port..
Date: 09 Jan 2003 19:16:20 +1300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1042092980.487.4.camel@nirvana>
References: <FD8F124A387AD6119F7900A0D218B321019A9D@hslex01.hslbz.local> 
	<1042080082.606.21.camel@nirvana>  <1042088119.810.3.camel@india>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1042088119.810.3.camel@india>
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
To: "Dharmendra.T" <dharmu@nsecure.net>
Cc: Rob Sterenborg <rsterenborg@xs4all.nl>, netfilter <netfilter@lists.netfilter.org>

On Thu, 2003-01-09 at 17:55, Dharmendra.T wrote:
> On Thu, 2003-01-09 at 08:11, mdew wrote:
> > On Thu, 2003-01-09 at 03:24, Rob Sterenborg wrote:
> > > > ok, telnet from another machine to the router.
> > > > 
> > > > telnet 10.0.0.6 4662
> > > > Trying 10.0.0.6...
> > > > telnet: Unable to connect to remote host: Connection refused
> > > > 
> > > > what "service" should I be running? I simply want 4662 open both ways.
> > > 
> > > # netstat -an|grep 4662
> > > should tell you if your box is listening at all on port 4662.
> > > 
> > > If you run eDonkey server on the firewall box, open port in the INPUT
> > > chain.
> > > If your eDonkey server is *behind* the firewall, open the port in the
> > > FORWARD chain, and add a DNAT rule in the nat table -> PREROUTING chain.
> > 
> > the edonkey server is behind the firewall
> > 
> > 210.54.175.12--->eth0 (Router) 10.0.0.6(eth1)--->10.0.0.x
> > 
> > iptables -t nat -A PREROUTING -p tcp -i eth0 -d 210.54.175.12 --dport 4662 -j DNAT --to 10.0.0.6:4662
> > 
> 
> This should work without the last rule.
> 
> iptables -A FORWARD -p tcp -i eth0 -d 10.0.0.6 --dport 4662 -j ACCEPT
> > 
> > like that?

the router isnt picking this up..

mdew:~# iptables -t nat -A PREROUTING -p tcp -i eth0 -d 210.54.175.12
--dport 4662 -j DNAT --to 10.0.0.6:4662
mdew:~# iptables -A FORWARD -p tcp -i eth0 -d 10.0.0.6 --dport 4662 -j
ACCEPT
mdew:~# netstat -an|grep 4662
mdew:~#

mdew@nirvana:~$ nmap 10.0.0.6

Starting nmap V. 3.10ALPHA4 ( www.insecure.org/nmap/ )
Interesting ports on debian (10.0.0.6):
(The 1598 ports scanned but not shown below are in state: closed)
Port       State       Service
22/tcp     open        ssh
25/tcp     open        smtp
110/tcp    open        pop-3
113/tcp    open        auth
135/tcp    filtered    loc-srv
139/tcp    filtered    netbios-ssn
8080/tcp   open        http-proxy

Nmap run completed -- 1 IP address (1 host up) scanned in 2.545 seconds




