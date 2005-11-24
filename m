From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Why would certain packets not reach nat PREROUTING chain?
Date: Thu, 24 Nov 2005 12:00:17 +0100 (CET)
Message-ID: <Pine.LNX.4.58.0511241155311.20155@blackhole.kfki.hu>
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
	<Pine.LNX.4.58.0511181144430.11854@blackhole.kfki.hu>
	<437EA014.1060908@rosi-kessel.org>
	<Pine.LNX.4.58.0511192128300.13915@blackhole.kfki.hu>
	<4380B04C.3090204@rosi-kessel.org>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4380B04C.3090204@rosi-kessel.org>
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

On Sun, 20 Nov 2005, Adam Rosi-Kessel wrote:

> >> So are there no diagnostics, absent rebuilding with netfilters debugging on,
> >> for tracing a packet in between mangle PREROUTING and nat PREROUTING?
> > Without further aid, no.
>
> Okay, so I've rebuilt 2.6.8 with NETFILTER_DEBUG=Y. What would be the next
> step? From what I can tell, NETFILTER_DEBUG isn't something turned on and
> off in /proc/net or /proc/sys/net, it just is "on," but I'm not quite sure
> what sort of debug messages we should be trying to get and how.

You should get debug messages logged with the 'kernel' syslog facility.
Look at /var/log/kern.log.

I'm going to try to emulate your problem with nfsim using your setup and
the tcpdump results. Probably that can help.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

