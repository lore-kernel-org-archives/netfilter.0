From: a.ledvinka@promon.cz
Subject: Re: iptables and TOS 15
Date: Fri, 12 Nov 2004 10:25:06 +0100
Message-ID: <OFEE5FF69B.A5DEEE8A-ONC1256F4A.0033A2AB-C1256F4A.0033BC9C@promon.cz>
References: <419551d1.7be0.0@australia.edu>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <419551d1.7be0.0@australia.edu>
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
To: tepesu@australia.edu
Cc: netfilter@lists.netfilter.org

   tos
       This module matches the 8 bits of Type of Service  field  in  the 
IP  header  (ie.
       including the precedence bits).

       --tos tos
              The argument is either a standard name, (use
               iptables -m tos -h
              to see the list), or a numeric value to match.

iptables -m tos -h
TOS match v1.2.6a options:
[!] --tos value                 Match Type of Service field from one of 
the
                                following numeric or descriptive values:
                                     Minimize-Delay 16 (0x10)
                                     Maximize-Throughput 8 (0x08)
                                     Maximize-Reliability 4 (0x04)
                                     Minimize-Cost 2 (0x02)
                                     Normal-Service 0 (0x00)

INPUT and FORWARD

