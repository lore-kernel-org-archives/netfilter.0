From: "Nicolas Montauban" <nicolas@lookali.com>
Subject: Help about ipfw
Date: Wed, 15 Sep 2004 20:21:14 +0400 (RET)
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <58812.192.168.0.100.1095265274.squirrel@192.168.0.100>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

I want information about ipfw : link
Usually i use iptables, but i must use ipfw for this night!!!

Please don't say me "google"

I have a bridge:
default rule are

pass in quick on lo0
pass out quick on lo0

pass in log level local0.alert quick on ed1 from any to any
pass out quick on ed1 from any to any

pass in log level local0.alert quick on ed2 from any to any
pass out quick on ed2 from any to any

I want allow:
ssh :wan to lan

block
netbios, kazaa ... : lan to wan

Cordially,
Nicolas M.


