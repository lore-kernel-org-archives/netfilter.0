From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: Accept DNS Suffix
Date: Tue, 20 Mar 2007 17:42:00 +0100 (MET)
Message-ID: <Pine.LNX.4.61.0703201739370.20032@yvahk01.tjqt.qr>
References: <000f01c76a83$f8563dd0$6f05b00a@au.schpac.local>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <000f01c76a83$f8563dd0$6f05b00a@au.schpac.local>
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
To: Dominic Caputo <jec6jec6@gmail.com>
Cc: netfilter@lists.netfilter.org


On Mar 20 2007 11:08, Dominic Caputo wrote:
>
> I currently have an ISP that has multiple address ranges that I
> wish to accept in my iptables ruleset. Is it possible for me to use
> the DNS Suffix instead of the actual ip as they are currently
> dynamically assigned. e.g. iptables -s nsw.bigpond.net.au (current
> assigned address is cpe-203-45-103-100.nsw.bigpond.net.au).

Not possible*. iptables is handling ip, not dns.

> Alternatively if the above is not available would I be able to
> setup a dyndns account and get my dsl modem to update the account
> and within my iptables config set: iptables -s homegw.dynalias.com

See your distro documentation. openSUSE for example accepts custom
scripts in /etc/sysconfig/network/if-up.d with which you can call
iptables after dial-in. Anyway, not really a netfilter issue.


* I refrain from posting possibilities that would end up as Layering
Violations. Also, this would be prone to either (a) deadlock or (b)
slipthrough.


Jan
-- 

