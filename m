From: "Martijn Lievaart" <m@rtij.nl>
Subject: Re: Reg Stateful firewall
Date: Wed, 28 Nov 2007 16:27:40 +0100 (CET)
Message-ID: <18374.217.166.60.19.1196263660.squirrel@ma.rtij.nl>
References: <552867.23040.qm@web1007.biz.mail.sp1.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <552867.23040.qm@web1007.biz.mail.sp1.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Shyam Prasad <shyam@rocsys.com>
Cc: netfilter@vger.kernel.org

<citaat van="Shyam Prasad">
> Hi,
> I have a doubt regarding statefull feature in iptables firewall
>
> In my iptables filter table i set the default policy for INPUT,OUTPUT and
> FORWARD as DROP.
> so all packets are dropped.
> now i added a policy
> iptables -A INPUT -p icmp -m state --state NEW,ESTABLISHED -j ACCEPT
>
> My assumption is that when an external device sends a  ping
> request(echo-request) its state will be NEW and it will be accepted,since
> for this a state table is being maintained,the ping reply should be sent
> through OUTPUT chain with out being blocked.but the packet is dropped in
> the OUTPUT chain.
>
> I understand that the rule we added is only for INPUT chain,but is a rule
> in OUTPUT chain required to send the reply packet out even for a
> legitimate packet that we accepted??

Yes, you must accept ESTABLISHED. For good measure accept RELATED as well.

-A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

HTH,
M4

