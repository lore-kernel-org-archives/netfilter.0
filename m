From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: ntpdate works; ntpd doesn't
Date: Fri, 2 Apr 2004 21:04:39 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404022104.39456.Antony@Soft-Solutions.co.uk>
References: <200404021950.i32JoiCO012686@osprey.tkevans.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200404021950.i32JoiCO012686@osprey.tkevans.com>
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

On Friday 02 April 2004 8:50 pm, Tim Evans wrote:

> I can manually set the time on my system with ntpdate:
>
> # ntpdate time.nist.gov
>  2 Apr 14:38:16 ntpdate[16583]: step time server 192.43.244.18 offset
> -48.173770 sec
>
> However, once I start ntpd, it never adjusts the time.

I believe ntpd uses the "time" protocol on port 37, whereas netdate and 
ntpdate uses "ntp" on port 123.

Regards,

Antony

-- 
Normal people think "If it ain't broke, don't fix it".
Engineers think "If it ain't broke, it doesn't have enough features yet".

                                                     Please reply to the list;
                                                           please don't CC me.


