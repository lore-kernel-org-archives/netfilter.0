From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: UDP nat question
Date: Thu, 21 Apr 2005 13:02:17 -0500
Message-ID: <4267EAA9.6000700@riverviewtech.net>
References: <42667F45.5000502@inescporto.pt>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42667F45.5000502@inescporto.pt>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Filipe Abrantes <fla@inescporto.pt>
Cc: netfilter@lists.netfilter.org

I don't know for sure but I believe that other clients trying to reach your SIP client on 129.11.22.33:5054 will fail as the SNAT mapping maintained by your NAT router is using the source IP, source port, destination IP, and destination port that it sees in the traffic coming from the SIP client device as it's key to match packets in it's internal structure.  Thus when some other client on the net tries to connect to your SIP device on port 5054 your NAT firewall / router will see this as invalid traffic.  I believe that if you want other clients on the net to be able to contact your SIP device you will need to port forward port 5060 to your SIP device, or all the traffic will need to pass through a SIP proxy somewhere on the net.

Now for the disclaimer:  I'm guessing at this, but from everything that I have read and worked with this is the behavior that I would expect to see in such a situation.



Grant. . . .
> First of all, thanks for replying, it's clear now.
> 
> I have one more question related to this:
> 
> Imagine a host behind NAT with IP 192.168.22.33 which has an application 
> on port 5060 ( a sip client) and opens a connection to a server outside 
> the NAT (the sip registrar with IP 130.11.22.33 on port 5060), and 
> consider that the NAT box translates the SIP client src_ip to 
> 129.11.22.33 and src_prt to 5054, for this communication.
> 
> The SIP registrar is able to reach the SIP client running on 
> 192.168.22.33:5060 by using 129.11.22.33:5054, but what about other 
> hosts on the Internet? Will they also be able to reach the SIP client 
> using the pair 129.11.22.33:5054, or only packets coming from the SIP 
> registrar be accepted?
> 
> Thanks again
> 
> Filipe Abrantes

