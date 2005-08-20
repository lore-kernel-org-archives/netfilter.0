From: Brent Clark <bclark@eccotours.dyndns.org>
Subject: Re: port 80 out new ISP
Date: Sat, 20 Aug 2005 11:51:55 +0200
Message-ID: <4306FD3B.2070701@eccotours.dyndns.org>
References: <430600E4.3090004@eccotours.dyndns.org>	<200508191205.22196.rob0@gmx.co.uk>	<43061F87.1030507@eccotours.dyndns.org>
	<de5rqo$qlc$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <de5rqo$qlc$1@sea.gmane.org>
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
To: Robert Nichols <rnicholsNOSPAM@comcast.net>
Cc: netfilter@lists.netfilter.org

Robert Nichols wrote:
> Brent Clark wrote:
> 
>> iptables -t nat -A PREROUTING --dport 80 -j LOG
>> Aug 19 18:40:32 gate kernel: IN=eth1 OUT= 
>> MAC=00:00:f4:af:80:b8:00:60:67:77:aa:92:08:00 SRC=192.168.111.213 
>> DST=66.36.247.82 LEN=48 TOS=0x00 PREC=0x00 TTL=128 ID=2925 DF 
>> PROTO=TCP SPT=4032 DPT=80 WINDOW=65535 RES=0x00 SYN URGP=0
>>
>> Notice that "OUT=" does not show eth2
> 
> 
> Of course not.  In the PREROUTING stage no decision about where to send
> the packet has yet been made.
> 

Hi Robert

Makes sense, thanks for the feedback.

Kind Regards
Brent Clark

