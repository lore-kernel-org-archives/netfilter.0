From: "Abdul-Wahid Paterson" <abdulwahid@gmail.com>
Subject: creating artificial latency
Date: Sat, 17 Feb 2007 11:42:46 +0300
Message-ID: <995fcdb00702170042u478d6c2arf139d4f05ac6164c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
To: Netfilter List <netfilter@lists.netfilter.org>

It is probably not the normal thing that people would want to slow
down packets but I have to remote sites and have a few different
options for connecting them. There is no copper or fibre so I am
restricted to certain wireless and satellite systems.

I know what the latency of these proposed systems would be but I need
to make a realistic evaluation of the different systems in terms of
using our in house applications to test what latency would be
acceptable for users to actually work effectively.

Is there a way using iptables (or another linux method) that I can
create artificial latency by adding say 500 msecs to each packet
before it is forwarded?

Thanks and regards,


Abdul-Wahid

