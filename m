From: Radien Radien <radien@gmail.com>
Subject: Re: Help! problem with PPTPD and pptp nat helper
Date: Sun, 16 Jan 2005 08:55:37 +0330
Message-ID: <4a0a384e05011521252bd3fe1@mail.gmail.com>
References: <27594E8BA9D5CA458F5EF87D88B6B48F0198C6@pxtvjoexd01.pxt.primeexalia.com>
Reply-To: Radien Radien <radien@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <27594E8BA9D5CA458F5EF87D88B6B48F0198C6@pxtvjoexd01.pxt.primeexalia.com>
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

Dear Gary

  No it is solved yet. I'm just very busy with my works and could not
spend alot of time on this issue so I prefered to complete other works
and then comeback with more time to spend on PoPToP and ip_nat_pptp
incompatibility problem.

  I also sent an email to the athor of the p-o-m module of
conntrack_pptp, but no responses yet.

Best Regards
Radien

On Wed, 12 Jan 2005 22:41:06 -0800, Gary W. Smith <gary@primeexalia.com> wrote:
> Did you ever resolve this?  It has started to fail and I can't keep the
> tunnel open properly when our remote clients are in the office.
> 
> Gary Wayne Smith
> 
> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org
> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Radien
> Radien
> Sent: Sunday, December 26, 2004 4:16 AM
> To: netfilter@lists.netfilter.org
> Subject: Help! problem with PPTPD and pptp nat helper
> 
> But based on netfilter pom-ng documentation its needed for NAT working
> properly
> 
> http://www.netfilter.org/patch-o-matic/pom-extra.html#pom-extra-pptp-con
> ntrack-nat
> 
> I have great successfull experiment using these 4 p-o-m modules, they
> work perfect in my cases multiple session for DNAT and SNAT even both
> at the same time. But when the last one is loaded part of pptpd(when
> uses pppd) cannot negotiate using LCP, it seems so in logfiles. And if
> I unload it, pptpd works fine!!
> 
> #This adds CONFIG_IP_NF_PPTP:
> #Connection tracking and NAT support for PPTP.  Using this, you can
> track
> #PPTP/GRE connections and do SNAT/DNAT.  You have to load the following
> modules
> #for connection tracking:
> #       ip_conntrack_proto_gre
> #       ip_conntrack_pptp
> #for NAT:
> #       ip_nat_proto_gre
> #       ip_nat_pptp
> #
> 
> It seems to be a conflict of using ppp, with ip_nat_pptp module and
> pptpd.
> 
> ------------------------------------------------------------------------
> -------------------------------
> 
> >trying to connect to a server which is itself behind a router and NAT'd
> 
> You mentioned that you applied the conntrack patch.  Did you do this on
> both the firewalls?  I have had success with the following.  Note that I
> have disabled ip_nat_pptp.  If I load ip_nat_pptp then only one person
> can connect and on the first time only.  Subsequent attempts fail.  I
> have asked but received no feedback on this as well.  But hopefully this
> will help you as well.
> 
> Anyways, here's what I run and the order that I run them in.  The
> firewall currently has two active incoming connections I did test
> multiple outgoing connections when I configured it.
> 
> /etc/rc.d/rc.local:
> /sbin/modprobe ip_conntrack_proto_gre
> /sbin/modprobe ip_conntrack_pptp
> /sbin/modprobe ip_nat_proto_gre
> #/sbin/modprobe ip_nat_pptp
> /sbin/modprobe ip_conntrack_irc
> /sbin/modprobe ip_nat_irc
> /sbin/modprobe ip_conntrack_ftp
> /sbin/modprobe ip_nat_ftp
> /sbin/modprobe ip_conntrack_mms
> /sbin/modprobe ip_nat_mms
> /sbin/modprobe ipt_LOG
> /sbin/modprobe ipt_TARPIT
> /sbin/modprobe ip_gre
> /sbin/modprobe ipt_MASQUERADE
> /sbin/modprobe ip_conntrack
> /sbin/modprobe iptable_nat
> Gary Smith
> 
> 


-- 
__ Radien__

