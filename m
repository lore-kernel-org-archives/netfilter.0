From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Memory leaks in ip_conntrack?
Date: Sun, 9 Nov 2003 03:43:49 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311090343.hA93hrj15884@agate.rockstone.co.uk>
References: <EFBADA8C200C2B418DA39734FD15475B0B204A@skat.sky.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <EFBADA8C200C2B418DA39734FD15475B0B204A@skat.sky.com>
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
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

On Sunday 09 November 2003 3:08 am, Kishore Dharmavaram wrote:

> Hi Herald & All,
>
> I verified & I find my 2.4.20 is already patched with UNCONFIRMED
> connections fix.
>
> How it possible that /proc/slabinfo shows a lot more ip_conntracks than are
> shown in "/proc/net/ip_conntrack"?. /proc/slabinfo shows that maximum
> possible conntracks, 131072, are being currently used but
> /proc/net/ip_conntrack  shows only 21 connections. My box is refusing new
> connections because max conntracks have reached.

Are you getting any messages "ip_conntrack : table full, dropping packet" in 
your syslog or kernel log output?

If not, how do you know that the box is refusing new connections because max 
conntracks have been reached?

Antony.

-- 

It suddenly dawns on the observer that there is no end to the creativity that 
these mindless hackers can come up with.

 - Kevin Kelly, Out of Control
                                                     Please reply to the list;
                                                           please don't CC me.

