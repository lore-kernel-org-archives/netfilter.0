From: Arno van Amersfoort <arnova@eld.physics.leidenuniv.nl>
Subject: Re: TCP connection timeout problem
Date: Mon, 10 Jul 2006 09:10:34 +0200
Message-ID: <44B1FD6A.6010207@eld.physics.leidenuniv.nl>
References: <44ACDDC3.7080907@eld.physics.leidenuniv.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <44ACDDC3.7080907@eld.physics.leidenuniv.nl>
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
To: kadlec@blackhole.kfki.hu
Cc: netfilter@lists.netfilter.org

Here is some additional information:

I'm currently running a vanilla kernel 2.6.15.6, but I already observed 
it with older kernel versions too.... The system is running Debian 3.1 
x86 with iptables 1.2.11, but I don't think this really matters.... If 
you need additional info, please let me know...

Arno

Arno van Amersfoort wrote:
> Hello all,
>
> I'm the author of "Arno's Iptables Firewall" (maybe you know). Anyway, 
> I've been experiencing a problem for quite some time know. The problem 
> is that it seems that in once in a while a connection is no longer 
> considered ESTABLISHED by netfilter/iptables, causing the packets to 
> bounce of the firewall like this:
> Jul  5 18:02:16 rulhm2 kernel: Stealth scan (UNPRIV)?: IN=eth0 OUT= 
> MAC=00:01:02:05:1d:25:00:10:dc:d4:a2:bc:08:00 SRC=x.x.x.x DST=x.x.x.x 
> LEN=41 TOS=0x00 PREC=0x00 TTL=128 ID=26688 DF PROTO=TCP SPT=445 
> DPT=53205 WINDOW=17053 RES=0x00 ACK URGP=0
>
> In this case it's a connection for used by Samba (port 445). As you 
> can see an TCP packets with the ACK-flag set is bounced of as it's (no 
> longer) catched by my (iptables) ESTABLISHED-rule. This happens for a 
> variety of flag-combinations (like RST, FIN, ACK/FIN etc.). Is there 
> any way I can fix this "nicely", as until know I've always "worked 
> around" this issue with using some general iptables rules which simply 
> drop(ignore) these kind of packets. I'm thinking of some kernel 
> settings (/proc / sysctl) that one might "tweak"....
>
> Thanks for any info anyone can provide....
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


