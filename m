From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Modem to Ethernet Bridge
Date: Thu, 5 Sep 2002 16:40:59 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209051541.g85Ff5v00844@vulcan.rissington.net>
References: <F37GuSKqGABtvNLepTy000017d8@hotmail.com> <200209051442.g85EgNv00719@vulcan.rissington.net> <20020905153012.GH7289@cannon.eng.us.uu.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20020905153012.GH7289@cannon.eng.us.uu.net>
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
To: netfilter@lists.netfilter.org

On Thursday 05 September 2002 4:30 pm, Ramin Alidousti wrote:

> I don't see why a natted solution is required here.

I agree that a NATted solution is not *required*, however I think it should 
work and is therefore an effective solution to the problem.   Depending on 
the routing issues on other machines, it might well be the simplest solution, 
involving changes on only one machine.

> It's all basic routing. Assuming all the hosts in the lan (192.168.0.0/24)
> have a default route to 192.168.0.25

I didn't feel comfortable making that assumption, and it doesn't deal with 
machines other than those directly on the local network.

> and the ppp host at 192.168.1.2 has
> a default route to 192.168.1.1, then the linux box must be able to
> forward packets back and forth between these two subnets.

This route does seem reasonable, and I'm sure the linux box itself must be 
able to forward packets between the two networks.   However, this doesn't 
necessarily mean that other machines know to use 192.168.0.25 as the route to 
get to 192.168.1.2

If Scott's running another firewall somewhere on the LAN with a connection to 
the Internet, he might not SNAT packets from 192.168.1.2 as well as 
192.168.0.0/24 on their way out to the Internet, which would be needed in 
order to provide Internet access from this machine.

Antony.

-- 

Most people have more than the average number of legs.

