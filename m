From: Yoann Juet <yoann.juet@univ-nantes.fr>
Subject: Re: Second failover failure with conntrackd - INVALID packets
Date: Mon, 26 Jan 2009 20:27:37 +0100
Message-ID: <497E0EA9.1020408@univ-nantes.fr>
References: <497760CB.6090008@univ-nantes.fr> <49778AF4.7000201@netfilter.org> <4978425F.1030003@univ-nantes.fr> <4978A4F8.5060901@netfilter.org> <4979BA72.50405@univ-nantes.fr> <497C4440.7050809@netfilter.org> <497CA7A2.2000906@netfilter.org>
Reply-To: yoann.juet@univ-nantes.fr
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------080406030006000708000407"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <497CA7A2.2000906@netfilter.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

This is a multi-part message in MIME format.
--------------080406030006000708000407
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi pablo !

> that were fixed in the subsequent kernel releases, but I did not know
> any that affected the internal TCP flags set/unset. As these stuff is
> under development, I suggest you to use the latest Linux kernel, 
>please let me know if the problem persists.

I still have the same symptoms with a 2.6.28-2 kernel. My testbed is not 
so far away from yours:

You        		Me
----------------------------------
Etch <-> 		Lenny
2.6.28 <-> 		2.6.28-2
conntrack 0.9.9? <-> 	conntrack 0.9.9
ftfw mode <-> 		ftfw mode
keepalived 1.1.15 <-> 	heartbeat 2.1.3
no virtualization <-> 	KVM with net virtio

On your opinion, could it be the side effect of KVM ? Unfortunately, I 
cannot do without KVM, and cannot test easily without...

Regards,

Pablo Neira Ayuso wrote:
> Pablo Neira Ayuso wrote:
>> Yoann Juet wrote:
>>> "Error parsing config file: line (190), symbol 'from': syntax error"
>>>
>>> I have to delete it to make starting conntrackd.
>> Filter From Kernelspace {
>>          Protocol Accept {
>>                 TCP
>>          }
>>          Address Ignore {
>>                 IPv4_address 127.0.0.1 # loopback
>>          }
>> }
>>
>> It works here fine. Error reporting in the parsing is not very precise
>> yet, probably the problem is not in Filter but before (something is
>> missing and the parser gets confused). Could you post your config file
>> to reproduce it? You can send it to me in private if you want.
> 
> Sorry, you're right. There is a typo in the example files. I have
> applied the following fix to the git (will be available in
> conntrack-tools-0.9.10).
> 
> 



--------------080406030006000708000407
Content-Type: text/x-vcard; charset=utf-8;
 name="yoann_juet.vcf"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="yoann_juet.vcf"

begin:vcard
fn:Yoann Juet
n:Juet;Yoann
org;quoted-printable:;DSI Universit=C3=A9 de Nantes
adr;quoted-printable:BP92208;;2, rue de la Houssini=C3=A8re;Nantes;;44322;France
email;internet:yoann.juet@univ-nantes.fr
title;quoted-printable:Ing=C3=A9nieur s=C3=A9curit=C3=A9 & r=C3=A9seau
tel;work:02.51.12.53.93
tel;fax:02.51.12.58.60
x-mozilla-html:FALSE
version:2.1
end:vcard


--------------080406030006000708000407--
