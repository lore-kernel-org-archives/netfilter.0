From: William Stearns <wstearns@pobox.com>
Subject: Re: ULOG:  invalid argument
Date: Thu, 19 Feb 2004 13:38:29 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0402191333590.3252-100000@sparrow>
References: <LAW12-F18Uhyx9w8OjU000276ef@hotmail.com>
Reply-To: William Stearns <wstearns@pobox.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <LAW12-F18Uhyx9w8OjU000276ef@hotmail.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "T. Take" <t_takejp@hotmail.com>
Cc: netfilter@lists.netfilter.org

Good morning, T.,

On Thu, 19 Feb 2004, T. Take wrote:

> I cannot use "ULOG".
> 
> #iptables -A INPUT -i $OUTER_PORT -s $INNER_IP -j ULOG --ulog-nlgroup 32 
> --ulog-prefix "spoofed packet "
> #iptables: Invalid argument
> 
> Although I updated iptables to version 1.2.9 and installed ulogd by apt-get 
> install (Debian),  I have not used ULOG yet. And there is ipt_ULOG.o in 
> "/lib/modules/2.4.24/kernel/net/ipv4/netfilter".
> 
> Did you have the same problem about ULOG?
> I hope your advises.

	The command you're using would normally be run from a script.  
Would you please check the values of $OUTER_PORT and $INNER_IP and make 
sure they're valid?
	The rest looks good, assuming your kernel and iptables binary have
ULOG support.
	Cheers,
	- Bill

---------------------------------------------------------------------------
	"As a computer I find your faith in technology amusing."
(Courtesy of Gerhard Mack <gmack@imag.net>)
--------------------------------------------------------------------------
William Stearns (wstearns@pobox.com).  Mason, Buildkernel, freedups, p0f,
rsync-backup, ssh-keyinstall, dns-check, more at:   http://www.stearns.org
--------------------------------------------------------------------------


