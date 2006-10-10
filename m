From: "Holger Kinkelin" <holger.kinkelin@gmail.com>
Subject: How to create a transparent proxy with iptables and redirect
	incoming packets to another port?
Date: Tue, 10 Oct 2006 10:17:44 +0200
Message-ID: <c936c6b70610100117s79a832ebka9fff1bae1f240da@mail.gmail.com>
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

Hello list!

I need to implement some sort of transparent proxy server for the sip
protocol. (In case you don't know: sip uses udp and the standard port
5060).

Step 1:
I redirect packets sent by the sip client (running on 192.168.0.21) to
the server (192.168.0.31) to my proxy server app (running on
192.168.0.21, too) using the following rule:

iptables -A OUTPUT -t nat -p udp --sport 5060 -j DNAT --to-destination
192.168.0.21:5061

As you can imagine my proxy app listens on 5061 for these redirected
packets. This part works well.

---

Step 2:
Now I do "something magic" with the captured sip packets inside my
proxy app and send the  (unchanged) packets to the sip server. My idea
was to send them out at port 5062 and redirect the packets using
another iptables rule that it looks like, if the packets were sent on
5060. That rule looks as follows:

iptables -A POSTROUTING -t nat -p udp --sport 5062 -j SNAT --to-source
192.168.0.21:5060

This part works, too

___

Step 3:
Now I need to redirect the response packets coming IN form the SIP
Server to my proxy app. My idea was to open another port 5063 on the
proxy and redirect the incoming packets to that port. But how? My rule

iptables -A INPUT -t nat -p udp --sport 5060 -j DNAT --to-destination
192.168.0.21:5063

was rejected, since DNAT won't work for INPUT. I tried PREROUTING, the
rule was valid, but no packets are redirected to my proxy.

So my first question is: How can I redirect INCOMING packets to another port?
And the second question is: is there a better way of doing this
transparent proxy app?

Thanks for reading / answering!

Regards,
Holger

