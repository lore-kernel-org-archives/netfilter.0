From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: VPN (interface) access for and all traffic through from single
 user -- how to do it?
Date: Sun, 17 Aug 2008 00:01:18 -0500
Message-ID: <48A7B09E.4040403@riverviewtech.net>
References: <200808151255.44987.janklodvan@gmail.com> <200808152212.59882.janklodvan@gmail.com> <48A5F9E2.5080206@riverviewtech.net> <200808162347.55392.janklodvan@gmail.com> <48A7A94E.8070202@reptiliannature.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48A7A94E.8070202@reptiliannature.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 8/16/2008 11:30 PM, Michael Alaimo wrote:
> I would use tcpdump and traceroute to aid in debugging.  nmap might also 
> be useful.

I agree that those are wonderful tools and quite often very handy. 
However I don't think things are to that point yet.  I believe that the 
OP is able to get the VPN up and functional with the remainder of the 
internet traffic going out his / her default internet connection, not 
the VPN.  Presuming that this is the case, this is just an issue of 
getting the routing set up correctly.

> I also forget exactly what to do here, so if someone else knows please 
> help out.
> If i recall correctly, there is a way you can direct traffic to your vpn 
> using SNAT.

If by "... direct traffic to your vpn ..." means cause replies to your 
traffic to come back towards you through the VPN, yes I agree.  You are 
wanting any traffic you send out through the VPN to appear as if it is 
coming from your VPN IP so that the traffic will be routed back to you 
through the VPN.  This is where SNAT / MASQUERADE comes in to play.

> so like if iptables -t nat -A POSTROUTING -d vpn_endpoint -J SNAT 
> --to-source local_vpn_endpoint

I think you are close.  However I would not match traffic that is 
destined to the VPN endpoint.  I say this because it is very unlikely 
that there will be much IP traffic that is actually destined to the 
other VPN end point its self.  Sure a lot of traffic will flow through 
it, but not be to it directly.

I think you are wanting to remove the "-d vpn_endpoint" from that line 
and possibly put "-o vpn_interface" in its place.  Seeing as how this is 
a dynamic connection (one that comes up and goes down at least compared 
to a static IP on a LAN connection) you could use the MASQUERADE target 
as a short cut as well as not maintaining connection state across 
interface flaps.

> I think thats correct.  The idea here is to have only traffic to the vpn 
> use the vpn, no?   Trafic would leave
> your vpn endpoint, reach the other side.  The other side would reply 
> back to your SNAT -to-source which
> would get routed to your pc.
> I know this works with the *swan implementations, so using some sort of 
> NAT may help.
> I would use those tools to debug, but there are probably some others 
> that would help as well.

*nod*  Source NAT is very likely going to be required to get his / her 
reply traffic back to his end of the VPN.  At least it will be required 
for any systems behind the computer connecting to the VPN.  If there are 
no computers behind it, then NAT should not be needed as the system's 
routing stack *should* choose the VPN IP any way.

> Have you ever tried OpenVPN?  It have used it in an office situation 
> before, and people appreciated it.

Just guessing, but based on the fact that the OP was referring to PPTP 
as well as Microsoft I'm betting that he / she is connecting to a 
Microsoft VPN server, which to the best of my knowledge does not use SSL 
VPNs, thus I don't think OpenVPN will be of much help in this case. 
That is not to say that OpenVPN is good or bad, just that it likely will 
not work in this situation (presuming the Microsoft VPN server).



Grant. . . .
