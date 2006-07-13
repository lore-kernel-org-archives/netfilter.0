From: Arno van Amersfoort <arnova@eld.physics.leidenuniv.nl>
Subject: Re: TCP connection timeout problem
Date: Thu, 13 Jul 2006 10:03:20 +0200
Message-ID: <44B5FE48.7000503@eld.physics.leidenuniv.nl>
References: <44ACDDC3.7080907@eld.physics.leidenuniv.nl>	<44B1FD6A.6010207@eld.physics.leidenuniv.nl>	<Pine.LNX.4.58.0607100921490.12586@blackhole.kfki.hu>	<44B3444C.3020503@eld.physics.leidenuniv.nl>	<Pine.LNX.4.58.0607110843170.24895@blackhole.kfki.hu>
	<44B35ED9.7070008@eld.physics.leidenuniv.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <44B35ED9.7070008@eld.physics.leidenuniv.nl>
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
To: Arno van Amersfoort <arnova@eld.physics.leidenuniv.nl>
Cc: netfilter@lists.netfilter.org, Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>

Just did some more investigation. Didn't test with tcpdump yet as this 
issue is not reproducable easiely :-S Anyway it turns out that the 
packets shown have state "INVALID" (opposed to ESTABLISHED or NEW). So 
somehow iptables "thinks" they no longer belong to a connection 
(somehow)....

Arno van Amersfoort wrote:
>
>
> Jozsef Kadlecsik wrote:
>> On Tue, 11 Jul 2006, Arno van Amersfoort wrote:
>>
>>  
>>> I think I already stumbled into this bug in the past, I recall that 
>>> this
>>> bug was in 2.6.14.
>>> Anyway, I've tried to disable tcp_sack & tcp_dsack but no luck. I also
>>> upgraded to 2.6.17.4 but this doesn't help iether :-S I'm also getting
>>> packets like this for "open ports" (with ie. -p tcp --dport 22 --syn -j
>>> ACCEPT) giving:
>>>
>>> Jul 11 04:02:59 rulhm2 kernel: Stealth scan (PRIV)?: IN=eth0 OUT=
>>> MAC=00:01:02:05:1d:25:00:01:03:d2:b8:75:08:00 SRC=132.229.96.110 
>>> DST=132.229.96.12 LEN=52 TOS=0x00 PREC=0x00 TTL=64 ID=34709 DF 
>>> PROTO=TCP
>>> SPT=39536 DPT=445 WINDOW=5840 RES=0x00 ACK FIN URGP=0
>>>     
>>
>> I don't understand how it is related to an open ssh port.
>>   
> Sorry about that. It should (of course) be -p tcp --dport 445 --syn -j 
> ACCEPT . (I'm running Samba on this machine). But do note that this 
> issue doesn't specifically happen with Samba. I've also seen it happen 
> with http packets...
>>  
>>> Any other suggestions?
>>>     
>>
>> Enable logging invalid packets via
>> /proc/sys/net/ipv4/netfilter/ip_conntrack_log_invalid then record by
>> tcpdump a whole TCP session which triggers the problem. Then send me the
>> capture file and the corresponding kernel log entries.
>>   
> Ok. I will try to do this. And let you know my findings
>> Best regards,
>> Jozsef
>> -
>> E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
>> PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
>> Address : KFKI Research Institute for Particle and Nuclear Physics
>>           H-1525 Budapest 114, POB. 49, Hungary
>>
>>   
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


