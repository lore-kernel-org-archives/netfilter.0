From: g38@rdsbv.ro
Subject: Re: (no subject)
Date: Sat, 08 Jun 2002 16:53:38 +00300 (EEST)
Sender: netfilter-admin@lists.samba.org
Message-ID: <1023544418.3d020c6276261@mail.rdsbv.ro>
References: <1023528718.3d01cf0e162e2@mail.rdsbv.ro> <200206080948.g589maA32732@Networker.rockstone.co.uk> <1023539066.3d01f77a5ffd4@mail.rdsbv.ro> <200206081246.g58CkhA10328@Networker.rockstone.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <200206081246.g58CkhA10328@Networker.rockstone.co.uk>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; q="1.0"
To: Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: netfilter@lists.samba.org

eth0 - 193.231.237.x
eth1 - used to route 80.96.x.0/24
eth2 - used to masquerade 192.168.10.0/24

theoretically that would be the ip setup; however, I have another 193.231.237.x2 ip which I'd like to use especially because the two 193.231.237.x`s ips are in different cbq classes

Quoting Antony Stone <Antony@Soft-Solutions.co.uk>:

> On Saturday 08 June 2002 3:54 pm, g38@rdsbv.ro wrote:
> 
> > eth0 - connects to the internet
> > eth1 - internal network with private ip addresses
> > eth2 - internal network with routable ip's
> 
> Okay - I understand that.   I very much hope you mean that you have a public
> 
> IP on eth0, and your ISP has given you another batch of IP addresses to go on
> 
> the machines on eth2, and the ISP is routing these to you via the address on
> 
> eth0 ?

yes

> It would not be a good setup if you were trying to put a public IP on eth0 
> which is from the same subnet as the routable IPs on eth2.   It's possible to
> 
> do this, but a lot more technically challenging...

3 eth`s for 3 different subnets

> > What I want to do - eth0 has a routable ip and masquerades the internal
> > network which enters eth1
> 
> Okay, no problem.

good :-)

> > (or eth2, I haven't plug in the cable yet :D);
> 
> Don't understand.   If eth2 has routable IPs (by which I assume you mean IP
> 
> addresses which have been assigned to you, not ones from the ranges 10.x.y.z,
> 
> 172.16.a.b, 192.168.c.d), then why would you want to masquerade them behind
> 
> eth0 ?
> 
> > eth0:1 will route the network with valid internet ip addresses which
> > enters eth2 to the internet
> 
> No, I do not understand what you mean by this.   What are you trying to use
> 
> eth0:1 for ?

eth0 - 193.231.237.x routes the subnet 80.69.x.0/24 which enters the router via eth1
eth0:1 would route 192.168.10.0/24 which enters the router via eth2
basically that's the idea which I have in mind ... why an alias on eth0 ? ip`s for the eth0 are in different cbq classes at my ISP

> > (speaking of which, I assume I must input rules
> > for eth0:1's ip address too, but in the iptables syntax is it allowed to
> > refer to the alias as eth0:1 or I must use only its ip?)
> 
> You cannot use the name "eth0:1" in netfilter rules.   It doesn't like the 
> colon.   You can, however, use "eth0", which is the real interface these 
> packets are coming in on, and/or you can use the destination IP address, 
> which will identify where they were headed.
> 
> So iptables -A INPUT -i eth0 -p tcp --dport 22 -j ACCEPT will allow SSH 
> packets which are sent to the address you've put on eth0:1 (it will also 
> allow packets sent to the address you've put on eth0, eth0:2, etc...)
> 
> iptables -A INPUT -i eth0 -d a.b.c.d -p tcp --dport 22 -j ACCEPT will allow
> 
> SSH packets coming in on eth0, eth:1, eth0:2 etc provided the destination 
> address is a.b.c.d
> 
> Hope this explains how you can work with eth0:1 and netfilter rules.
> 
> Give us some more detail on the actual addresses you intend to put on eth0,
> 
> eth1 and eth2, and the subnets attached to these interfaces (you can 
> obfuscate any public IPs you've been given so long as it's still possible to
> 
> tell one subnet from the others), and we might be able to help some more.
> 
> .
> 
> Antony.
> 


