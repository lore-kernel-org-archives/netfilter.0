From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: Geoip patch and its features
Date: Tue, 24 Apr 2007 15:03:06 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0704241501200.2490@yvahk01.tjqt.qr>
References: <1814bfe70704220212w75466abeo663c7349586b6d99@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1814bfe70704220212w75466abeo663c7349586b6d99@mail.gmail.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Elvir Kuric <omasnjak@gmail.com>
Cc: netfilter@lists.netfilter.org


On Apr 22 2007 11:12, Elvir Kuric wrote:
>
> last night I implemented geoip feature in my firewall. Using geoip I
> can protect my firewall from any kind of traffic from particular
> countries ( someone call id racism routing ). I am wondering now if
> use this patch in combination with other iptables features will this
> prevent for example different kind of attacks like dos, unauthorized
> logging and so on.

But geoip won't help with that.

> I know it is impossible to stop all attacks, but we
> can maje their results smaller.  I think geoip is very good in cases
> when you for example know that you are not going to log from  Bosnia
> just simpli put Bosnian's IPs on black list.

In that cast you could just unlock all the IP ranges you will
ever log in from. For me that's like 4 addresses only.
Should you happen to login from vacation, ssh to your frontend box first.


Jan
-- 

