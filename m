From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: How to filter this packet?
Date: Mon, 23 Apr 2007 20:23:14 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0704232020570.31254@yvahk01.tjqt.qr>
References: <450608.64360.qm@web63507.mail.re1.yahoo.com>
	<462CDD41.8020505@cit.hu>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <462CDD41.8020505@cit.hu>
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
To: Nagy Zoltan <nagy.zoltan@cit.hu>
Cc: netfilter@lists.netfilter.org


On Apr 23 2007 18:22, Nagy Zoltan wrote:
> monty denis wrote:
>> Hello, all.
>> 
>> I can filter some protocol packet like below.
>> 
>> iptables -A INPUT -p x 
>> But how can I filtre like (proto 0) below?
>> proto 0 means protocol 0 ?
>> 
>> I can find protocol 0 information at
>> http://www.iana.org/assignments/protocol-numbers
>> 
>> 
>> 11.34.254.146 -> xx.xx.xx.xx [proto 0]
>> ........WinSock 2.0.....LG@.

according to /etc/protocols, proto 0 is IPv6-HOPBYHOP ...


Jan
-- 

