From: Philip Craig <philipc@snapgear.com>
Subject: Re: GRE/PPTP
Date: Fri, 12 Sep 2003 12:04:25 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F6129A9.6050106@snapgear.com>
References: <8EC0756327A4994298EFD721CFC7355B01B14C@jfm2.jacobson.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <8EC0756327A4994298EFD721CFC7355B01B14C@jfm2.jacobson.co.uk>
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
To: Jamie Vuyk <jvuyk@jacobson.co.uk>
Cc: netfilter@lists.netfilter.org

Jamie Vuyk wrote:
> 1)       Does the standard kernel (RH 2.4.18) need to be patched in any
> way in order to PASS THROUGH proto 47 (GRE) to an internal server?  Im
> running a simply iptables firewall which I want to pass an external VPN
> connection through to an internal server.  As I understand if I want
> Linux to terminate the PPTP VPN I need a patch, if I want it to pass
> through I don't.  However I am having a lot of trouble getting this to
> work and I would like to know if Im on the right track.  Also note that
> the firewall is masquerading all connections.

If you only ever have one PPTP connection per client/server pair (after
masquerading), then you can get by without any patches.  You will need to
forward both port 1723 and protocol 47 to the PPTP server.

If you may have more than one PPTP connection, then you need to apply
the PPTP conntrack patch from patch-o-matic.  You will need to forward
port 1723 to the PPTP server, and accept RELATED protocol 47 packets.
The PPTP conntrack will automatically NAT the protocol 47 packets to
go to the server.


> 2)       I have setup my firewall to allow and forward the 1723 to my
> internal server.  This appears to work but the external Win2k box gets
> stuck on "verifying username and password".  This eventually times out
> with "disconnected".  A simple test was to Telnet to port 1723.
> Although there is no response as such from the server (expected) it does
> connect both internally and externally.  At what point does the 1723
> data exchange end and the "payload" as such start on the GRE protocol?
> Is GRE involved in the 'verifying username and password' stage or is
> that still TCP on 1723?

This is definitely due to the protocol 47 packets not getting through.
The 'verifying username and password' stage is part of the PPP
negotiation, which runs over the GRE tunnel.

-- 
Philip Craig - philipc@snapgear.com - http://www.SnapGear.com
SnapGear - Custom Embedded Solutions and Security Appliances


