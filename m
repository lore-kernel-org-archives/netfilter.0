From: Patrick Schaaf <bof@bof.de>
Subject: Re: how is this stuff getting thru default deny iptables firewall?....
Date: Sun, 23 Jun 2002 09:53:51 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020623095351.M5183@oknodo.bof.de>
References: <20020622103055.B32585@spawar.navy.mil> <20020622173842.AGM19225.mta07-svc.ntlworld.com@there> <20020623001302.A949@spawar.navy.mil>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <20020623001302.A949@spawar.navy.mil>; from seberino@spawar.navy.mil on Sun, Jun 23, 2002 at 12:13:02AM -0700
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christian Seberino <seberino@spawar.navy.mil>
Cc: Antony Stone <Antony@Soft-Solutions.co.uk>, netfilter@lists.samba.org

Hi Christian,

I'll venture a guess. If I understand your question, you want to know
why a machine in $PROTECTED_NETWORK is able to make DNS queries
to a DNS server on the outside.

ESTABLISHED/RELATED were kind of a red herring. What you need to
understand, is that

	I)
		When you use the "nat" table, you get "conntrack" underneath.
	II)
		when a routed packet does not already have a "conntrack",
		it gets a new one, and the "nat" table is consulted.
	III)
		In case B), when a DNAT or SNAT target hits in the "nat" chain,
		it modifies the new "conntrack" to remember how to manipulate
		the packet.
	IV)
		Otherwise, when a routed packet already has a "conntrack"
		entry, the "nat" table is NOT consulted. Instead, the
		conntrack data structure determines whether the packet
		has to be modified for NAT.

Now here's what happens when an internal IP address, let's call it PAUL,
queries an outside DNS server, called DNS. Here is the processing done
on your firewall for the request packet from PAUL to DNS:

	1) a packet with source PAUL and destination DNS / udp port 53,
	   arrives at the internal interface of your firewall.
	2) it is an unknown connection, so a new conntrack entry is created.
	3) the PREROUTING nat chain does not specify a NAT action, so none
	   is set up at that point.
	4) the network stack makes a routing decision. The packet is to
	   be routed out INTERNET_INTERFACE. Thus, it will pass through
	   the filter table's FORWARD chain.
	5) your second filter table FORWARD rule permits the packet to pass,
	   as it is routed out INTERNET_INTERFACE, comes from the
	   PROTECTED_NETWORK, and goes to somewhere else. ACCEPT.
	6) before hitting the wire, now the packet has to finally pass
	   through the nat table's POSTROUTING chain. There, you have
	   a nice rule which SNATs the internal IP address to the outside
	   IP address of your firewall. PAUL becomes INTERNET_IP_ADDRESS.
	   As explained above, this _also_ primes the "conntrack" from
	   step 2) to make the reverse modification when the packet
	   hears back from DNS.

So now, a packet is travelling the internet from INTERNET_IP_ADDRESS to
DNS, and eventually, DNS will reply. Here is what happens when the
reply packet comes back in INTERNET_INTERFACE of your firewall:


	A) A packet with source DNS and destination INTERNET_IP_ADDRESS,
	   type udp, and destination port 53, arrives at the external
	   interface of your firewall.
	B) First, the conntracking finds the "conntrack" set up in step 6)
	C) Because step 6) marked the "conntrack" appropriately, the dest
	   IP address, which is INTERNET_IP_ADDRESS, is modified to be PAUL.
	   NOTE: this is NOT done with explicit new rules in the "nat"
	   table. The "nat" table is NOT consulted for "second or more"
	   packet of an existing conntrack.
	D) The networking stack makes a routing decision. The destination
	   IP address is PAUL, so the packet will be routed out the internal
	   interface of your firewall. But it will first pass through the
	   FORWARD chain.
	E) Your fourth filter table FORWARD rule permits the packet to pass:
	   it goes out PROTECTED_NETWORK_INTERFACE, comes from an outside IP,
	   and goes to PROTECTED_NETWORK (PAUL, to be exact). ACCEPT.
	F) Before hitting the wire, now the packet has to finally pass
	   through the nat table's POSTROUTING chain. But no more harm
	   is done, no rule there matches our packet.

So finally, PAUL hears back from DNS.

I hope I got everything correct; people please flame me if not.

best regards
  Patrick


