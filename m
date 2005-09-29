From: =?ISO-8859-1?Q?J=F6rg_Harmuth?= <harmuth@mnemon.de>
Subject: Re: 30s delay while receiving mail
Date: Thu, 29 Sep 2005 12:43:10 +0200
Message-ID: <433BC53E.5050802@mnemon.de>
References: <BAY108-F26F9A9A119223E58D8E647978D0@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY108-F26F9A9A119223E58D8E647978D0@phx.gbl>
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
To: netfilter@lists.netfilter.org

david v wrote:
> Hello,
> I'm having problems receiving email. There is always a delay of 30s 
> behinf the DMZ zone.

[SNIP]

> telnet mail 110 (30s delay)
> telnet mail 25 (no delay)
> 
> Forewall Nat rules are properly configured so that the firewall forward 
> pop incoming queries to the correct IP adress(mail machine).
> 
> I'm not sure how to resolve that issue, any help would be extremely 
> useful. Could that be a problem on the firewall side ?

Yes and no - a matter of taste. May be there is a identd call from your 
POP3 server ? And this call is DROPed somewhere ? If so, this rule will 
help:

iptables -I OUTPUT -p tcp --dport 113 -j REJECT \
          --reject-with tcp-reset

Hmm, your talking about DMZ. The above rule is written for the POP3 
server itself. On the firewall you should replace OUTPUT with INPUT. If 
these rules don't solve the problem you can delete the rule by

iptables -D [IN|OUT]PUT 1

HTH,

Joerg


