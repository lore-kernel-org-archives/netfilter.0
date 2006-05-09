From: Marius-Iulian Corici <marius-Iulian.corici@fokus.fraunhofer.de>
Subject: Re: SIP connection tracking
Date: Tue, 9 May 2006 08:00:08 +0200
Message-ID: <200605090800.08768.mco@fokus.fraunhofer.de>
References: <20060509053701.45562.qmail@web34211.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060509053701.45562.qmail@web34211.mail.mud.yahoo.com>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

Only the SIP (signaling traffic) or also the voice traffic (RTP traffic - you 
can see it with tcpdump)?
Take a short look at the priotitization in OpenWRT distribution.
It prioritizes on some "a little" bit different criteria.
Anyway, usually the SIP is udp

Marius

On Tuesday 09 May 2006 07:37, Sagara Wijetunga wrote:

> Hi all
>
> I'm trying to prioritize the out going SIP related
> traffic from my desktop computer.
>
> I tried:
>
> iptables -t mangle -A POSTROUTING \
> -m helper --helper sip -m state --state
> ESTABLISHED,RELATED \
> -j ...
>
> It simply doesn't detect SIP related traffic!
>
> I'm using Linux kernel 2.6.11.9, iptables 1.3.5 and
> sip-conntrack-nat from patch-o-matic-ng-20060502.
>
> I have enabled the Mangling, SIP support in the kernel
> (as built-in, not as a module).
>
> Have I missed something? any ideas?
>
> Thanks
>
> Kind regards
> Sagara
>
>
>
> __________________________________________________
> Do You Yahoo!?
> Tired of spam?  Yahoo! Mail has the best spam protection around
> http://mail.yahoo.com

-- 
Dipl. Eng. Marius-Iulian Corici
FOKUS/NGNI
We are changing the world because God helped us hack His source code ...

