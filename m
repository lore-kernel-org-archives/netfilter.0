From: James Sneeringer <james+netfilter@vincentsystems.com>
Subject: Re: Odd date field in netfilter logs
Date: Thu, 29 Jul 2004 12:57:13 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040729175713.GB20822@valjean.si.ocslink.com>
References: <20040728162156.59559.qmail@web14204.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20040728162156.59559.qmail@web14204.mail.yahoo.com>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Wed, Jul 28, 2004 at 09:21:56AM -0700, John Desmond wrote:
> Here's a sample:
> 
> Jul 27 11:50:56 firewall Shorewall:net2all:DROP:
> IN=ppp0 OUT= MAC= SRC=219.150.118.21 DST=138.88.147.32
> LEN=1147 TOS=00 PREC=0x00 TTL=107 ID=60031 CE
> PROTO=UDP SPT=15008 DPT=1026 LEN=1127
> Dec 31 19:00:00 firewall Shorewall:all2all:REJECT: IN=
> OUT=eth1 MAC= SRC=192.168.1.254 DST=192.168.1.185
> LEN=331 TOS=00 PREC=0x00 TTL=64 ID=46672 CE DF
> PROTO=UDP SPT=67 DPT=68 LEN=311
> Dec 31 19:00:00 firewall Shorewall:all2all:REJECT: IN=
> OUT=eth1 MAC= SRC=192.168.1.254 DST=192.168.1.185
> LEN=331 TOS=00 PREC=0x00 TTL=64 ID=34851 CE DF
> PROTO=UDP SPT=67 DPT=68 LEN=311
> Jul 27 12:01:16 firewall Shorewall:net2all:DROP:
> IN=ppp0 OUT= MAC= SRC=218.78.209.68 DST=138.88.147.32
> LEN=1108 TOS=00 PREC=0x00 TTL=108 ID=48679 CE
> PROTO=UDP SPT=18585 DPT=1026 LEN=1088
> 
> It seems to happen only in REJECTs. Could this
> possibly be caused by a misconficuration? a bad
> iptable statement?

No, because syslog generates the timestamps.  Was there a reboot
between Jul 27 11:50:56 and Jul 27 12:01:16?  Assuming your platform
is x86, if your BIOS is goofy, it might not be setting the clock
properly.  If you start your iptables script before other services
(like I do), it could be starting before your time sync software
(NTP, timed, whatever) has a chance to correct the clock.

I notice this on occasion with my 486 firewall.  The CMOS battery is
dying, and sometimes if it's left powered off it resets the clock (in
my case, to 01 Jan 1980 00:00:00), so I end up with incorrect
timestamps until NTP catches up.

Just a guess.

-James


