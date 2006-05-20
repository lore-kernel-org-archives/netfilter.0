From: "Andrew Kraslavsky" <andykras@hotmail.com>
Subject: RE: Why doesn't MASQUERADE handle local packets?
Date: Sat, 20 May 2006 12:23:45 -0700
Message-ID: <BAY106-F3BC9AF1A81A3F03395404D6A40@phx.gbl>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

> > In attempting to use the MASQUERADE target for some traffic that is > 
>locally generated (as opposed to forwarded traffic) I found that the > 
>source IP address was not being changed even though the rule was > clearly 
>being used.
>
>If a packet is MASQ-ed, it gets the source IP address from an interface on 
>the firewall where it leaves from (to put it simple). When a locally 
>generated packets leave the firewall from the same interface as MASQ-ed 
>packets do, they should already have the same source IP address so why 
>would you want to use MASQ ?
>
>I see no reason for locally generated packets to be MASQ-ed and I think the 
>question is: what is it that you want to accomplish by MASQ-ing locally 
>generated packets..?
>

The applications (which I do not own) in question are binding to a local 
private IP address because their traffic is sometimes destined for a VPN and 
the local IP is the only one that is valid on the VPN.  Other times, that 
same traffic is sent out to the Internet so the source IP address needs to 
be SNATed to the one assigned to the public interface.

Rightly or wrongly, these applications are expecting that the system will 
SNAT the traffic when appropriate and I have iptables rules that will do 
that if I use the SNAT target.  However, since the public IP address is 
acquired dynamically, the MASQUERADE target is what I really want to be able 
to deploy.

Thanks,

- Andrew Kraslavsky

_________________________________________________________________
Express yourself instantly with MSN Messenger! Download today - it's FREE! 
http://messenger.msn.click-url.com/go/onm00200471ave/direct/01/


