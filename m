From: =?koi8-r?Q?=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF_?=
	=?koi8-r?Q?=EB=CF=D3=D4=C9=CB?= <casper@meteor.dp.ua>
Subject: Re: NAT performance + table processing
Date: Thu, 09 Aug 2007 21:26:46 +0300
Message-ID: <1186684006.4613.7.camel@localhost.localdomain>
References: <000b01c7daac$f4b57030$de205090$@sk>
Reply-To: casper@meteor.dp.ua
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <000b01c7daac$f4b57030$de205090$@sk>
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
Content-Type: text/plain; charset="utf-8"
To: =?UTF-8?Q?J=C3=BAlius_Bem=C5=A1?= <julo@atknet.sk>
Cc: netfilter@lists.netfilter.org

В Чтв, 09/08/2007 в 19:44 +0200, Július Bemš пишет:
> Hi,
> 
> I wrote some performance tests of NAT table. The main idea is, that I add
> 10000 random+senseless rules to the NAT table (snat, postrouting) and then I
> add some rule to specific position which will stop traversing of NAT table.
> I use UDP packets. 
> 
> When I insert my reasonable rule to position 2000 and  run my test, it shows
> delay of packets cca 300ms. But when I run it more times, this delay is 2ms.
> I don't understand why, because I use UDP(connectionless) - so I think, that
> netfilter must process each packet and find appropriate rule. Is this true?
> Or does netfilter do some optimalization? Because this behavior is expected
> in TCP, but not UDP.

UDP is connectionless, you are right. But conntrack thinks of it like of
connection-oriented. If several UDP packets have the same source IPs and
ports and same destination IPs and ports conntrack thinks those are
belonging to the same "connection".

-- 
Покотиленко Костик <casper@meteor.dp.ua>


