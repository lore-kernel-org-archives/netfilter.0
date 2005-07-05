From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: Implicit SNAT gone
Date: Tue, 5 Jul 2005 13:20:33 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0507051319470.10623@yvahk01.tjqt.qr>
References: <Pine.LNX.4.61.0507042116530.10754@yvahk01.tjqt.qr>
	<1120548134.5268.4.camel@nienna.balabit>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1120548134.5268.4.camel@nienna.balabit>
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
To: KOVACS Krisztian <hidden@balabit.hu>
Cc: Netfilter User Mailing List <netfilter@lists.netfilter.org>


>> In ip_nat_rule.c (and my syslog! apprently) I see:
>> 
>> /* Before 2.6.11 we did implicit source NAT if required. Warn about change. */
>>                 printk("NAT: no longer support implicit source local NAT\n");
>>                 printk("NAT: packet src %u.%u.%u.%u -> dst %u.%u.%u.%u\n",
>>                        NIPQUAD(srcip), NIPQUAD(dstip));
>> 
>> So, how do I get the feature back with 2.6.12 logic?
>> (Or do I have to forwardport that feature?)
>
>  Forward porting that "feature" is nearly impossible without backing
>out all the NAT-related changes. However, you can usually solve the
>problem itself instead of reintroducing such tricks. Why exactly do you
>need this feature?

telnet 127.0.0.1 1234 should redirect to a different host. Previously, this 
was possible using iptables -t nat -A OUTPUT -j DNAT -p tcp --dport 1234 
--to-dest 192.168.17.2:1234



Jan Engelhardt                                                               
--                                                                            


