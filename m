From: Steve Comfort <steve@4Dllc.com>
Subject: The penny has dropped
Date: Mon, 13 Sep 2004 15:34:51 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <4145A1FB.3090101@4Dllc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ebtables-user <ebtables-user@lists.sourceforge.net>, netfilter <netfilter@lists.netfilter.org>

Hi all,

I have an access point with physical interfaces ath0 (wireless) and ixp1 
(ethernet). I set it up to operate as a bridge (br0) with the aforegoing 
interfaces being the bridge ports. I'd been racking my brains for a 
couple of days trying to figure out why I wasn't dropping any packets 
received on interface ath0. (I was trying to limit pings).

Eventually I had an eureka moment, when I realised that the other side 
of my connection was PPPoE. So the client side was tunneling directly to 
the PPPoE server running on the ethernet side of the access point. Hence 
all the pings I was trying to limit were being encapsulated by PPPoE, 
and hence no rules were matching. Yes, I can be really stupid at times!

So the question now is whether it is possible to filter out these 
"encapsulated" pings, maybe by examining the embedded header within the 
PPPoE encapsulation?

Best regards
Steve


