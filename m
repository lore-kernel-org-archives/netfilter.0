From: Yoann Juet <yoann.juet@univ-nantes.fr>
Subject: Re: Second failover failure with conntrackd - INVALID packets
Date: Mon, 23 Feb 2009 16:38:26 +0100
Message-ID: <49A2C2F2.2050604@univ-nantes.fr>
References: <497760CB.6090008@univ-nantes.fr> <49778AF4.7000201@netfilter.org> <4978425F.1030003@univ-nantes.fr> <4978A4F8.5060901@netfilter.org> <4979BA72.50405@univ-nantes.fr> <497C4440.7050809@netfilter.org> <497CA7A2.2000906@netfilter.org> <497E0EA9.1020408@univ-nantes.fr> <497E40B0.2090709@netfilter.org> <4981D4EB.3060007@univ-nantes.fr> <49881800.20707@netfilter.org> <49896FEA.3050803@univ-nantes.fr> <4989713B.2010502@netfilter.org> <498C004A.20506@univ-nantes.fr> <49901394.30504@netfilter.org> <49917D90.8090706@univ-nantes.fr> <49929106.8080006@netfilter.org> <49952D6E.4020501@univ-nantes.fr> <49958FA7.1030702@netfilter.org> <499B0696.2020300@netfilter.org>
Reply-To: yoann.juet@univ-nantes.fr
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------050709030209030908010202"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <499B0696.2020300@netfilter.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Pablo Neira Ayuso <pablo@netfilter.org>, netfilter@vger.kernel.org

This is a multi-part message in MIME format.
--------------050709030209030908010202
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Pablo Neira Ayuso wrote:
> Pablo Neira Ayuso wrote:
>> Please, add the following line here to your scripts:
>>
>> conntrackd -B -C /etc/conntrackd.conf
>>
>> Let me now if that fixes your problem.
> 
> Updates? I'm intrigued with your problem. Some more info for
> troubleshooting. You have the commands:
> 
> display internal cache (states that belong to this node)
> # conntrackd -i
> 
> display external cache (states that belong to other nodes)
> # conntrackd -e
> 
> While trigering fail-overs, you should see the same states in the
> active's internal cache and the backup's external cache. If that does
> happen, there's a problem somewhere.
> 
> I'm about to release 0.9.11 but before I'd like to close pending issues.
> 

The issue is solved by adding "conntrackd -B" to my script. According to 
the logs, such instruction sends bulk update. What is it for exactly ?

Best regards,

--------------050709030209030908010202
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


--------------050709030209030908010202--
