From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Two DHCP addresses on external interface
Date: Mon, 29 Dec 2003 01:31:57 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312290131.57181.Antony@Soft-Solutions.co.uk>
References: <20031228170733.14a6c754.michael@bluesuperman.com> <20031228172639.4c0950c4.michael@bluesuperman.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031228172639.4c0950c4.michael@bluesuperman.com>
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

On Monday 29 December 2003 12:26 am, Michael Gale wrote:

> Hello,
>
> 	I think I have the answer, first I will find out the MAC address of my
> PS2 (packet sniffer) and then use dhcpcd w/ -I:
> --snip-- man dhcpcd
> -I <ClientID>
>               Specifies the client identifier string.  dhcpcd uses the
> default client identifier (MAC address of              the network
> interface) if it is not specified.
> --snip--
>
> I will specify the MAC of my PS2 ... then I can DNAT the traffic back
> and forth to and from the PS2 :)
>
> Oh ... I think it will work :)

I'm not so sure - sorry.

The option you have found sends a client ID to the DHCP server, and if you 
don't specify the ID you want, it uses the MAC address.   However, I don't 
think that sending a different MAC address will give you the second DHCP 
client lease, because you can specify anything you like for the client ID 
(hostname is common), and you don't have to specify one at all, yet you still 
get a lease.

I wonder if maybe you have to do something unpleasant like acquire a lease, 
rename the /etc/dhcpc/dhcpcd-eth0.* files, and acquire another one, this time 
faking the MAC address (but I'm not sure how...)?

Another horrible suggestion is to put another ethernet card in your firewall, 
plug it into the hub alongside your existing external interface, then acquire 
leases on both eth0 and eth1 (which just happen to be connected to each other 
through the hub).   Normally I would say to people "No! Don't have two 
interfaces on the same subnet, and don't connect two interfaces to the same 
hub" but in this case it might be a workable solution?

Regards,

Antony.

-- 
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing on usenet and in e-mail?

                                                     Please reply to the list;
                                                           please don't CC me.


