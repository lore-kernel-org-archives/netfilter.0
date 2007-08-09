From: =?iso-8859-2?B?SvpsaXVzIEJlbbk=?= <julo@atknet.sk>
Subject: NAT performance + table processing
Date: Thu, 9 Aug 2007 19:44:37 +0200
Message-ID: <000b01c7daac$f4b57030$de205090$@sk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Language: sk
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

I wrote some performance tests of NAT table. The main idea is, that I add
10000 random+senseless rules to the NAT table (snat, postrouting) and then I
add some rule to specific position which will stop traversing of NAT table.
I use UDP packets. 

When I insert my reasonable rule to position 2000 and  run my test, it shows
delay of packets cca 300ms. But when I run it more times, this delay is 2ms.
I don't understand why, because I use UDP(connectionless) - so I think, that
netfilter must process each packet and find appropriate rule. Is this true?
Or does netfilter do some optimalization? Because this behavior is expected
in TCP, but not UDP.

Thanks for replies


