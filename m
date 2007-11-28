From: Shyam Prasad <shyam@rocsys.com>
Subject: Re: Reg Stateful firewall
Date: Wed, 28 Nov 2007 07:49:29 -0800 (PST)
Message-ID: <333233.67984.qm@web1009.biz.mail.sp1.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Martijn Lievaart <m@rtij.nl>
Cc: netfilter@vger.kernel.org

But would it not be efficient if the firewall automatically allows such packets which were validated in INPUT.
that would save me lot of rules that might otherwise be necessary.


some linux based firewalls(not netfilter) do this automatically since they already know the state.


Regards,
Shyam

----- Original Message ----
From: Martijn Lievaart <m@rtij.nl>
To: Shyam Prasad <shyam@rocsys.com>
Cc: netfilter@vger.kernel.org
Sent: Wednesday, November 28, 2007 8:57:40 PM
Subject: Re: Reg Stateful firewall


<citaat van="Shyam Prasad">
> Hi,
> I have a doubt regarding statefull feature in iptables firewall
>
> In my iptables filter table i set the default policy for INPUT,OUTPUT
 and
> FORWARD as DROP.
> so all packets are dropped.
> now i added a policy
> iptables -A INPUT -p icmp -m state --state NEW,ESTABLISHED -j ACCEPT
>
> My assumption is that when an external device sends a  ping
> request(echo-request) its state will be NEW and it will be
 accepted,since
> for this a state table is being maintained,the ping reply should be
 sent
> through OUTPUT chain with out being blocked.but the packet is dropped
 in
> the OUTPUT chain.
>
> I understand that the rule we added is only for INPUT chain,but is a
 rule
> in OUTPUT chain required to send the reply packet out even for a
> legitimate packet that we accepted??

Yes, you must accept ESTABLISHED. For good measure accept RELATED as
 well.

-A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

HTH,
M4

-
To unsubscribe from this list: send the line "unsubscribe netfilter" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html



