From: Frank Gruellich <frank@der-frank.org>
Subject: Re: What about these packets?
Date: Sat, 29 Jan 2005 08:55:27 +0100
Message-ID: <20050129075527.GI18279@der-frank.org>
References: <1106965785.21043.4.camel@croaker>
	<1106966592.4592.5.camel@hubcap.ljm.dom>
	<1106967050.21043.7.camel@croaker>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1106967050.21043.7.camel@croaker>
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

* Mohammad Khan <mkhan@lextranet.com> 28. Jan 05:
> On Fri, 2005-01-28 at 21:43 -0500, Jason Opperisano wrote:
> > On Fri, 2005-01-28 at 21:29, Mohammad Khan wrote:
> > > two rules in my INPUT chains are:
> > > -A INPUT -s 63.110.21.51 -m state --state NEW -j LOG --log-prefix
> > > "PLAYNC_NEW " --log-level debug
> > > -A INPUT -s 63.110.21.51 -m state --state NEW -j DROP
> > > 
> > > My router is keeping the following logs
> > > [snip udp logs]
> > > 
> > > What can I say about these packets?
> > judging from the destination UDP ports and the TTL--i would say that
> > they are traceroute packets.
> my log file is full of this shit.

So, why are you logging it?  It's just the normal white noise of
ordinary Internet traffic.  Nothing to care about.

> Are they doing traceroute for all the day long??

Maybe you should tell them to go away instead of remain silent.
(Replace the -j DROP with a -j REJECT --reject-with
icmp-port-unreachable.)

HTH,
 regards, Frank.
-- 
,------------------------.------------------------.--------------------.
| Chemnitzer Linux-Tage  | "Linux loves desktops" ' team@linux-tage.de |
| March, 5th + 6th, 2005 |       http://chemnitzer.linux-tage.de/      |
'------------------------'---------------------------------------------'

