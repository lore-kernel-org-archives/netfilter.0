From: william@dynamicnetservices.com
Subject: recent module  --hitcount problem
Date: Mon, 13 Feb 2006 18:49:37 -0500 (EST)
Message-ID: <2730.209.161.217.209.1139874577.squirrel@dynamicnetservices.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>



> Hi,
>
> Is there anything wrong with these commands?.  It seems that the recent
> module (0.3.1) is not considering  the '--hitcount 10' attribute if the
> machine is running for a long time (in the long run).  But when I tested
> these rules from another machine, it worked properly.  But on the live
> server, iptables blocks hosts if they attempted to access the SMTP port
> within 60 seconds for a second time.
>
> $IPT -A SMTP_HAMMER -j LOG --log-level debug
> $IPT -A SMTP_HAMMER -m recent --set --name hammer -j DROP
>
> $IPT -A CHECK_SMTP    -m recent     --rcheck --seconds 480 --name hammer
>     -j DROP
> $IPT -A CHECK_SMTP    -m recent     --rcheck --seconds 60  --hitcount
> 10     -j SMTP_HAMMER
> $IPT -A CHECK_SMTP    -m recent     --update
>            -j ACCEPT
> $IPT -A CHECK_SMTP    -m recent     --set
>           -j ACCEPT
>
>
> $IPT -A INPUT -i $WAN_IFACE    -p tcp --dport 25 -m state --state NEW
>     -j CHECK_SMTP
>
>
> --
>
> Thanks
> Sudheer


The recent module is broken.  For more details see:
http://blog.blackdown.de/2005/05/09/fixing-the-ipt_recent-netfilter-module/






