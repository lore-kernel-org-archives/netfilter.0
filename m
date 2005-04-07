From: Eduardo Spremolla <edspremolla@antel.com.uy>
Subject: Ipsec and PREROUTING
Date: Thu, 07 Apr 2005 09:08:26 -0300
Message-ID: <1112875707.10621.10.camel@fly.in.iantel.com.uy>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org


Hi everybody,
I'm trying to configure a box with Linux kernel 2.6 native ipsec, that
now works as a firewall with SNAT.

My internal network is 10.1.1.0/24, but the ipsec tunnel need to se part
of it as 10.2.1.0/24, so my question is:

Once the ipsec packets are decrypted them came again from eth1 that is
my external interface, them were market in mangle PREROUTING to let them
in, but them pass again through filter PREROUTING in order to be
DNATed ?

And other question : are there any debug tool that allow to sniff
packets as them traverse the different tables? Like tcpdump in the point
between PREROUTING and FORWARD.


Many thanks in advance.

LALO  

