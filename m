From: "T. Horsnell (tsh)" <tsh@mrc-lmb.cam.ac.uk>
Subject: Re: Is this possible?
Date: Fri, 23 Apr 2004 09:49:54 +0100 (BST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E1BGwNe-001zei-Lg@alf1.lmb.internal>
References: <4087ACE0.1020006@uk.thalesgroup.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4087ACE0.1020006@uk.thalesgroup.com> from Fisher Alex at "Apr 22,
 2004 12:30:40 pm"
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
To: Fisher Alex <Alex.Fisher@uk.thalesgroup.com>
Cc: netfilter@lists.netfilter.org

>Hi.
>
>I'll do my best to explain what I'm trying to acheive with a linux box 
>and 3 NICS.
>
>I have two sets of systems.  Each system has about 30 IP addresses 
>spread across various bits of hardware.  The two systems are identical 
>(ie have the same 30 IP addresses).  The addresses are all part of the 
>class C subnet 192.168.0.*
>
>The IP addresses for each system are now set in stone and can't be 
>changed.  Furthermore, similar addresses are already in use on our network.
>
>I've been given a set of IP addresses I CAN use (172.26.158.*)
>
>A diagram might help here ...
>
>   -----------        -----------------
>   - System1 ---------|eth1            |
>   -----------        |                |
>                      |  Linux Router  |
>                      |            eth0|------------Rest of the network
>                      |                |
>   -----------        |                |
>   - System2 ---------|eth2            |
>   -----------        ------------------
>
>I also have an address I can use for eth0 which will make the router 
>visible from machines on the rest of the network.  This can be set as 
>the default gateway for connections to the 172.26.158.* subnet.
>
>I would like PCs on the normal network to be able to connect with either 
>system by addressing them with addresses off the 172.26.158 subnet. 
>I'll assign 30 of these IPs to each system.
>
>For example. 172.26.158.10 might be mapped onto 192.168.0.2 on eth1
>whilst  172.26.158.50 might be mapped onto 192.168.0.2 on eth2
>

I've always regarded netfilter as a symmetric thing, so is it possible to 

1. apply a set of S/DNAT rules specifically to
   eth1 to map system1's 192 addresses to something else, 
2. add a route to enable these new addresses to reach eth0
3. add appropriate rules to the FORWARD chain for those NAT'd addresses
   if required
4. add a suitable set of S/DNAT rules specifically for eth0
   to S/DNAT those new addresses to a unique subset of 172 addresses
5. Do the same stuff for eth2 but 1. would not be necessary


Cheers,
Terry.


