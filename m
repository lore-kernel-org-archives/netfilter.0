From: "Szabo Nandor" <medve@wenetto.hu>
Subject: Re: nat no traffic returns
Date: Wed, 21 May 2003 11:48:55 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030521094855.27489.qmail@mail.panaphone.hu>
References: <5.0.0.25.0.20030521073603.040dfeb0@pop.atz-hosting.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <5.0.0.25.0.20030521073603.040dfeb0@pop.atz-hosting.nl>
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
To: netfilter@lists.netfilter.org

B. van Ouwerkerk writes: 

> This one is really starting to get me. 
> 
> I have worked with iptables before without connections started from the 
> outside. In this case I need to allow connection from the outside to go to 
> a box on the inside. 
> 
> I was under the impression that a rule like: 
> 
> iptables -t nat -A PREROUTING -i eth0 -p tcp -d public_ip --dport 3389 -j 
> DNAT --to 10.0.0.112:3389 
> 
> would send the incoming packets to the inside box. And that: 
> 
> iptables -A FORWARD -i eth1 -o eth0 -s 10.0.0.112 -j ACCEPT
> or
> iptables -A FORWARD -i eth1 -j ACCEPT 
> 
> Should send any reply from the inside box to the world.
> But it isn't happening :(

You should add an SNAT rule, so your inside box is able to answer to the 
outside connection from privat IP (10.0.0.112). 

#iptables -A POSTROUTING -s 10.0.0.112 -o eth0 -j SNAT --to-source public_ip 

Nandor Szabo 

