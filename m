From: Payal Rathod <payal-netfilter@scriptkitchen.com>
Subject: semi OT: default route
Date: Wed, 20 Oct 2004 09:25:51 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20041020132551.GA1720@tranquility.scriptkitchen.com>
Mime-Version: 1.0
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
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Netfilter ML <netfilter@lists.netfilter.org>

Hi,
I have a question which has haunted me for many months. If I have 2 ISP
connections with me, with default gw 1.2.3.4 and 4.5.6.7 and if I add 
both as default routes on my Linux gateway as,
route add -net default gw 1.2.3.4
route add -net default gw 4.5.6.7
and if I send a packet from a windows client to internet, which ISP will it
go through?

Thanks a lot for the answer in advance and waiting eagerly for any
replies.

With warm regards,
-Payal


