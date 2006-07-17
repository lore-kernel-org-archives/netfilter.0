From: Arno van Amersfoort <arnova@eld.physics.leidenuniv.nl>
Subject: Re: TCP connection timeout problem
Date: Mon, 17 Jul 2006 15:25:45 +0200
Message-ID: <44BB8FD9.7080606@eld.physics.leidenuniv.nl>
References: <44ACDDC3.7080907@eld.physics.leidenuniv.nl>
	<44B1FD6A.6010207@eld.physics.leidenuniv.nl>
	<Pine.LNX.4.58.0607100921490.12586@blackhole.kfki.hu>
	<44B3444C.3020503@eld.physics.leidenuniv.nl>
	<Pine.LNX.4.58.0607110843170.24895@blackhole.kfki.hu>
	<44B35ED9.7070008@eld.physics.leidenuniv.nl>
	<44B5FE48.7000503@eld.physics.leidenuniv.nl>
	<Pine.LNX.4.58.0607170945190.935@blackhole.kfki.hu>
	<44BB8CD4.5000506@eld.physics.leidenuniv.nl>
	<Pine.LNX.4.58.0607171514020.964@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.58.0607171514020.964@blackhole.kfki.hu>
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
Cc: netfilter@lists.netfilter.org

Yep: I have ipt_LOG loaded (actually compiled into the kernel) and not 
ipt_ULOG. So the only thing I'm getting in my kernel log is:

Jul 17 04:02:07 rulhm2 kernel: INVALID packet: IN=eth0 OUT= 
MAC=00:01:02:05:1d:25:00:01:03:d2:b8:75:08:00 SRC=132.229.96.110 
DST=132.229.96.12 LEN=52 TOS=0x00 PREC=0x00 TTL=64 ID=56700 DF PROTO=TCP 
SPT=54858 DPT=445 WINDOW=5840 RES=0x00 ACK FIN URGP=0

(But of course this also is shown when 
/proc/sys/net/ipv4/netfilter/ip_conntrack_log_invalid = 0 )



Jozsef Kadlecsik wrote:
> On Mon, 17 Jul 2006, Arno van Amersfoort wrote:
>
>   
>> Jozsef Kadlecsik wrote:
>>     
>>> On Thu, 13 Jul 2006, Arno van Amersfoort wrote:
>>>
>>>       
>>>> Just did some more investigation. Didn't test with tcpdump yet as this
>>>> issue is not reproducable easiely :-S Anyway it turns out that the
>>>> packets shown have state "INVALID" (opposed to ESTABLISHED or NEW). So
>>>> somehow iptables "thinks" they no longer belong to a connection
>>>> (somehow)....
>>>>         
>>> If you enabled logging invalid packets, then the kernel would produce log
>>> lines why those packets were categorized as INVALID.
>>>       
>> I've tried enabling this option but nothing shows up in my kernel log.
>> I'd expect it to appear in loglevel kern.* right ?
>>     
>
> That's right. You have got the kernel module ipt_LOG loaded in (and
> ipt_ULOG doesn't), don't you?
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


