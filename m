From: Alistair Tonner <Alistair@alistairt.ath.cx>
Subject: Re: Followup on Checkpoint VPN through Iptables
Date: Thu, 26 Sep 2002 08:26:40 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020926122640.GA725@Ajftl1.ajfthome.on.ca>
References: <5.1.0.14.2.20020926073737.00acd7f0@pop.mindspring.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <5.1.0.14.2.20020926073737.00acd7f0@pop.mindspring.com>; from david@hyperbolic.net on Thu, Sep 26, 2002 at 08:03:29 -0400
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: David A Golden <david@hyperbolic.net>
Cc: netfilter@lists.netfilter.org


	Hi David:
	   If this is working, I suspect that you could figure out which
	rules aren't being used by iptables -L -v|more ... if its up and
	running and working, and the rule has a 0 byte/packet count ..
	its likely not doing anything...

	I'm going to keep *this* one handy ...I'm going to need it 
shortly	 
	as I get VPN to work soon... Thanks David

	Alistair Tonner

On 2002.09.26 08:03 David A Golden wrote:
> I've got Checkpoint SecuRemote working from a windows client to my 
> office Checkpoint firewall through a linux netfilter 
> firewall/router/NAT box without having to specify a specific client 
> on the internal network in the pre-routing.  I wish I could say that 
> I knew exactly why, but I sort of blundered into it trying different 
> combinations based on the Phone-Boy information, etc.
> 
> Here's how I did it in the end:
> 
> 1. Set client for encryption scheme IKE (duh).  Turn *off* "UDP 
> encapsulation" and "support IKE over TCP"
> 
> 2. Add following rules (in addition to my standard postrouting SNAT 
> of anything from the internal network):
> 
> iptables -A INPUT -i eth0 -p ah -j ACCEPT
> iptables -A INPUT -i eth0 -p esp -j ACCEPT
> iptables -A INPUT -i eth0 -p udp -m udp --dport 500 -j ACCEPT
> iptables -A INPUT -i eth0 -p udp -m udp --dport 2746 -j ACCEPT
> iptables -A FORWARD -i eth0 -p ah -d 172.16.0.0/16 -j ACCEPT
> iptables -A FORWARD -i eth0 -p esp -d 172.16.0.0/16 -j ACCEPT
> iptables -A FORWARD -i eth0 -p udp -d 172.16.0.0/16 -m udp \
> 	--dport 500 -j ACCEPT
> iptables -A FORWARD -i eth0 -p udp -d 172.16.0.0/16 -m udp \
> 	--dport 2746 -j ACCEPT
> 
> Voila.  It worked.  I'm not sure if all of this is necessary (e.g. 
> the AH protocol bit) but I haven't had the time/chance/inclination to 
> do a methodical trial and error test of shutting off each rule to try 
> and break it.
> 
> In particular, I'm not sure why the INPUT part is necessaray if the 
> SNAT is working right, but it seemed to fix some timeout problem 
> where the connection works at first but then goes down if it sits 
> idle for too long.  (I use Lotus Notes at home and check e-mail 
> periodically -- sometimes it fails to connect after sitting idle, but 
> the INPUT statements fixed it.)  I'll try to turn that off again and 
> see if I can replicate the breakage.
> 
> For reference, my other forwarding rules act before the ones above 
> and are:
> 
> iptables -A FORWARD -i eth1 -j ACCEPT
> iptables -A FORWARD -d 172.16.0.0/16 -m state \
> 	--state ESTABLISHED, RELATED -j ACCEPT
> 
> I hope this is useful to anyone working on this.  I hope this 
> actually *works* for others.  And I hope someone with a lot more 
> knowledge of netfilter and IPSEC can explain why this works to me so 
> I understand my own firewall rules (always a good idea, right?).
> 
> Sincerely,
> David Golden
> 
> 
> 


