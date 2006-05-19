From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Why doesn't MASQUERADE handle local packets?
Date: Fri, 19 May 2006 07:11:14 +0200
Message-ID: <000c01c67b02$a7349530$0101000a@sterenborg.info>
References: <BAY106-F5B1C306A466F2FD42A55ED6A60@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY106-F5B1C306A466F2FD42A55ED6A60@phx.gbl>
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

> In attempting to use the MASQUERADE target for some traffic that is
> locally generated (as opposed to forwarded traffic) I found that the
> source IP address was not being changed even though the rule was
> clearly being used. 

If a packet is MASQ-ed, it gets the source IP address from an interface
on the firewall where it leaves from (to put it simple). When a locally
generated packets leave the firewall from the same interface as MASQ-ed
packets do, they should already have the same source IP address so why
would you want to use MASQ ?

I see no reason for locally generated packets to be MASQ-ed and I think
the question is: what is it that you want to accomplish by MASQ-ing
locally generated packets..?


Gr,
Rob


