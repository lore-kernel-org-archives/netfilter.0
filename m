From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Problems with Portforwarding -- Loopback problems---
Date: Tue, 16 Mar 2004 17:25:37 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403161725.37484.Antony@Soft-Solutions.co.uk>
References: <405624A2.60906@imperium-noctem.de> <200403161711.45869.Antony@Soft-Solutions.co.uk> <40573742.6070606@imperium-noctem.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40573742.6070606@imperium-noctem.de>
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
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

On Tuesday 16 March 2004 5:20 pm, Ronny Fauth wrote:

> Antony Stone wrote:
>
> >Think about the replies.
> >
> >192.168.0.3 sends a packet to xxx.dyndns.org, that gets translated by
> >192.168.0.1 into 192.168.0.2
> >
> >192.168.0.2 receives the packet, sees that the sender is 192.168.0.3, and
> >replies.
> >
> >Therefore 192.168.0.3 sent a packet to xxx.dyndns.org and got a reply from
> >192.168.0.2.   It can't handle this, so fails.
>
> Well ya, sounds logically..... but how can i solve this Problem? so i
> can test wether the forwarding is working or not

This depends on whether you need the address translation system to work (after 
you've tested it and decided it's okay):

a) only from the Internet, or
b) from both the Internet and the local network.

If (a), then you should test it from the Internet, because that's what you 
need to work correctly - testing from the local network is not the same.

If (b), then you should be using split DNS to give the private address to 
local clients, and the public address to external clients - then each will 
connect to the correct IP address depending on where they're starting from.

Of course the other solution is to put local clients, and the server you're 
talking to, on separate subnets from the firewall, so no matter who talks to 
them, the packets always go through the firewall and always get NATted.

Regards,

Antony.

-- 
People who use Microsoft software should be certified.

                                                     Please reply to the list;
                                                           please don't CC me.


