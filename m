From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: RE: help needed: clogged console
Date: Tue, 6 Jan 2004 10:13:57 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0401061009000.16590-100000@blackhole.kfki.hu>
References: <1073353325.3044.1.camel@jasiiitosh.nexusmgmt.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1073353325.3044.1.camel@jasiiitosh.nexusmgmt.com>
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
To: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Cc: bmcdowell@coxhealthplans.com, orlowscy@hotpop.com, shrike-list@redhat.com, redhat-list@redhat.com, netfilter@lists.netfilter.org

On Mon, 5 Jan 2004, John A. Sullivan III wrote:

> > echo 0 > /proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_log_invalid
>
> Thanks.  Would you kindly confirm the /proc file.  I do not see
> ip_conntrack_tcp_log_invalid.  I see ip_conntrack_tcp_invalid_scale and
> ip_conntrack_tcp_log_out_of_window - John

You use an old version of the tcp-window-tracking patch.

ip_conntrack_tcp_log_invalid_scale and ip_conntrack_tcp_log_out_of_window
were integrated into the single ip_conntrack_tcp_log_invalid (besides
bugfixes and robustness improvements in the new release).

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary


