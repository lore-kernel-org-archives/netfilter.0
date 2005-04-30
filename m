From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: allow / deny clients
Date: Sat, 30 Apr 2005 17:33:55 -0500
Message-ID: <427407D3.40805@riverviewtech.net>
References: <853706858e33.858e33853706@vsnl.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <853706858e33.858e33853706@vsnl.net>
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
To: netfilter@lists.netfilter.org

> I would like to allow / deny access to the net to clients
> based on : 
> 
> 1. client IPs.
> 
> or
> 
> 2. client IP + MAC

Rather than denying based on IP, especially in a DHCP environment where IPs could change, I would deny based on source MAC address.  You would write a rule like this:

iptables -t filter -A FORWARD -o eth0 -m mac --mac-source 01:23:45:67:89:ab -j ACCEPT

This rule will allow the system with the mack address of 01:23:45:67:89:ab to access the internet.  I would probably recommend that you add some filters to check that the destination IP and possibly port are valid.  To do this you might want to jump to another chain to do the checking for you or have all traffic pass through that chain before hand.

iptables -t filter -A FORWARD -o eth0 -m mac --mac-source 01:23:45:67:89:ab -j DstIPandPortCheck

This would be such a rule to jump to the DstIPandPortCheck chain to do any additional validation.



Grant. . . .

