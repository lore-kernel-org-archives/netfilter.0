From: Yoann Juet <yoann.juet@univ-nantes.fr>
Subject: Re: Second failover failure with conntrackd - INVALID packets
Date: Fri, 23 Jan 2009 13:39:14 +0100
Message-ID: <4979BA72.50405@univ-nantes.fr>
References: <497760CB.6090008@univ-nantes.fr> <49778AF4.7000201@netfilter.org> <4978425F.1030003@univ-nantes.fr> <4978A4F8.5060901@netfilter.org>
Reply-To: yoann.juet@univ-nantes.fr
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------050002080409070102060106"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4978A4F8.5060901@netfilter.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

This is a multi-part message in MIME format.
--------------050002080409070102060106
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

 > That's another known problem of 0.9.6. Probably, you don't see EINVAL
 > but a message like "N entries can't be committed". I suggest you to
 > upgrade to latest. I'm about to release 0.9.10, using current would 
 >make my life easier to provide you support.

Well, I installed conntrack-tools 0.9.9 and libnetfilter_conntrack 
0.0.99 on the cluster. No more "delayed packet" message or another 
warning or error message. Unfortunately, I get the same result when the 
second failover is triggered. Packets are denied due to INVALID state.

PS: the new configuration subblock "Filter from Kernelspace" in 
conntrackd.conf is not parsed correctly. I get an error message:

"Error parsing config file: line (190), symbol 'from': syntax error"

I have to delete it to make starting conntrackd.

Regards,

Pablo Neira Ayuso wrote:
> Yoann Juet wrote:
>> Hi,
>>
>> I see tons of messages "[warning] delayed packet?", even before the
>> first failover, but nothing related to EINVAL. Does it help ?
> 
> That's another known problem of 0.9.6. Probably, you don't see EINVAL
> but a message like "N entries can't be committed". I suggest you to
> upgrade to latest. I'm about to release 0.9.10, using current would make
> my life easier to provide you support.
> 
>> FYI, the cluster is a KVM guest using hardware virtualization with net
>> virtio.
> 
> Interesting. I have never used it in such environment.
> 


--------------050002080409070102060106
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


--------------050002080409070102060106--
