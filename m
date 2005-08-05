From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: blocking irc + botnets
Date: Fri, 5 Aug 2005 08:26:14 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0508050825030.20623@yvahk01.tjqt.qr>
References: <bc5becf6050802084137a7ad69@mail.gmail.com>
	<Pine.LNX.4.61.0508040943350.27293@yvahk01.tjqt.qr>
	<bc5becf6050804100426d8357a@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <bc5becf6050804100426d8357a@mail.gmail.com>
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
To: hbeaumont hbeaumont <ahlist@gmail.com>
Cc: netfilter@lists.netfilter.org

>> >We have servers that could get infected via poorly wrote user scripts. I
>> 
>However the fact is that in REAL LIFE, you will have users that use bad 
>scripts or even "good" script that have bugs (phpbb, etc, etc.).

Ah now I get it.

>I simply want to get a good ruleset to share so that anyone who might ever 
>have a server compromised (even non-root, php-apache based stuff running as 
>nobody) could help
>stop the outgoing bad traffic. 

Hm, I'd probably try with

-P OUTPUT DROP
-P OUTPUT -j ACCEPT -m state --state ESTABLISHED,RELATED


Jan Engelhardt
-- 

