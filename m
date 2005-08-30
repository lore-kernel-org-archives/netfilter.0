From: =?ISO-8859-1?Q?J=F6rg_Harmuth?= <harmuth@mnemon.de>
Subject: Re: iptables rule command help
Date: Tue, 30 Aug 2005 16:26:17 +0200
Message-ID: <43146C89.8050407@mnemon.de>
References: <20050830135924.86824.qmail@web30208.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050830135924.86824.qmail@web30208.mail.mud.yahoo.com>
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

CC commmunication schrieb:
> Thankyou very much for your help.
> I have read a lot about iptables, but i cannot find
> any  information about how many matches can be done in
> one statement.
> e.g
> can i match source subnet, destination subnet, source
> port range and destination port range with the --syn
> flag set.. etc.

yes

> If any one can explain how options can be matched in
> one iptables statement. 

simply write one after the other as in my previous example. Combine as
you need it.

> i know it could be done by using user defined traget,
> and then do further processing with that traget

You can do it in any chain (also user defined ones), but depending on
the chain in question it's more or less usefull. And also depending on
the target some matches are more or less usefull. E.g. with
layer7-patch, matching against ports is totally useless ;)

Have a nice time,

Joerg

