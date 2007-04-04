From: "David Wu" <davidwu@arcturusnetworks.com>
Subject: ipt_error_target in kernel difers from that in user space and
	causing "ip_tables: ERROR target: invalid size 30 != 32"
Date: Wed, 04 Apr 2007 15:32:54 -0400
Message-ID: <op.tp9xw4v1qigx4y@frio.arcturusnetworks.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; format="flowed"; delsp="yes"; charset="us-ascii"
To: netfilter@lists.netfilter.org
Cc: Michael Durrant <mdurrant@arcturusnetworks.com>

Hello all,

I came across this problem when runing iptables-1.3.7 on 2.6.19 and 2.6.2=
0 =20
kernel(MCF5329):
    ip_tables: ERROR target: invalid size 30 !=3D 32
which comes from:
         xt_check_target() (net/netfilter/x_tables.c)

         if (XT_ALIGN(target->targetsize) !=3D size) {
                 printk("%s_tables: %s target: invalid size %Zu !=3D %u\n=
",
                        xt_prefix[family], target->name,
                        XT_ALIGN(target->targetsize), size);
                 return -EINVAL;
         }

I noticed that in libiptc/libiptc.c(iptables-1.3.7) ipt_error_target is =20
defined as:
    struct ipt_error_target
    {
         STRUCT_ENTRY_TARGET t;
         char error[TABLE_MAXNAMELEN];
    };

while in the kernel it defined as:
    struct ipt_error_target
    {
         struct ipt_entry_target target;
         char errorname[IPT_FUNCTION_MAXNAMELEN];
    };

in net/ipv4/netfilter/ip_tables.c there is another:
    static struct ipt_target ipt_error_target =3D {
         .name           =3D IPT_ERROR_TARGET,
         .target         =3D ipt_error,
         .targetsize     =3D IPT_FUNCTION_MAXNAMELEN,
         .family         =3D AF_INET,
    };

TABLE_MAXNAMELEN and IPT_FUNCTION_MAXNAMELEN are not equal!!!

Is this a bug? Who can tell me which one is correct?

thanks,

--=20
David
davidwu@arcturusnetworks.com

