From: Royce Kemp <rkemp@ip3.com>
Subject: Re: Unable to add rule on Chain with 28 characters.
Date: Fri, 08 Jul 2005 13:10:57 -0700
Message-ID: <6.0.1.1.2.20050708131029.01f2b9a8@insight.ip3.com>
References: <42CECD47.5050003@interage.com.br>
	<20050708195049.GA7221@bender.817west.com>
	<42CEDB7F.3060609@interage.com.br>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42CEDB7F.3060609@interage.com.br>
References: <42CECD47.5050003@interage.com.br>
	<20050708195049.GA7221@bender.817west.com>
	<42CEDB7F.3060609@interage.com.br>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Rafael Dreher <dreher@interage.com.br>, Jason Opperisano <opie@817west.com>
Cc: netfilter@lists.netfilter.org

I have run into this problem as well. Learn to stick to 28 characters.

-r

At 01:01 PM 7/8/2005, Rafael Dreher wrote:
>>>Hi,
>>>
>>>I'm trying do add a rule on a user-defined chain, on the NAT table, with 
>>>28 characters.
>>
>>my guess is you're leaving out the '-t nat' as custom chains only exist
>>in the table they're created in:
>
>Hi, again.
>
>I guess no. :)
>
>[root@ward] [16:55:58]
>[~]#iptables -t nat -N ecommerce-internet@POSTROUTING
>
>[root@ward] [16:56:01]
>[~]#iptables -t nat -A POSTROUTING -j ecommerce-internet@POSTROUTING
>iptables: No chain/target/match by that name
>
>[root@ward] [16:56:19]
>[~]#
>
>Am I crazy? :)
>
>This chain has 30 characters... the max.. if I reduce it to 28, it's added 
>wihtout any problem.
>
>Thank's
>
>--
>Rafael Dreher
>
>-:: Red Hat Certified Engineer ::-
>-:: Nr: 807303498507617 ::-
>http://www.redhat.com/training/certification/verify



