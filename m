From: aksingh@hss.hns.com
Subject: Re: ipq_read timeout
Date: Thu, 20 May 2004 08:17:06 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OF7590A685.8176A82D-ON65256E9A.000E5E1F@hss.hns.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; 
	Boundary="0__=EABBE409DF9DD88F8f9e8a93df938690918cEABBE409DF9DD88F"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Sven Schuster <schuster.sven@gmx.de>
Cc: "Jee J.Z." <jz105@york.ac.uk>, netfilter@lists.netfilter.org

--0__=EABBE409DF9DD88F8f9e8a93df938690918cEABBE409DF9DD88F
Content-type: text/plain; charset=US-ASCII





HI Sven,

   Well 1.2.1 was on a different system , that had linux 2.4.2, ip_tables
1.2.7a was on a system that has 2.4.20-8. Ok fine, that means I got it
terribly wrong ;-) . So iptables.o is the object file I get after compiling
iptables.c from source. And after every make, make install the kernel
module ip_tables.o is automatically put in the directory
/lib/modules/2.x.x/kernel/net/ipv4/netfilter/ip_tables.o. This happens even
if I had a different ip_tables version installed earlier ? i.e the earlier
version is overwritten ?. Also, the reason why I got this doubt is :
1) I erased the ip_tables rpm after I installed from source
2) ls -la on /lib/modules/2.x.x/kernel/net/ipv4/netfilter/ip_tables.o shows
me march 14, whereas for all object files in the source directory where I
untarred the iptables 1.2.9 source show me may 19th  i.e yesterday. So is
this kernel module not made while doing a make ?

thanks
Amit




Sven Schuster <schuster.sven@gmx.de> on 05/19/2004 08:33:27 PM

To:    Amit Kumar Singh/HSS@HSS
cc:    "Jee J.Z." <jz105@york.ac.uk>, netfilter@lists.netfilter.org

Subject:    Re: ipq_read timeout



Hi Amit,

On Wed, May 19, 2004 at 07:24:50PM +0530, aksingh@hss.hns.com told us:
>
> Hi,
>
>      I installed iptables 1.2.9 from source, now if i do an lsmod i get
the
> module loaded as ip_tables.o but I suspect this is the ip_tables.o of
> iptables 1.2.7a which I had before(I removed iptables 1.2.7 package using
> rpm -e iptables), I have one iptables.o in the directory in which
> iptables1.2.9 src is installed but when i do insmod iptables.o it says :

you're confusing two things here: ip_tables.o is the iptables kernel
module whereas iptables.o is one of the object files created when
building the new iptables binary which you then execute in user land
to add/change rules.
The userspace part should be pretty independent from your kernel version.
In your last mail you told that you had installed iptables 1.2.1, now
you're writing your old version 1.2.7a. If your old version really was
1.2.1 and your kernel is as old as the iptables version, you probably
want to upgrade your kernel first :)

>
> iptables.o : can't find the kernel version this module was compiled for.
>

This happens when you try to insert an object file used for linking
your iptables binary into the kernel. Won't work :) the ip_tables.o
which is shown with lsmod should be quite ok for your running
kernel.


Sven

> So what should I do to correct this ?
>
> thanks
> Amit
>



--
Linux zion 2.6.6-tcp #4 Thu May 13 20:39:05 CEST 2004 i686 athlon i386
GNU/Linux
  16:57:13  up 5 days, 18:59,  1 user,  load average: 0.03, 0.11, 0.09


--0__=EABBE409DF9DD88F8f9e8a93df938690918cEABBE409DF9DD88F
Content-type: application/octet-stream; 
	name="C.DTF"
Content-Disposition: attachment; filename="C.DTF"
Content-transfer-encoding: base64

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0NClZlcnNpb246IEdudVBHIHYxLjIuMSAoR05V
L0xpbnV4KQ0KDQppRDhEQlFGQXEzYytvNEZBZEIyUG5lUVJBaVJmQUo0M3czTUVHRlNwaENSVDJ4
QWRxRi9XRFlBOUhBQ2VONGI1DQovaHVOUG9tRlJuaXdkN3ZLTUlGT0JrUT0NCj1nYVQ4DQotLS0t
LUVORCBQR1AgU0lHTkFUVVJFLS0tLS0NCg0K

--0__=EABBE409DF9DD88F8f9e8a93df938690918cEABBE409DF9DD88F--


