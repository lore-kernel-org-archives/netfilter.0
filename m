From: aksingh@hss.hns.com
Subject: Re: ipq_read timeout
Date: Wed, 19 May 2004 19:24:50 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OFC79DA874.FBF1FD24-ON65256E99.004B6AA3@hss.hns.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; 
	Boundary="0__=EABBE40ADFD8EC338f9e8a93df938690918cEABBE40ADFD8EC33"
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

--0__=EABBE40ADFD8EC338f9e8a93df938690918cEABBE40ADFD8EC33
Content-type: text/plain; charset=US-ASCII





Hi,

     I installed iptables 1.2.9 from source, now if i do an lsmod i get the
module loaded as ip_tables.o but I suspect this is the ip_tables.o of
iptables 1.2.7a which I had before(I removed iptables 1.2.7 package using
rpm -e iptables), I have one iptables.o in the directory in which
iptables1.2.9 src is installed but when i do insmod iptables.o it says :

iptables.o : can't find the kernel version this module was compiled for.

So what should I do to correct this ?

thanks
Amit





Sven Schuster <schuster.sven@gmx.de>@lists.netfilter.org on 05/19/2004
05:29:49 PM

Sent by:    netfilter-admin@lists.netfilter.org


To:    Amit Kumar Singh/HSS@HSS
cc:    "Jee J.Z." <jz105@york.ac.uk>, netfilter@lists.netfilter.org

Subject:    Re: ipq_read timeout



Hi Amit,

On Wed, May 19, 2004 at 04:49:22PM +0530, aksingh@hss.hns.com told us:
>
> Hi Sven,
>
>    Which version of iptables/libipq do you use. As u said we can define a
> negative timeout value for ipq_read so that it returns immediately. I
have
> iptables-1.2.1a-1.on a system. A man ipq_read there shows me that the
> timeout parameter for ipq_read has not yet been implemented.

your version of iptables seems quite a little outdated. I'm using
version 1.2.9. You really should update your iptables.


Sven

>
> thanks
> Amit
>


--
Linux zion 2.6.6-tcp #4 Thu May 13 20:39:05 CEST 2004 i686 athlon i386
GNU/Linux
  13:57:45  up 5 days, 16:00,  1 user,  load average: 0.02, 0.02, 0.00

--0__=EABBE40ADFD8EC338f9e8a93df938690918cEABBE40ADFD8EC33
Content-type: application/octet-stream; 
	name="C.DTF"
Content-Disposition: attachment; filename="C.DTF"
Content-transfer-encoding: base64

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0NClZlcnNpb246IEdudVBHIHYxLjIuMSAoR05V
L0xpbnV4KQ0KDQppRDhEQlFGQXEwdzFvNEZBZEIyUG5lUVJBdjNPQUo0a01LQUwrR0hlS2lKOVph
d1MrNDdpei9jcXFBQ2RGWThyDQpQbnVORU0wR2tmMUl2c082U1l4Z3ZkST0NCj14TE04DQotLS0t
LUVORCBQR1AgU0lHTkFUVVJFLS0tLS0NCg0K

--0__=EABBE40ADFD8EC338f9e8a93df938690918cEABBE40ADFD8EC33--


