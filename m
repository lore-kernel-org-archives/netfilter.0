From: Yoann Juet <yoann.juet@univ-nantes.fr>
Subject: Re: Second failover failure with conntrackd - INVALID packets
Date: Thu, 29 Jan 2009 17:10:19 +0100
Message-ID: <4981D4EB.3060007@univ-nantes.fr>
References: <497760CB.6090008@univ-nantes.fr> <49778AF4.7000201@netfilter.org> <4978425F.1030003@univ-nantes.fr> <4978A4F8.5060901@netfilter.org> <4979BA72.50405@univ-nantes.fr> <497C4440.7050809@netfilter.org> <497CA7A2.2000906@netfilter.org> <497E0EA9.1020408@univ-nantes.fr> <497E40B0.2090709@netfilter.org>
Reply-To: yoann.juet@univ-nantes.fr
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------000307040800020201020109"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <497E40B0.2090709@netfilter.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

This is a multi-part message in MIME format.
--------------000307040800020201020109
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


 > Could you try latest conntrack-tools 0.9.10? I released them 
yesterday > along with accumulated updates/fixes. Thanks!

I experience right now some difficulties to compile version 0.9.10 on 
lenny. I keep you in touch with test results.

Regards,

Pablo Neira Ayuso wrote:
> Hi again Yoann,
> 
> Yoann Juet wrote:
>> Hi pablo !
>>
>>> that were fixed in the subsequent kernel releases, but I did not know
>>> any that affected the internal TCP flags set/unset. As these stuff is
>>> under development, I suggest you to use the latest Linux kernel,
>>> please let me know if the problem persists.
>> I still have the same symptoms with a 2.6.28-2 kernel. My testbed is not
>> so far away from yours:
>>
>> You                Me
>> ----------------------------------
>> Etch <->         Lenny
>> 2.6.28 <->         2.6.28-2
>> conntrack 0.9.9? <->     conntrack 0.9.9
>> ftfw mode <->         ftfw mode
>> keepalived 1.1.15 <->     heartbeat 2.1.3
>> no virtualization <->     KVM with net virtio
> 
> Indeed, very similar.
> 
>> On your opinion, could it be the side effect of KVM ? Unfortunately, I
>> cannot do without KVM, and cannot test easily without...
> 
> I'm not familiar with KVM, but before pointing to it as the problem
> (since I think that it is transparent to conntrackd). Could you try
> latest conntrack-tools 0.9.10? I released them yesterday along with
> accumulated updates/fixes. Thanks!
> 


--------------000307040800020201020109
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


--------------000307040800020201020109--
