From: "Carl Holtje ;021;vcsg6;" <cwh0803@cs.rit.edu>
Subject: Source/Destination matching question..
Date: Tue, 15 Feb 2005 11:41:49 -0500 (EST)
Message-ID: <Pine.GSO.4.58.0502151132360.12207@frazi.cs.rit.edu>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

All-

Is there a way to define a rule to combine the following lines:
-A INPUT -s xxx.xxx.xxx.xxx -d yyy.yyy.yyy.yyy -j DROP
-A INPUT -s zzz.zzz.zzz.zzz -d yyy.yyy.yyy.yyy -j DROP

... something like
-A INPUT -s xxx.xxx.xxx.xxx -s zzz.zzz.zzz.zzz -d yyy.yyy.yyy.yyy -j DROP
  or even
-A INPUT -s xxx.xxx.xxx.xxx -s zzz.zzz.zzz.zzz -j DROP

   which would match a packet from xxx.xxx.xxx.xxx OR zzz.zzz.zzz.zzz to
yyy.yyy.yyy.yyy...

Thanks!

Carl

- --

"There are 10 types of people in the world: Those who understand binary
and those that don't."

