From: "Andrew Hall" <temp02@bluereef.com.au>
Subject: Using SNAT through a 26sec tunnel
Date: Tue, 22 Mar 2005 18:20:56 +1100
Message-ID: <00cb01c52eaf$b0981ac0$5001010a@bluereef.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@lists.netfilter.org

Hello,

I need some clarification on native 26sec packet processing in relation to 
NAT with Netfilter, and I'm hoping someone can enlighten me once and for 
all.

Basically what I want to be able to do is translate (SNAT) traffic before 
ipsec encapsulation in tunnel mode from LANA to LANB. I've set this up and 
applied the relevant patches against 2.6.11.5 and included the policy match 
from the latest snapshot of patch-o-matic. It seems to work, although not 
how I expected it to.

What I don't really understand is where the encapsulation is really done by 
Netfilter. According to the mail archives I've read, when traffic leaving a 
Linux box that is to have ipsec encapsulation performed, will pass the 
POSTROUTING chain twice - first time plain/normal (before encryption) 
processing, second time is after encryption. If this is the case then I 
should be able to apply SNAT policies on traffic that passes the POSTROUTING 
chain the first time (before encryption). I had assumed I could do this with 
the policy match (--pol = none ), but this doesn't seem to be the case.

By looking at what the other end is expecting for bring up phase one and 
two, it seems to be expecting sainfo that will match traffic that is NOT a 
translated source, and if I only specify SA filters matching the translated 
source as the origin, it complains that there is no proper SAinfo matching 
the case for traffic coming from the other LAN's source (LANA). What this 
seems to be tell me is that the SNAT is done as requested, but it is somehow 
performed after the encapsulation and not before. I've tried altering the 
policy match to --pol = ipsec, but this seems to make no difference.

So if someone can tell me how this is meant to work, I'd be really 
appreciative.

Thanks,

andrew. 


