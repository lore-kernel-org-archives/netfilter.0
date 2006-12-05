From: =?UTF-8?B?QXJ0xatyYXMgxaBsYWp1cw==?= <x11@arturaz.net>
Subject: How to hide a NAT router?
Date: Tue, 05 Dec 2006 23:14:03 +0200
Message-ID: <4575E11B.4060007@arturaz.net>
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
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@lists.netfilter.org

Hello,

I've stepped on this mail in list:
http://lists.netfilter.org/pipermail/netfilter/2004-November/056947.html

But I still haven't found any solutions for these two problems:

the second method, sterilizing IP
header information and stripping unneeded TCP flags would successfully
undermine this scheme. For the last Method, counting hosts behind a
router.
Striping the fragmentation flag for syn packets, and setting the IP ID to
'0', (like Linux and Free BSD both do) would make it impossible to count
hosts behind a NAT router.

Any ideas how to do that on 2.6 and latest netfilter?
-- 
Pagarbiai,
ArtÅ«ras Å lajus
--
Skype: arturaz_
ICQ: 157929934
Jabber: arturaz@akl.lt
IRC: arturaz @ irc.data.lt, irc.freenode.net, irc.lcirc.net

