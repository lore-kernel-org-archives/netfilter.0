From: Rowan Reid <rreid@studio3arc.com>
Subject: RE: Advice on network config (unix - linux and windows - mac)
Date: Mon, 16 Oct 2000 15:20:14 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000601c037bf$424b3480$6601a8c0@s3ac>
References: <ONYX635YHBSNA01PKGC52FCMKE0TPGC.3daabf5a@pc5>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <ONYX635YHBSNA01PKGC52FCMKE0TPGC.3daabf5a@pc5>
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
To: 'David Bourgeois' <david@muelec.fpms.ac.be>, netfilter@lists.netfilter.org






 INTERNET<--------------->FIREWALL<--------nated systems on private net
					^
					|_______ DMZ

Firewall with 3 nic cards. Setup with a iptables filtering firewall that
nats all outgoing requests from your private network. And
filter/forwards incoming traffic to your DMZ. All attempts to connect to
your firewall are dropped and and logged unless they are established
connections (returning nat) or are a part of the forwarded DMZ eg. www.

http://www.e-infomax.com/ipmasq/howto/m-html/ipmasq-HOWTO-m.html

Ohh yea put those windows boxen on the net and you will be shot. I'm
tired of being probed by nimda and code red worms.





> 
> I would like to setup a linux box as gateway - firewall and 
> NAT (maybe DHCP too) for a network of SUN workstations, 
> windoze (98, XP, 2000) PC's and macs. 
> 
> I don't care about win and macs but would want the SUN 
> network to be as secure as possible. As I guess win can be 
> easily compromised, I thought of physically 
> separating the unix network from the others by using three 
> network cards on the gateway. So having two private networks, 
> I can filter what goes from one to the other with 
> the gateway's firewall.
> 
> Is this the right way to do what I would like? Any 
> recommandation would be welcome.
> 
> Thanks,
> David Bourgeois
> 
> 
> 


