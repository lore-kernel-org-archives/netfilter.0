From: PayalR <rpayal@indiainfo.com>
Subject: Re: iptables : masq
Date: Fri, 14 Jun 2002 17:32:03 +0530
Sender: netfilter-admin@lists.samba.org
Message-ID: <aevm0n$8kg$2@main.gmane.org>
References: <200206131517.01195@.> <200206141017.MAA04989@axpmgr.physik.rwth-aachen.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <200206141017.MAA04989@axpmgr.physik.rwth-aachen.de>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

Hi,
Thanks a lot for the replies. I got it solved thankkkkkkkkkkks a lot to a=
ll=20
of you.
Byeeeee.
-Payal
On Friday 14 June 2002 03:47 pm, you wrote:
> Hi
>
> On Thursday 13 June 2002 11:58, Payal wrote:
> > Hi,
> > As I said earlier I am using Mdk Linux 8.2 with kernel 2.4.18. I
> > am trying to shift from ipchains to iptables for a simple reson
> > that I cannot connect to one particular ftp site where
> > ip_masq_ftp was required in earlier versions of kernel. Now this
> > module is no longer available. So, I have to shift to iptables
> > since connecting to that site is really imp.
> > But I am having a problem. I read briefly NAT and iptables HOWTOs
> > and decided the rule,
> > iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
> >
> > My loaded modules by lsmod include,
> > ipt_MASQUERADE          1504   5  (autoclean)
> > iptable_mangle          2336   0  (autoclean) (unused)
> > iptable_nat            15988   1  (autoclean) [ipt_MASQUERADE]
> > ip_conntrack           15180   1  (autoclean) [ipt_MASQUERADE
> > iptable_nat] iptable_filter          1952   0  (autoclean)
> > ip_tables              11584   6  [ipt_MASQUERADE iptable_mangle
> > iptable_nat iptable_filter]
>
> You will also need the modules ip_conntrack_ftp.o  ip_nat_ftp.o.
> Otherwise you will not succeed in doing active FTP.
>
> greetings
> =09Axel

