From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Strange entries in /var/log/messages
Date: Mon, 1 Mar 2004 12:31:10 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403011231.10861.Antony@Soft-Solutions.co.uk>
References: <1078144018.13370.20.camel@raylinux.internal>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1078144018.13370.20.camel@raylinux.internal>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

On Monday 01 March 2004 12:26 pm, Ray Leach wrote:

> Hi All
>
> Can anyone explain why a machine on 10.0.0.10/24 would try and
> communicate with another machine 10.0.0.4/24 via a router?
> Mar  1 14:19:37 firefly kernel: DROP FORWARD INTERNAL: IN=eth2 OUT=eth2
> SRC=10.0.0.10 DST=10.0.0.4 LEN=48 TOS=0x00 PREC=0x00 TTL=127 ID=17562 DF
> PROTO=TCP SPT=4601 DPT=159 WINDOW=64240 RES=0x00 SYN URGP=0

Bad routing table / netmask on 10.0.0.10?
Bad ARP cache entry?
10.0.0.4 sending silly ICMP redirects?
Strange network cabling arrangement :) ?

Regards,

Antony.

-- 
The truth is rarely pure, and never simple.

 - Oscar Wilde

                                                     Please reply to the list;
                                                           please don't CC me.


