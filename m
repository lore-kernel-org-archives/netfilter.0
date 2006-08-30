From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: [MASQUERADING] iptables keeps sending from old IP after ppp0's
 IP has changed
Date: Wed, 30 Aug 2006 15:57:25 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0608301555120.9839@yvahk01.tjqt.qr>
References: <200608301407.55481.Daniel@musketa.de>
	<Pine.LNX.4.61.0608301500440.4610@yvahk01.tjqt.qr>
	<44F591D1.5080008@plouf.fr.eu.org>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <44F591D1.5080008@plouf.fr.eu.org>
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
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@lists.netfilter.org

>
> Unlike SNAT, isn't the MASQUERADE target supposed to delete obsolete
> masqueraded conntrack entries when the related interface goes down - or maybe
> when it goes up again with a different address ?

You are right..

        if (event == NETDEV_DOWN) {                                             
                /* Device was downed.  Search entire table for                  
                   conntracks which were associated with that device,           
                   and forget them. */                                          
                IP_NF_ASSERT(dev->ifindex != 0);                                
                                                                                
                ip_ct_iterate_cleanup(device_cmp, (void *)(long)dev->ifindex);  
        }                                                                       


>> > How can I force iptables to use ppp0's real IP address as sender IP in
>> > outgoing packets?
>> 
>> Flush the conntrack table when ppp0 has gone up (yes, up)
>
> Why not when ppp0 has gone down ?

Er, whenever the status changes (both up and down).


Jan Engelhardt
-- 

