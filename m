From: Dave Strydom <strydom.dave@gmail.com>
Subject: Re: ftp conntrack - nat problem
Date: Wed, 9 Nov 2005 16:06:38 +0200
Message-ID: <fc38b710511090606i74c40337t656c68a436c5335e@mail.gmail.com>
References: <fc38b710511072303w6144c3a7i3068e781c871799d@mail.gmail.com>
	<200511081336.51769.rob0@gmx.co.uk>
	<fc38b710511090331r6c6943faw875965864a056f21@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <fc38b710511090331r6c6943faw875965864a056f21@mail.gmail.com>
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
Cc: netfilter@lists.netfilter.org

Ok, I have just compiled a new kernel on this box, and compiled all
iptables things as modules... same problem... I have also removed all
PAX and GRsecurity stuff just to write those out of the equation.

-----------------------------------------
Calypso firewall # lsmod
Module                  Size  Used by
iptable_filter          3200  1
ipt_MARK                2688  0
ipt_NETMAP              2432  0
iptable_mangle          3072  0
ipt_ttl                 2176  0
ipt_tos                 1792  0
ipt_tcpmss              2560  0
ipt_state               2176  4
ipt_geoip               4356  0
ipt_conntrack           2688  0
ipt_connmark            1920  0
ipt_SAME                2944  0
ipt_LOG                 7424  0
ipt_CONNMARK            2432  0
ipt_REJECT              6784  0
ipt_MASQUERADE          4744  1
ip_nat_snmp_basic      11908  0
ip_nat_ftp              3328  0
iptable_nat            26460  5 ipt_NETMAP,ipt_SAME,ipt_MASQUERADE,ip_nat_f=
tp
ip_queue               11800  0
ip_tables              25600  17
iptable_filter,ipt_MARK,ipt_NETMAP,iptable_mangle,ipt_ttl,ipt_tos,ipt_tcpms=
s,ipt_state,ipt_geoip,ipt_conntrack,ipt_connmark,ipt_SAME,ipt_LOG,ipt_CONNM=
ARK,ipt_REJECT,ipt_MASQUERADE,iptable_nat
ip_conntrack_ftp       73488  1 ip_nat_ftp
ip_conntrack           54592  7
ipt_state,ipt_conntrack,ipt_MASQUERADE,ip_nat_snmp_basic,ip_nat_ftp,iptable=
_nat,ip_conntrack_ftp
Calypso firewall #

-----------------------------------------

I'm at a serious loss here, i dont know what else to do :(

Dave

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D

On 11/9/05, Dave Strydom <strydom.dave@gmail.com> wrote:
> Ok, I have setup a test setup which is doing the same thing, here is
> the output of my iptables-save:
>
>

