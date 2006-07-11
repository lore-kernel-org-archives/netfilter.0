From: Arno van Amersfoort <arnova@eld.physics.leidenuniv.nl>
Subject: Re: TCP connection timeout problem
Date: Tue, 11 Jul 2006 08:25:16 +0200
Message-ID: <44B3444C.3020503@eld.physics.leidenuniv.nl>
References: <44ACDDC3.7080907@eld.physics.leidenuniv.nl>
	<44B1FD6A.6010207@eld.physics.leidenuniv.nl>
	<Pine.LNX.4.58.0607100921490.12586@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.58.0607100921490.12586@blackhole.kfki.hu>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@lists.netfilter.org

I think I already stumbled into this bug in the past, I recall that this 
bug was in 2.6.14.
Anyway, I've tried to disable tcp_sack & tcp_dsack but no luck. I also 
upgraded to 2.6.17.4 but this doesn't help iether :-S I'm also getting 
packets like this for "open ports" (with ie. -p tcp --dport 22 --syn -j 
ACCEPT) giving:

Jul 11 04:02:59 rulhm2 kernel: Stealth scan (PRIV)?: IN=eth0 OUT= 
MAC=00:01:02:05:1d:25:00:01:03:d2:b8:75:08:00 SRC=132.229.96.110 
DST=132.229.96.12 LEN=52 TOS=0x00 PREC=0x00 TTL=64 ID=34709 DF PROTO=TCP 
SPT=39536 DPT=445 WINDOW=5840 RES=0x00 ACK FIN URGP=0

Any other suggestions?

Jozsef Kadlecsik wrote:
> On Mon, 10 Jul 2006, Arno van Amersfoort wrote:
>
>   
>> I'm currently running a vanilla kernel 2.6.15.6, but I already observed
>> it with older kernel versions too.... The system is running Debian 3.1
>> x86 with iptables 1.2.11, but I don't think this really matters.... If
>> you need additional info, please let me know...
>>     
>
> There was a SACK related bug in TCP connection tracking which was fixed
> around 2.6.15 and which exhibited such problems. Either upgrade the kernel
> on your firewall or disable SACK on all machines behind it. If you can
> reproduce the problem at will with a machine then disable SACK on it and
> check wether it solves the problem.
>
> Best regards,
> Jozsef
> -
> E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
> PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
> Address : KFKI Research Institute for Particle and Nuclear Physics
>           H-1525 Budapest 114, POB. 49, Hungary
>
>   

-- 
Ing. A.C.J. van Amersfoort (Arno)
Department Of Electronics (ELD, k1007)
Huygens Laboratory
Leiden University
P.O. Box 9504
Niels Bohrweg 2
2333 CA Leiden
The Netherlands
----------------------------------------------------------------
Phone : +31-(0)71-527.1894   Fax: +31-(0)71-527.5819
E-mail: a.c.j.van.amersfoort@eld.physics.leidenuniv.nl
----------------------------------------------------------------
Arno's (Linux firewall) homepage: http://rocky.eld.leidenuniv.nl


