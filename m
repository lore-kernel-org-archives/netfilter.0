From: mdew <mdew@orcon.net.nz>
Subject: RE: opening a port..
Date: 09 Jan 2003 14:58:02 +1300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1042077494.606.18.camel@nirvana>
References: <FD8F124A387AD6119F7900A0D218B321019A9D@hslex01.hslbz.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <FD8F124A387AD6119F7900A0D218B321019A9D@hslex01.hslbz.local>
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

On Thu, 2003-01-09 at 03:24, Rob Sterenborg wrote:
> > ok, telnet from another machine to the router.
> > 
> > telnet 10.0.0.6 4662
> > Trying 10.0.0.6...
> > telnet: Unable to connect to remote host: Connection refused
> > 
> > what "service" should I be running? I simply want 4662 open both ways.
> 
> # netstat -an|grep 4662
> should tell you if your box is listening at all on port 4662.
> 
> If you run eDonkey server on the firewall box, open port in the INPUT
> chain.
> If your eDonkey server is *behind* the firewall, open the port in the
> FORWARD chain, and add a DNAT rule in the nat table -> PREROUTING chain.

the edonkey server is behind the firewall

210.54.175.12--->eth0 (Router) 10.0.0.6(eth1)--->10.0.0.x

iptables -t nat -A PREROUTING -p tcp -i eth0 -d 210.54.175.12 --dport 4662 -j DNAT --to 10.0.0.6:4662
iptables -A FORWARD -p tcp -i eth0 -d 10.0.0.6 --dport 4662 -j ACCEPT

like that?


