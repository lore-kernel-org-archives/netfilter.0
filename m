From: Andrea Rossato <mailing_list@istitutocolli.org>
Subject: Re: Modifying Source Ip on input/prerouting
Date: Wed, 11 Dec 2002 16:02:07 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DF7536F.9050002@istitutocolli.org>
References: <20021211135812.GA8394@nath.rubis.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021211135812.GA8394@nath.rubis.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Stephane Jourdois wrote:
> I would need to be able to modify the source ip on input GRE paquets.
> This is because I'm trying to setup a pptp tunnel, via a router that
> doesn't NAT correctly the GRE.
> The client receives GRE, but replies with it's own local ip, then my
> server cannot receive the answers... If I could just change the source
> ip on those paquets, that would be perfect...

i don't know if I've got your problem correctly, also because I don't 
know pptp too much (so, shut up, you'll say...;)

if you want to match gre packets and change their source address (not 
the source addr. of encapsulated packets) you should be able with
iptables -A POSTROUTING -t nat -p gre -j SNAT --to-source 
new-grepacket-source-addr
this will match all outgoing (from the client) traffic using gre protocol.

but is this what you need?
where are the tunnel end points? the router has two tunnels connecting 
the server and the client? the tunnel is between the router and the server?

Instead, if you want to change source address of encasplulated packets, 
that would be interesting...



