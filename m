From: "Michael J. Tubby B.Sc. \(Hons\) G8TIC" <mike.tubby@thorcom.co.uk>
Subject: Re: NAT of Cisco Voice-Over-IP with Skinny protocol and CallManager
Date: Fri, 27 Dec 2002 18:26:53 -0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002401c2add5$87b72040$0a90a8c0@boris>
References: <3BAC15E02315BC4783152AC5E9621BB501C7BA1F@trcexcsrv01.trcinc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: Bill Binko <Bill.Binko@trcinc.com>, netfilter@lists.netfilter.org
Cc: gary@shop-shop-shop.net

Bill,

Thanks for answering my query... you were the only one so far.

I had more-or-less worked out the scope of the problem, the Cisco
article just confirms it. However there is a solution - its to use an
application-layer proxy on the Linux Firewall Box and proxy rather
than NAT.

Just such a thing exists and its written in PERL:

http://cvs.oisec.net/cgi-bin/cvsweb.cgi/skinny-proxy/skinny-proxy.pl

Have this working at two sites now with the call manager on the
public internet and Cisco VIP-30s on the public internet (real IP
addresses) and can call phones behind the proxies on RFC1918
addresses and in addition proxy-to-proxy calls also work as expected
(when you get the IPtables rules right :-)

So, we're up and working!


Mike


----- Original Message ----- 
From: "Bill Binko" <Bill.Binko@trcinc.com>
To: "Michael J. Tubby B.Sc. (Hons) G8TIC" <mike@thorcom.com>
Sent: Friday, December 27, 2002 5:33 PM
Subject: RE: NAT of Cisco Voice-Over-IP with Skinny protocol and CallManager


This might help you: http://www.cisco.com/en/US/tech/tk652/tk701/technologies_tech_note09186a00800f2853.shtml

However, it looks like you will need a custom Skinny nat/conntrack module similar to H323 (which was a LONG time coming).

Good Luck!

> -----Original Message-----
> From: Michael J. Tubby B.Sc. (Hons) G8TIC [mailto:mike@thorcom.com]
> Sent: Thursday, December 19, 2002 1:49 PM
> To: netfilter@lists.netfilter.org
> Subject: NAT of Cisco Voice-Over-IP with Skinny protocol and 
> CallManager
> 
> 
> All,
> 
> I have acquired access to a Cisco CallManager (on the internet)
> and a pile of Cisco VIP-30 VOIP phones. I have got everything
> up and working when they are directly connected to the 'net but
> now I want to put some of the phones at friend's houses behind
> the Linux boxen that I've built as NAT/firewalls for their cable
> modem and ADSL connections...
> 
> I'm using RedHat 7.3 but with own compiled 2.4.20 kernel and
> iptables 1.2.7a.
> 
> Problem is that the phone gets it's directory number and connects
> just fine using the Skinny protocol on and TCP:2000 and TFTP on
> UDP:69, however the called party can hear me but the return UDPs
> don't get back in.
> 
> A bit of tcpdump-ing shows that there's no obvious/direct relationship
> between the outgoing UDP port numbers on the voice stream and
> the incomming reply packets, and hence netfilter/nat has no way
> to know what do do unless there's a helper.
> 
> Searching on google reveals only a posting from back in the summer
> by Fred N. van Kempen about the subject/problem:
> 
> http://lists.netfilter.org/pipermail/netfilter-devel/2002-July
/008844.html

Does anyone know if there's a fix for this? Is there a helper (connection
tracking) module that can prime the netfilter/DNAT to get the packets
back in by watching the connection set up?

Any help appreciated.

Mike





