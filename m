From: Julian Gomez <julianjose.gomez@getronics.com>
Subject: Re: routing mail on a different gateway
Date: Fri, 23 Jul 2004 16:34:55 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040723083455.GC7773@jgomez-p-latitude.asia.unity>
References: <4100CB67.5060507@tri-oxyde.org>
Reply-To: julianjose.gomez@getronics.com
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <4100CB67.5060507@tri-oxyde.org>
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

On Fri, Jul 23, 2004 at 10:25:11AM +0200, Julien spoke thusly:

>Good Morning,
>
>I have a linux box with two dsl modems on it (connection is done via
>pppoe), I'm trying to route default traffic on the primary connection
>(ppp0) and mail traffic on another one (ppp1).
>
>This traffic should be able to come from the localhost or the lan via
>NAT.
>
>I run Slackware 9.1 (Kernel 2.4.22), recompiled with necessary options
>for using iproute2.

Okay. Do you have corresponding OUTPUT / FORWARD rules defined?

