From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Simple newbie's question
Date: Tue, 17 Feb 2004 10:15:41 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200402171015.41636.Antony@Soft-Solutions.co.uk>
References: <004c01c3f53e$845bebe0$2d64a8c0@pcjka>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <004c01c3f53e$845bebe0$2d64a8c0@pcjka>
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
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

On Tuesday 17 February 2004 10:12 am, Jan Kaastrup wrote:

> Hi list
> After a reboot of my RedHat mashine, the NAT part of Iptables stop
> working.
>
> I get: "iptables: Invalid argument" when using snat.
>
> My snat rule look like this:
> $IPTABLES -t nat -A POSTROUTING -o $EXT_INT -j SNAT --to-source $EXT_IP

Are you sure that $EXT_INT and $EXT_IP are defined?

> I have made all netfilter stuff as modules.

I don't use modules, so I'm not the best person to look at this list and say 
if it appears to be sufficient for what you are doing - can anyone else help 
here?

> #lsmod
> ip_conntrack_irc        4336   1  (autoclean)
> ip_nat_irc              3440   0  (unused)
> ip_conntrack_ftp        5520   1  (autoclean)
> ip_nat_ftp              4240   0  (unused)
> ipt_ah                  1080   0  (unused)
> ipt_esp                 1112   0  (unused)
> iptable_nat            22040   2  [ip_nat_irc ip_nat_ftp]
> ppp_mppe               24088   0  (autoclean)
> bsd_comp                5464   0  (autoclean)
> ppp_async               9440   0  (autoclean)
> ppp_generic            24508   0  (autoclean) [ppp_mppe bsd_comp
> ppp_async]
> slhc                    6740   0  (autoclean) [ppp_generic]
> ipt_LOG                 4152   1  (autoclean)
> ipt_REJECT              4024   1  (autoclean)
> ipt_state               1048   5  (autoclean)
> iptable_mangle          2776   0  (autoclean) (unused)
> ip_conntrack           28296   4  (autoclean) [ip_conntrack_irc
> ip_nat_irc ip_conntrack_ftp ip_nat_ftp iptable_nat ipt_state]
> iptable_filter          2412   1  (autoclean)
> ip_tables              14872  10  [ipt_ah ipt_esp iptable_nat ipt_LOG
> ipt_REJECT ipt_state iptable_mangle iptable_filter]
>
> Any hints???
>
> I have tried to recompile iptables - but nothing seems to work - I know
> it did before the reboot.
> Only thing that has been changed is a static route being enabled, but
> this shouldn't make iptables complain:(

Regards,

Antony.

-- 
You can spend the whole of your life trying to be popular,
but at the end of the day the size of the crowd at your funeral
will be largely dictated by the weather.

 - Frank Skinner

                                                     Please reply to the list;
                                                           please don't CC me.


