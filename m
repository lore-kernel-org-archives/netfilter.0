From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Why would certain packets not reach nat PREROUTING chain?
Date: Fri, 18 Nov 2005 12:07:59 +0100 (CET)
Message-ID: <Pine.LNX.4.58.0511181144430.11854@blackhole.kfki.hu>
References: <20051110032733.GA19073@bostoncoop.net>
	<3063e50511100055m41abd50hc3af78a67896db7d@mail.gmail.com>
	<20051114145348.GA12841@bostoncoop.net>
	<Pine.LNX.4.58.0511141559360.1983@blackhole.kfki.hu>
	<4378A8B1.8010206@rosi-kessel.org>
	<Pine.LNX.4.58.0511150855520.4319@blackhole.kfki.hu>
	<4379E61F.5000807@rosi-kessel.org>
	<Pine.LNX.4.58.0511151453480.4373@blackhole.kfki.hu>
	<20051115235319.GA1727@bostoncoop.net>
	<Pine.LNX.4.58.0511160923120.6746@blackhole.kfki.hu>
	<20051118015254.GA21128@bostoncoop.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20051118015254.GA21128@bostoncoop.net>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adam Rosi-Kessel <adam@rosi-kessel.org>
Cc: netfilter@lists.netfilter.org

On Thu, 17 Nov 2005, Adam Rosi-Kessel wrote:

> > > I'm running kernel 2.6.8-2-k7 from Debian Stable, iptables v1.2.11.
> > Try to upgrade to a newer kernel.
>
> I guess I'd do this as a last resort. I'm trying to keep the system in
> question on Debian Stable if possible. Is there reason to think a kernel
> upgrade would just fix it?

Just as a last resort. But the problem is so strange, I can't recall any
patch related to such a behaviour.

> Here are my logs below--showing everything as you suggested. IP and MAC
> addresses are replaced with descriptive names, but otherwise this is
> exactly what appears in my logs.

> # grep 500 /proc/net/ip_conntrack
> udp      17 163 src=LOCAL_CLIENT dst=SERVER sport=500 dport=500 src=SERVER dst=EXTERNAL_IP_OF_NAT_BOX sport=500 dport=500 [ASSURED] use=1
>
> # grep Mangle /var/log/syslog | sed "s/^.*kernel: //g"
>
> Mangle Prerouting:IN=eth1 OUT= MAC=ETH1_MAC SRC=LOCAL_CLIENT DST=SERVER LEN=1584 TOS=0x00 PREC=0x00 TTL=128 ID=50876 PROTO=UDP SPT=500 DPT=500 LEN=1564
>
> Mangle Postrouting:IN= OUT=eth0 SRC=LOCAL_CLIENT DST=SERVER LEN=1500 TOS=0x00 PREC=0x00 TTL=127 ID=50876 MF PROTO=UDP SPT=500 DPT=500 LEN=1564
>
> Mangle Prerouting:IN=eth0 OUT= MAC=ETH0_MAC SRC=SERVER DST=EXTERNAL_IP_OF_NAT_BOX LEN=2288 TOS=0x00 PREC=0x00 TTL=55 ID=63908 PROTO=UDP SPT=500 DPT=500 LEN=2268

So at least we know the packets are seen by the mangle table. As you tried
previously to match them with the 'INVALID' state and it proved to be
false, they are valid packets according to the conntrack. The filter table
is empty, so we can point our finger to nat alone.

The hard way remained: recompile the kernel with netfilter debugging
enabled. Then repeat the connection attempts with the new kernel booted
up and let's see what shows up in the kernel log.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

