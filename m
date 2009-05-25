From: Robert Nichols <rnicholsNOSPAM@comcast.net>
Subject: Re: How do we arp for NAT?  Secondary IPs, proxy arp? something else?
Date: Sun, 24 May 2009 23:51:23 -0500
Message-ID: <gvd84b$urq$1@ger.gmane.org>
References: <4A19235F.4070306@opendreams.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4A19235F.4070306@opendreams.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Jesse Molina wrote:
> 
> Hello
> 
> I've googled all over and I don't really see an obvious answer to the 
> question that I have.
> 
> Here is my situation:  I have a GNU/Linux host performing very typical 
> firewall duties;  two interfaces, one with an Internet public IP and 
> another interface on an RFC1918 net.  Hosts on the RFC1918 net have 
> iptables SNATs to public IPs and then I filter to allow some services in 
> and others not, with stateful inspection in forwarding.
> 
> Normally, in order to get the multiple public IPs for these SNAT'ed 
> hosts to respond to arp requests from the firewall, I simply add them as 
> secondary IPs on the public interface of the firewall (eth0:1, eth0:2,...).
> 
> The problem with this is that the firewall itself runs some services and 
> they have the potential to use these secondary IPs as their ephemeral 
> source addresses when they reach out to something on the Internet! 
> That's bad, as those IPs should be exclusively used by only the hosts 
> for which they were designed for.  Assume I have no control over the 
> applications which bind to a local interface to use for their outbound 
> session traffic.

Packets that originate on the firewall machine itself go through the
OUTPUT chain.  Forwarded packets from the RFC1918 net do not.  Block
the packets in the OUTPUT chain of the filter table.

-- 
Bob Nichols     "NOSPAM" is really part of my email address.
                 Do NOT delete it.

