From: "zhaoyao" <zhaoyao@harbournetworks.com>
Subject: I mean that in kernel code: init_conntrack
Date: Sun, 4 Jan 2004 11:11:5 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E1Acyd9-0004vK-8U@vishnu.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-2022-jp"
To: netfilter@lists.netfilter.org, netfilter@lists.netfilter.org

netfilter=A3=AC=C4=FA=BA=C3=A3=A1
    multicast code and broadcast check has been removed. 
    So i want to know whether bc and mc will create conntrack?


Another question:
    kernel/net/ipv4/netfilter/ip_conntrack_core.c:
    init_conntrack:

    if (ip_conntrack_max &&
      atomic_read (&ip_conntrack_count) >=3D ip_conntrack_max)
    {
    }

    if it is smp, i think it can't protect ip_conntrack_count,=
 some condition it will be larger than ip_conntrack_max.
=09

=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=D6=C2
=C0=F1=A3=A1
 =09=09=09=09

=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1zhaoyao
=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1zhaoyao@harbournetworks.com
=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A12004-01-04



