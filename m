From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Redirect in intranet using DNAT?
Date: Sun, 16 Nov 2003 11:22:24 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311161122.hAGBMSj21351@agate.rockstone.co.uk>
References: <200311160017.05962.m.feldmann@nikocity.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200311160017.05962.m.feldmann@nikocity.de>
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

On Sunday 16 November 2003 10:43 am, Michael Feldmann wrote:

> Hi all,
>
>
> How can I redirect traffic from one internal IP to another? My situation is
> as follows:
>
> I have two webservers in an Intranet, one on 192.168.0.1, port 80, the
> other on on 192.168.0.5 port 80. Each machine has only one ethernet
> card, attached to the same switch.Now I want to take away the first
> webserver In order to do this transparently, I thought of using a
> redirect rule.

The reason your redirect doesn't work is because the requests and replies 
don't go through the netfilter box - they're not being routed somewhere else 
- so it never sees the packets to modify the addresses.

Example: client 192.168.0.42 tries to access server on 192.168.0.1, it's on 
the local network, so it does an ARP for 192.168.0.1, and nothing replies.   
Therefore the client says "server uncontactable".   The client is never going 
to try going through a router (netfilter) to get to a local address.

By the way, http does not use UDP - there's no need ever to translate UDP 
port 80 for a web server.

I would suggest two better solutions to your requirement are:

1. Use DNS and access the server/s by name instead of IP - then you can make 
both names resolve to the same address, or different addresses, or change the 
addresses, as you shuffle your network around, and client machines don't need 
to know any different.

2. Add the old address to the new server, so one machine has both 192.168.0.1 
and 192.168.0.5 on eth0 and will respond to requests sent to either address.

There is a way of doing what you want with netfilter, but it is so horribly 
complicated and ugly (add false IP address to internal interface, apply both 
SNAT and DNAT rules in PREROUTING and POSTROUTING, resulting in the web 
server thinking all internal accesses come from the firewall) thaat I am not 
going to recommend it at all.

Antony.

-- 

The trouble with the French is that they don't have a word for 'entrepreneur'.

 - George W Bush, president of the United States of America
                                                     Please reply to the list;
                                                           please don't CC me.

