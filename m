From: =?ISO-8859-15?Q?J=F6rg_Harmuth?= <harmuth@mnemon.de>
Subject: Re: Log everything from iptables
Date: Fri, 17 Jun 2005 13:47:37 +0200
Message-ID: <42B2B859.5040003@mnemon.de>
References: <00c901c571ce$95902260$ec0211ac@PIVT>
	<200506161536.54612.weinert@sys2.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200506161536.54612.weinert@sys2.de>
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

Michael Weinert schrieb:
[SNIP]> just put:
> 
> iptables -I INPUT 1 -j LOG
> iptables -I OUTPUT 1 -j LOG
> iptables -I FORWARD 1 -j LOG
> 
> in a script and run it. It pushes a Log-entry as the first rule in the table.

If you have to deal with much traffic, you could be interested in
reading this thread:

https://lists.netfilter.org/pipermail/netfilter/2005-May/060220.html

Have a nice time

Joerg


