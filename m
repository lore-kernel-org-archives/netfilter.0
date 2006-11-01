From: "Yakov Lerner" <iler.ml@gmail.com>
Subject: cooperation between connection tracking and traffic shaping
Date: Wed, 1 Nov 2006 12:11:02 +0200
Message-ID: <f36b08ee0611010211r598a4857u383de5d0c721887a@mail.gmail.com>
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

To the sip conntrack module, I added the code that creates
the corresponding QoS rule (via netlink) when conntrack detects
the port of the voice traffic (qos/tc by itself could not shape
dynamically by conntrack ports ..., and I wanted traffic
shaping on voice traffic by conntrack-recognized ports).

It worked. But I think it was ugly because:

     (1) I want qos-to-conntrack cooperation for more protocols
with dynamic ports ... can I have it/do it without hacking every
conntrack module ?

    (2) maybe there is a much easier way to achieve this
qos-to-conntrack cooperation [than hacking conntrack modules] ?

Thanks
Yakov

