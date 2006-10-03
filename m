From: Brent Clark <bclark@eccotours.co.za>
Subject: Cant get transparent proxy to route out new ISP.
Date: Tue, 03 Oct 2006 12:34:49 +0200
Message-ID: <45223CC9.4050005@eccotours.co.za>
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
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi all

Could someone please me with my current setup.

I just got another DSL line and I have my routing  and marking the packets etc so that I can decided the fate as to which ISP I would like to route my
traffic out of etc.

I managed to get squid to be used as a trasparent proxy, but im forced to use the default gw of the machine and for the likes of my I cant figure out to
send traffic out the new ISP.

So my question / request for help is, Would anyone please advise me as to how I can choose what ISP I can route my transparent proxy.

I was thinking that maybe it is a POSTROUTING marking that I need to do, and the the routing tables will take care of the rest.

Kinds Regards and thank you in advance.

Brent Clark


