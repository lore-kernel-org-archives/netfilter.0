From: Jason Opperisano <opie@817west.com>
Subject: Re: Connection problems on large high speed connections.
Date: Thu, 28 Apr 2005 17:24:13 -0400
Message-ID: <20050428212413.GA31194@bender.817west.com>
References: <1114555837.14247.15.camel@zepto.barmen.nu>
	<Pine.LNX.4.58.0504270854230.4795@blackhole.kfki.hu>
	<1114585852.15246.11.camel@zepto.barmen.nu>
	<1114586414.15242.14.camel@zepto.barmen.nu>
	<1114608987.15240.49.camel@zepto.barmen.nu>
	<Pine.LNX.4.58.0504271542470.5216@blackhole.kfki.hu>
	<1114609896.15244.54.camel@zepto.barmen.nu>
	<Pine.LNX.4.58.0504271554450.5216@blackhole.kfki.hu>
	<1114719380.14301.4.camel@zepto.barmen.nu>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1114719380.14301.4.camel@zepto.barmen.nu>
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

On Thu, Apr 28, 2005 at 10:16:20PM +0200, Stian B. Barmen wrote:
> Just to satisfy my couriosity, I logged in ulog the invalig packets, and
> there are quite a few. How many should I expect to see and count as
> normal? 
> 
> For instance I downloaded a file from a reasonably fast FTP server at
> about 7 MB, and during I logged three invalid TCP packets. 
> 
> Apr 28 22:07:25 fire Invalid:  IN=eth1 OUT=
> MAC=00:d0:b7:1d:cc:7d:00:90:69:f0:b0:20:08:00  SRC=156.56.247.195
> DST=217.199.xx.18 LEN=1500 TOS=00 PREC=0x00 TTL=53 ID=47468 CE DF
> PROTO=TCP SPT=80 DPT=33553 SEQ=985943197 ACK=497088462 WINDOW=6432 ACK
> URGP=0
> Apr 28 22:07:43 fire Invalid:  IN=eth1 OUT=
> MAC=00:d0:b7:1d:cc:7d:00:90:69:f0:b0:20:08:00  SRC=156.56.247.195
> DST=217.199.xx.18 LEN=1500 TOS=00 PREC=0x00 TTL=53 ID=52274 CE DF
> PROTO=TCP SPT=80 DPT=33553 SEQ=989439897 ACK=497088462 WINDOW=6432 ACK
> URGP=0
> Apr 28 22:07:47 fire Invalid:  IN=eth1 OUT=
> MAC=00:d0:b7:1d:cc:7d:00:90:69:f0:b0:20:08:00  SRC=156.56.247.195
> DST=217.199.xx.18 LEN=1500 TOS=00 PREC=0x00 TTL=53 ID=53186 CE DF
> PROTO=TCP SPT=80 DPT=33553 SEQ=990104197 ACK=497088462 WINDOW=6432 ACK
> URGP=0

the only thing that jumps out at me is that all those packets have the
CE bit set (Congestion Experienced).  care to share with us the rule
that creates those log entries?  is it just "-m state --state INVALID -j
LOG"?  i would be very surprised if setting CE caused a packet to
identified as INVALID...

-j

--
"Stewie: I'll wait until you're finished. Are you done? Because
 I thought this show was called "Kids Say the Darndest Things," not
 "Old Black Comedians Who Never Shut The Hell Up.""
        --Family Guy

