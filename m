From: tepesu@australia.edu
Subject: Re: iptables and TOS 15
Date: Fri, 12 Nov 2004 11:43:19 +0200
Message-ID: <41956096.91e.0@australia.edu>
Reply-To: tepesu@australia.edu
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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


    i want to make traffic management of WAN and MAN .... the WAN traffic
is marked with TOS 15 by my ISP ... and i want to redirect the WAN trafic
with iptables through an IMQ interface and then to use HTB
   


>   tos
>       This module matches the 8 bits of Type of Service  field  in  the 
>IP  header  (ie.
>       including the precedence bits).
>
>       --tos tos
>              The argument is either a standard name, (use
>               iptables -m tos -h
>              to see the list), or a numeric value to match.
>
>iptables -m tos -h
>TOS match v1.2.6a options:
>[!] --tos value                 Match Type of Service field from one of 
>the
>                                following numeric or descriptive values:
>                                     Minimize-Delay 16 (0x10)
>                                     Maximize-Throughput 8 (0x08)
>                                     Maximize-Reliability 4 (0x04)
>                                     Minimize-Cost 2 (0x02)
>                                     Normal-Service 0 (0x00)
>
>INPUT and FORWARD
>




