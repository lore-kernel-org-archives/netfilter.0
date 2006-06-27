From: "conn itnel" <connintel1@gmail.com>
Subject: Packet Mirroring
Date: Tue, 27 Jun 2006 18:32:00 +0530
Message-ID: <eb5e15780606270602h772cca66s59358a4e15c59951@mail.gmail.com>
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
To: netfilter@lists.netfilter.org

Hello friends,

I have three NIC on my pc, eth0,eth1 and eth2 respectively. The eth0
is directly connected with the internet.

I want the traffic that comes on eth0 will reach eth1 and also eth2
respectively.

For example, If Packet P1 comes to eth0, It duplicates itself and then
should reach to eth1 and eth2.

For that i have searched on the net and tryied Libipq library. By
using "ipq_read" I can easily get the packets at user level but how to
resend the packets back to eth1 and eth2 is not known.

So any one can through some light how to send packets to specific
interface using netfilter or any other way round..

Thank You in Advance..

Have a Nice Time and Good Day ahead..

Regards
Ankur. :-)

