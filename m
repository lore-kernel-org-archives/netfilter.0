From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: protocol 50 unreachable
Date: Thu, 02 Dec 2004 13:54:36 -0500
Message-ID: <1102013676.2019.21.camel@localhost>
References: <Pine.LNX.4.44.0412021019060.25230-100000@gollum.grajagan.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0412021019060.25230-100000@gollum.grajagan.net>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Helge Weissig <helgew@grajagan.org>
Cc: Netfilter Mailing List <netfilter@lists.netfilter.org>

I'm afraid I'm up to my eyeballs today so I won't be able to help very
much but let me see if I understand what we have found thus far.  Am I
correct to assume that there are actually four devices involved and they
lay out like this:

     VPN_HOST
        |
        |
    VPN_SERVER
        |
        |
     INTERNET
        |
        |
   NAT_GATEWAY
        |
        |
    VPN_CLIENT

It appears that we do successfully establish a tunnel between VPN_CLIENT
and VPN_SERVER.  When we ping from VPN_CLIENT to VPN_HOST, we see the
esp packets pass through PREROUTING, FORWARD and POSTROUTING.  I'd
imagine we do but I would confirm that we see them on eth0.

I believe your troubleshooting methodology of examining inbound esp
traffic apart from the tunnel is valid but, like Jason, my instinct
shows a different troubleshooting path.  If you have control of the
VPN_SERVER, I would troubleshoot the remote side.

If the packets are leaving NAT_GATEWAY eth0, are they arriving at
VPN_SERVER eth0 (assuming eth0 is the public facing interface)?
If they are, do we see the ping packets going out VPN_SERVER eth1?
If we do, do we see the reply ping packets on VPN_SERVER eth1?
If we do, do we see the reply esp packets on VPN_SERVER eth0?
If we do, do we see the reply esp packets on NAT_GATEWAY eth0?
If we do, then we start following the packet's progress through
netfilter on NAT_GATEWAY.
I would suggest a general log rule in front of the FORWARD rule for esp
to see if any esp packets are making it to the FORWARD chain.  If so, do
they match the match criteria for the ALLOW rule, e.g., the interfaces?

On Thu, 2004-12-02 at 13:22, Helge Weissig wrote:
> The iptable logs are not complete and as I mentioned, I may need help with 
> setting that up. I can see the packets coming from the server with tcpdump 
> as I showed in my original post but then an immediate reply is sent back 
> and nothing goes through to the internal interface. The same thing happens 
> when I use nmap to scan ip protocols. Conversely, my internal ESP traffic 
> ends at the internal interface of my firewall. It never reaches the 
> external interface or the outside. TCP traffic works fine as you can see 
> from the ping logs from the internal client. Could this indicate that 
> there is a problem before anything gets to iptables?
> 
> h.
> 
> On Thu, 2 Dec 2004 at 12:25 -0500, netfilter-bounces@lists.netfilter.org wrote:
> 
> JO> On Thu, Dec 02, 2004 at 07:13:59AM -0800, Helge Weissig wrote:
> JO> > Jason,
> JO> > 
> JO> > 	my ESP packets do not go from the external interface to the internal 
> JO> > one and vice versa. The connection to the VPN server works when I hook 
> JO> > up directly with no changes other than the IP of the client. I cannot 
> JO> > see how this would be a problem with the VPN network at all.
> JO> > 
> JO> > h.
> JO> 
> JO> looking at your logs--all your ESP packets are from client->server.
> JO> you don't have a single ESP packet from server->client.  so when you
> JO> say, "my ESP packets do not go from the external interface..." you are
> JO> ignoring the fact that there are no ESP packets ever getting to your
> JO> external interface.
> JO> 
> JO> which brings me back to what i said several replies ago:
> JO> 
> JO>   your VPN server is discarding the ESP packets from your client as a
> JO>   result of the mangling of your intermediate NAT device.
> JO> 
> JO> either make the VPN server more tolerant, or use NAT-T on your client.
> JO> 
> JO> -j
> JO> 
> JO> --
> JO> "Ah, good ol' trustworthy beer. My love for you will never die."
> JO>         --The Simpsons
> JO> 
-- 
John A. Sullivan III
Chief Technology Officer
Nexus Management
+1 207-985-7880
john.sullivan@nexusmgmt.com
---
If you are interested in helping to develop a GPL enterprise class
VPN/Firewall/Security device management console, please visit
http://iscs.sourceforge.net 


