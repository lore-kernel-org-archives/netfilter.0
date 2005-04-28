From: "Sylvan Andrew" <sylvan_nids@norfolk.nf>
Subject: Correct syntax prob. NAT src ip address based on dst port.
Date: Thu, 28 Apr 2005 13:29:52 +1130
Message-ID: <001801c54b95$f77e0a50$0510a8c0@cornerpc>
Reply-To: Sylvan Andrew <sylvan_nids@norfolk.nf>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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


Hello,

 Could somebody please tell me if this is the correct syntax ? I am =
trying to make it so that any local traffic gets natted to a specific IP =
if it is destined to a HTTPS port.

iptables -t nat -A POSTROUTING -p tcp --dport 443 -j SNAT --to =
197.15.12.12

A tcpdump show the replies are coming back in fine but when you actually =
browse to a https site nothings happening.

Thanks very much !

Sylvan 
