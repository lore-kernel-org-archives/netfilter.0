From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: How to control DF in iptables
Date: Thu, 20 Nov 2003 21:49:29 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311202149.hAKLnY723645@onyx.rockstone.co.uk>
References: <3FB95C06.7090606@tigry.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3FB95C06.7090606@tigry.net>
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
To: netfilter@lists.netfilter.org

On Monday 17 November 2003 11:38 pm, Andrey Tverdokhleb wrote:

> Hi all!
>
> Is there way to enable fragmentation on per-interface or per-IP or
> per-Whatever basis?
> I don't want to disable DF globally in ip_no_pmtu_disc, but I want some
> packets forwarded
> without DF and fragmented if needed.

The mangle table in postrouting might do what you need (only a guess)?

Antony

-- 

Programming is a Dark Art, and it will always be. The programmer is fighting 
against the two most destructive forces in the universe: entropy and human 
stupidity. They're not things you can always overcome with a "methodology" or 
on a schedule.

 - Damian Conway, Perl God
                                                     Please reply to the list;
                                                           please don't CC me.

