From: "Ric Messier" <kilroy@WasHere.COM>
Subject: Going around routing tables without NAT
Date: Tue, 25 Jul 2006 09:47:24 -0600
Message-ID: <001c01c6b001$a08ae1b0$e1a0a510$@COM>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Language: en-us
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

Hi,
	I have a problem I've been unable to come up with a solution for. I
have a pair of "Internet" connections into my firewall. One is a wireless
broadband connection that has a static IP address so I use it to host a
couple of small domains (Web/mail). The second connection is DSL. I'd like
to push traffic from my internal network through the DSL connection and
leave the static connection for hosting purposes (and a backup in case of
issues with the DSL). I don't, however, want to do NAT since the "modem" I
am connected to already does NAT and I don't really want to double-NAT the
packets. My routing table on the firewall is set with a default out the
wireless connection which needs to be there so I'm not routing
asymmetrically on response traffic to, for example, SMTP or HTTP. It seems
to me that a POSTROUTING rule with a ROUTE target should be correct but I'd
need to install the patches for that and it's not clear to me how well it
would work anyway. Any additional thoughts?


:wireless bband: ------ 	<- default route
				\
				 \
				  <--->: firewall : <---> : internal network
:
				 /
				/
:DSL: -----------------


Thanks,
Ric




