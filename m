From: Martin Skarda <skarda@uni-freiburg.de>
Subject: Re: DHCP-Daemon bypasses Linux iptables
Date: Mon, 24 Apr 2006 14:59:29 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0604241456050.12862@persil.ruf.uni-freiburg.de>
References: <20060420114214.85156.qmail@web51410.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060420114214.85156.qmail@web51410.mail.yahoo.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Joerg Pommnitz <pommnitz@yahoo.com>
Cc: netfilter@lists.netfilter.org

Hi Joerg,

you could try to bind your dhcpd on a pseudo bridge interface and filter 
with ebtables. The syntax is quite the same as the usage of iptables...

kind ragards,
    Martin


On Thu, 20 Apr 2006, Joerg Pommnitz wrote:

> Hello all,
> I was seriously puzzled why iptables could not stop dhcp requests from reaching ISC dhcpd. Now I found the reason: instead of listening on a UDP socket dhcpd installs a LPF similar to tcpdump or ethereal. This bypasses the protection from the firewall. What can I do to regain that protection?
>
> --  Regards
>       Joerg
>
>
>
>
>
>

