From: Mike D <mdm@optonline.net>
Subject: REMOVE FROM LIST
Date: Fri, 06 Sep 2002 19:02:45 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002901c255f9$836afe00$c7fea8c0@louie>
References: <1031358907.3d7949bb350b0@webmail3.webfluxation.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: Marcel Hauser <marcel_hauser@gmx.ch>, netfilter@lists.netfilter.org


----- Original Message -----
From: "Marcel Hauser" <marcel_hauser@gmx.ch>
To: <netfilter@lists.netfilter.org>
Sent: Friday, September 06, 2002 8:35 PM
Subject: ip_conntrack_ftp and ip_nat_ftp modules unused


> Hi
>
> I'am just wondering:
>
> #lsmod
>
> Module                  Size  Used by
> ipt_REJECT              3200   1  (autoclean)
> ipt_multiport            928   3  (autoclean)
> ipt_LOG                 3696   3  (autoclean)
> ipt_state                832  12  (autoclean)
> ip_nat_irc              2752   0  (autoclean) (unused)
> ip_conntrack_irc        2928   0  (autoclean) (unused)
> ip_nat_ftp              3296   0  (autoclean) (unused)
> iptable_nat            16112   3  (autoclean) [ip_nat_irc ip_nat_ftp]
> ip_conntrack_ftp        3632   0  (autoclean) (unused)
> ip_conntrack           15568   4  (autoclean) [ipt_state ip_nat_irc
> ip_conntrack_irc ip_nat_ftp iptable_nat ip_conntrack_ftp]
> iptable_filter          1936   1  (autoclean)
> ip_tables              11584   8  [ipt_REJECT ipt_multiport ipt_LOG
ipt_state
> iptable_nat iptable_filter]
>
> is it normal that ip_conntrack_ftp and ip_nat_ftp are unused ??
>
> Thanks
>
> Marcel
>
>


