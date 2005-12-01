From: Frank.Mayer@knapp-systems.com
Subject: Antwort: Re: ipsets for both source and target in one iptables-rule?
Date: Thu, 1 Dec 2005 19:05:13 +0100
Message-ID: <OFD843AFFB.B134D21C-ONC12570CA.00621CA5-C12570CA.00635B0D@knapp.com>
References: <Pine.LNX.4.58.0512011711030.7270@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.58.0512011711030.7270@blackhole.kfki.hu>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hello,

>> I'd like to use two ipsets in a single iptables rule similar to
>>
>> iptables -A FORWARD -p tcp -m tcp --dport ssh -m set --set clients src 
-m
>> set --set servers dst  -m state --state NEW,ESTABLISHED -j ACCEPT
>
> That is not possible due to the feature in iptables itself that one 
cannot
> specify two or more match extensions of the same time. It is a 
limitation
> of the userspace interface (i.e. iptables) and not that of the kernel.

That's what I thought might be the case.......

> However, you can "workaround" the situation with using the binding
> functionality of ipset. Bind the servers set to the clients set as 
default
> and use the command
> .....

Ah! It looks like I didn't really understand that "bind"-thing from the 
docs. ;-)

> In my opinion it's wasting of resources to specify any other matching
> together with '-m state --state NEW,ESTABLISHED' if you set up proper
> rules for matching NEW packets.
I'm not sure I understand....
It's true I can (and often do) add a rule similar to
        iptables -A FORWARD -s 0/0 -d 0/0 -p tcp -m state --state 
ESTABLISHED -j ACCEPT
as some "catch-it-all".
Is this what you mean? - the second rule in my mail I just gave for 
clarity and completeness....

Best Regards and many thanks,
Frank Mayer
UNIX Systemadministration
----------------------------------------------------
KNAPP Systemintegration GmbH
Waltenbachstrasse 9
8700 Leoben, Austria
----------------------------------------------------
Phone: +43 3842 805-921
Fax: +43 3842 82930-921
frank.mayer@knapp-systems.com
www.knapp.com

