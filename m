From: <anton@web-sat.com>
Subject: long ruleset perfomance issue
Date: Mon, 4 Apr 2005 12:44:19 +0100
Message-ID: <005901c5390b$a363fe30$03c01751@jg>
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
I need to mark packets going through a linux router with iptables for =
some 4500 ip addresses(to use with tc bandwidth shaping filters).
This list needs to be updated every 10 minutes.
So i made a shell script file looking like:

/usr/local/sbin/iptables -F=20
/usr/local/sbin/iptables -A FORWARD -t mangle -d 1.1.1.1 -j MARK =
--set-mark 1
/usr/local/sbin/iptables -A FORWARD -t mangle -d 1.1.1.3 -j MARK =
--set-mark 2
/usr/local/sbin/iptables -A FORWARD -t mangle -d 1.1.1.2 -j MARK =
--set-mark 1
and so on for 4500 times.

When i run this script on Xeon 2.4ghz cpu it takes 2-3 minutes real time =
with 100% cpu load to process.
During this time server becomes unusable.=20
Is there any way to make it run faster, like optimizing ruleset or =
trying a different approach?
I have tried to search on this issue but was not successful.

Any input is greatly appreciatred.

Thank you,
Anton

