From: Neal Murphy <neal.p.murphy@alum.wpi.edu>
Subject: Re: Implications of a permissive FORWARD chain
Date: Tue, 18 Feb 2014 17:10:01 -0500
Message-ID: <201402181710.01163.neal.p.murphy@alum.wpi.edu>
References: <loom.20140218T183628-993@post.gmane.org> <5303B490.6070606@solutti.com.br> <loom.20140218T205158-486@post.gmane.org>
Reply-To: neal.p.murphy@alum.wpi.edu
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <loom.20140218T205158-486@post.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Tuesday, February 18, 2014 03:02:37 PM Mark Fox wrote:
> Thanks for the reply, Leonardo. I'm not asking someone else to tell me what
> is the right thing to do. What I'm wondering is what kind of damage someone
> else on the network could use a machine with a permissive forwarding policy
> to do. Spoofing obviously, but anything else?
> 
> With that better understanding, I'll be equipped to make that call.
> 
> In the larger context, the fact that several popular Linux distributions
> come configured with a firewall that allows all forwarding, all incoming
> connections and all outgoing connections is somewhat surprising.

Perhaps this will help.

In a sentence: learn the many different types of traffic flows that can exist 
and grade them (good, bad, essential, unneeded, prohibited, &cet.), then 
identify each type of traffic flow present on your network and decide whether 
or not to control it.

Contrast the following:
  1. You retain the default policies for INPUT, OUTPUT and FORWARD (ALLOW),
     thus allow all traffic into, out of, and through the system. This allows
     almost anyone, almost anywhere, to determine which services are available
     on which systems, and to attack them (SQL attacks on RDBMS servers, SQL
     injection attacks on web servers, &cet.) or to allow malware (viruses,
     trojans, &cet.) to propagate through your private internetwork of LANs.
  2. You set the default policies for INPUT, OUTPUT and FORWARD to DROP, add
     rules that allow only necessary and allowed traffic to pass into, out
     of, and through the system, and add rules/chains to LOG and REJECT (or
     DROP) traffic that is not allowed. You load the conntrack helpers that
     allow, for instance, FTP data connections that are related to FTP control
     connections. You run proxies (employing man-in-the-middle SSL) to prevent
     direct connections through FORWARD and that make deploying VoIP easier.
     You run layer 7 filters that identify and control traffic that uses non-
     standard ports or random ports. All traffic that is not explicitly
     allowed is logged and DROPped or REJECTed. You deploy an intrusion
     detection or intrusion prevention system (IDS/IPS) such as Snort or
     Suricata to identify or block traffic known to be bad. You run VPN
     servers (IPSEC, OpenVPN, and maybe even PPP over SSH) to allow certain
     systems to tunnel through to access necessary systems.

Number 1 is a plain-jane router. Number 2 is a fairly complete firewall.

In between is your gray area, and you must decide how much control you wish to 
exert over traffic into, out of, and through your system.
  - Maybe only certain LANs can access certain other LANs.
  - Maybe certain LANs (machine shop, point-of-sale, &cet.) are never allowed
    to access the internet.
  - Maybe you allow common traffic (ordinary traffic that makes a private
    internetwork of LANs useful) and certain other essential traffic and block
    the rest.
  - Maybe you allow all traffic and only block that which you know to be bad,
    undesired, or non-essential.
  - Maybe you have wireless systems on one LAN and you block their access to
    all but internet and VPN. If they need to access protected systems, they
    fire up a VPN (because wireless is, by its nature, insecure), pass all
    networking traffic through the VPN, and ignore all but VPN/ICMP traffic on
    the wireless interface.
You are still firewalling (because anything less than a fully open router is 
performing *some* firewall function), but it's not necessarily as restrictive, 
draconian or specific as a fully-featured firewall system.
