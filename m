From: =?ISO-8859-1?Q?J=F6rg_Harmuth?= <harmuth@mnemon.de>
Subject: Re: HOW to make 'Deleting conntrack rule' clear the state created
 from	this rule
Date: Thu, 04 Aug 2005 12:15:10 +0200
Message-ID: <42F1EAAE.5030103@mnemon.de>
References: <9C1918067C3BC14C9C351C206D8A8437377893@rennsmail03.eu.thmulti.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <9C1918067C3BC14C9C351C206D8A8437377893@rennsmail03.eu.thmulti.com>
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

Allain Yoann schrieb:
> Hello all,
> 
> You would be great if you could help me on this:
> I'm using these 3 rules:
> 
> 1. iptables -P INPUT DROP
> 2. iptables -A INPUT -m state --state ESTABLISHED -j ACCEPT
> 3. iptables -A INPUT -p tcp --dport 23 -m state NEW,ESTABLISHED -j
> ACCEPT
> 
> 
> Then
> 4. Bob connects on my telnet...
> 5. I decide to suppress rule 3: 
> 	iptables -DINPUT -p tcp --dport 23 -m state NEW,ESTABLISHED -j
> ACCEPT
> 
> 6. Packets from Bob are still accepted because of rule 2. But I need
> this rule (2) for my out-going connections responses.
> 
> Is there a way to suppress the state which has been recorded for rule 3,
> when deleting this rule?

This breaks down to selectivly delete conntrack entries, right ? Harald
Welte posted on this topic:

https://lists.netfilter.org/pipermail/netfilter/2005-July/061538.html

HTH and have a nice time,

Joerg


