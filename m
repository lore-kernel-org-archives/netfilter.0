From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: DHCRELAY through IPTABLES Firewall
Date: Wed, 30 Oct 2002 00:41:49 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021030004153.OKNJ27595.mta05-svc.ntlworld.com@there>
References: <001001c27d72$1352c350$8f33e40f@lsmith5953> <200210291303.g9TD3Ne10065@vulcan.rissington.net> <002b01c27fab$9d590fb0$6d02a8c0@lsmith5953>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <002b01c27fab$9d590fb0$6d02a8c0@lsmith5953>
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

On Wednesday 30 October 2002 12:30 am, bigman@monster-solutions.net wrote:

> when I run DHCRELAY -i eth2 it tells me that it is listening on eth2 and
> sending on eth2. I assume this is wrong?

Sounds wrong to me.   Sounds kinda pointless to me.   If you wanted the 
requests to go out on the same network they came in on, you wouldn't need a 
relay....

> how do I fix it? is it my routing table?

Could be - what does your routing table say ?

My copy of "man dhcrelay" says:

dhcrelay [ -p port ] [ -d ] [ -q ] [ -i if0 [ ...  -i ifN ] ] server0
    [ ...serverN ]

The DHCP Relay Agent listens for DHCP requests on all interfaces attached to 
a host, unless one or more  interfaces  are specified on the command line 
with the -i flag.

When a query is received, dhcrelay forwards it to the list of DHCP servers 
specified on the command line.   When a reply is received, it is broadcast or 
unicast on the network from whence the original request came.

Therefore I think your command should be:

dhcrelay -i eth2 192.168.1.70

If this sends packets to 192.168.1.70 out of eth2, try pinging 192.168.1.70 
and see where the packets come out of then.

Antony.

-- 

In science, one tries to tell people
in such a way as to be understood by everyone
something that no-one ever knew before.

In poetry, it is the exact opposite.

 - Paul Dirac

