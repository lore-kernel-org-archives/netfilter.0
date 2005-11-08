From: Joe Nuts <joenuts@gmail.com>
Subject: tc filter packet directional questions
Date: Tue, 8 Nov 2005 12:22:35 -0600
Message-ID: <cfc690b70511081022n251edb31w4937881bd245954d@mail.gmail.com>
References: <cfc690b70511081021n5ce90769k7de984a0f72813a5@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <cfc690b70511081021n5ce90769k7de984a0f72813a5@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi group,
I have a few questions concerning setting up some htb queues on my
firewall. I've read through the documentation, and I'm utterly
confused. My set up is essentially : DSL to internet 4.5M down .748
up. Connects to eth0 (external interface). Firewall has eth1 (internal
interface), and various tunnel interfaces. (approx. 12 internal
networks are routed through this box. minimal traffic between
networks, mostly used for internet traffic)
As I undertstand it, only traffic that is 'sent' can be queued. Thus,
my tc filter rules should be on dev eth0 for traffic destined for the
internet (refered to as outbound traffic), and my filter rules should
be on dev eth1, tun1, tun2, tun3, etc for traffic from the internet
(refered to as inbound traffic).
Which leads me to question 1: can one class be shared among devices? I
would like to have my 4.5M down available to all my internal
interfaces, with priorities given to certain tcp traffic.
Question 2 is about the actual "sending" of the traffic. If I limit
dev eth0 to only be able to send at .748k, will that have any effect
on the incoming traffic? Does the act of passing an incoming packet on
dev eth0 to go out of dev eth1 count towards dev eth0 "sending"
traffic?
Thanks for the help
-Joe

