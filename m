From: "Wlodzimierz Lipert" <wlodzimierz.lipert@gmail.com>
Subject: Connection freeze while downloading
Date: Tue, 11 Sep 2007 23:54:25 +0200
Message-ID: <3a33c03b0709111454q3b8fb197q3294e9ba801ad79a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
	bh=Ua8QVAgbuMk4GQV0NkZaqWMoW1gX04yxAiaPWTaGcKM=;
	b=or7AzSo9E7smCVvE3OyVgFRZwMUdIRZhdK0ae+z3DZeYkzQb2ICiBDgjlVPl+G/UKi7Ie4srjBoaSOaweOUmOtKCVxPiTwavDBN4X2wDGBjtgTODEdFDyNSqoUaS207F3EkFyc2DAd8UMIZV/3auJ8B/oUok0lqsnpuQta9p+dY=
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
To: netfilter@lists.netfilter.org

Hi.

I have problem in following scenario:

3 routers A, B, C:

router A:

eth0--> DSL ( public IP )
eth1 --> 192.168.0.1 ( local network )

routing table A:

83.x.x.x/29 dev eth0  proto kernel  scope link  src 83.x.x.x
192.168.5.0/24 via 192.168.0.8 dev eth1
192.168.4.0/24 via 192.168.0.8 dev eth1
192.168.3.0/24 via 192.168.0.8 dev eth1
192.168.2.0/24 via 192.168.0.8 dev eth1
192.168.1.0/24 via 192.168.0.8 dev eth1
192.168.0.0/24 dev eth1  proto kernel  scope link  src 192.168.0.1
127.0.0.0/8 dev lo  scope link
default via 83.x.x.x dev eth0

router B:

eth0 --> 192.168.0.8 ( direct RJ45 connection to router A )
ath0 --> 192.168.3.1 ( wireless AP -- only for bridging with router C ).
ath1 --> 192.168.1.1 ( wireless AP, for clients )
ath2 --> 192.168.2.1 ( wireless AP, for clients )

routing table B:

192.168.5.0/24 via 192.168.3.2 dev ath0
192.168.4.0/24 via 192.168.3.2 dev ath0
192.168.3.0/24 dev ath0  proto kernel  scope link  src 192.168.3.1
192.168.2.0/24 dev ath1  proto kernel  scope link  src 192.168.2.1
192.168.1.0/24 dev ath2  proto kernel  scope link  src 192.168.1.1
192.168.0.0/24 dev eth0  proto kernel  scope link  src 192.168.0.8
127.0.0.0/8 dev lo  scope link
default via 192.168.0.1 dev eth0


router C:

eth0 --> 192.168.5.1 ( RJ45 connection for clients )
ath0 --> 192.168.3.2 ( wireless STATION -- bridges with router B )
ath1 --> 192.168.4.1 ( wireless AP, for clients )

routing table C:

192.168.5.0/24 dev eth0  proto kernel  scope link  src 192.168.5.1
192.168.4.0/24 dev ath1  proto kernel  scope link  src 192.168.4.1
192.168.3.0/24 dev ath0  proto kernel  scope link  src 192.168.3.2
192.168.0.0/24 via 192.168.3.1 dev ath0
127.0.0.0/8 dev lo  scope link
default via 192.168.3.1 dev ath0


THE PROBLEM:

On first look all is fine but when I try to download
http://the.earth.li/~sgtatham/putty/latest/x86/putty.exe
on router C, connection freezes after receiving some kilobytes (
random ). The same file is downloadble
on router A and B with no problems.
This link http://kernel.org/pub/linux/kernel/v2.6/linux-2.6.22.6.tar.bz2
and many others
are downloadble on on all routers A, B,C with no problem.
It seems that some files freeze connection when sources by router C,
but on A and B
cause no problems.

Example of conn. freeze:

baator ~ # wget http://the.earth.li/~sgtatham/putty/latest/x86/putty.exe
--11:25:32--  http://the.earth.li/~sgtatham/putty/latest/x86/putty.exe
           => `putty.exe'
Resolving the.earth.li... 193.201.200.66
Connecting to the.earth.li|193.201.200.66|:80... connected.
HTTP request sent, awaiting response... 302 Found
Location: http://the.earth.li/~sgtatham/putty/0.60/x86/putty.exe [following]
--11:25:32--  http://the.earth.li/~sgtatham/putty/0.60/x86/putty.exe
           => `putty.exe'
Reusing existing connection to the.earth.li:80.
HTTP request sent, awaiting response... 200 OK
Length: 454,656 (444K) [application/x-msdos-program]

20% [=================>
                       ] 93,775        --.--K/s    ETA 00:47


Any Ideas?
Thanks.

-- 
Pozdrawiam. Wlodzimierz Lipert

