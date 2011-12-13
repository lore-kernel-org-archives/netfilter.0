From: anil dahiya <anildahiya80@gmail.com>
Subject: Re: Sending ICMP echo request out
Date: Tue, 13 Dec 2011 10:19:39 +0530
Message-ID: <CAHGPgw3hvXWnbJM=EBKbiN7LKJFbA2hHdiV0==DO_b_CFtJ37g@mail.gmail.com>
References: <CAGZFCEEux4TBE+JAqzx9CDJ1HGdNXnqQBHBxhJ8TXEQh3Zq7_w@mail.gmail.com>
	<CAHGPgw1bL7XF6Ef29N_YQ-dAW3RYQe7j4-2zuWhFXQddW+Yg_g@mail.gmail.com>
	<1323374344.5818.1.camel@hakkenden.homenet>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-newbie-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=UMEI2kVNOlGZeJQqhNsDeIRTKkgC2qkhiDtRt95pS9Y=;
        b=maxVUbu0B6tVx4szfAEHA5B+aEY1GunxWAmdRsBrn6dqGYO7QL0HsR/NR2rQ2T5tG0
         pCFPDIiFm5pRh9sZXAOC2lUeGpIIhWxw63pg3XmT3yRy9oK1whWfN1z8YWqgo+P/DGQf
         U+N4M6ssavhOPm8hMCBcaDg38uqE8by+5A1v8=
In-Reply-To: <1323374344.5818.1.camel@hakkenden.homenet>
Sender: linux-newbie-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: "Nikolay S." <nowhere@hakkenden.ath.cx>
Cc: linux-newbie <linux-newbie@vger.kernel.org>, Netfilter mailing list <netfilter@vger.kernel.org>, linux-net@vger.kernel.org

Thanks, It was issue of reverse path filtering.

Regards,
Anil

On Fri, Dec 9, 2011 at 1:29 AM, Nikolay S. <nowhere@hakkenden.ath.cx> w=
rote:
> =F7 =F0=D4., 09/12/2011 =D7 00:00 +0530, anil dahiya =D0=C9=DB=C5=D4:
>> Hi ,
>>
>> I have following setup with routing table as shown below:
>>
>> +-----------------------+
>> | =9A =9ASystem-1 =9A =9A =9A|
>> | =9A =9A "client" =9A =9A =9A =9A |
>> |------------------------|
>> | =9A192.168.11.5 =9A |
>> +----------------------+
>> =9A =9A =9A =9A|
>> =9A =9A =9A =9A|
>> +------+-----+
>> | =9A Switch =9A +----------------------+
>> +------+-----+ =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A|
>> =9A =9A =9A =9A| =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A=
 =9A =9A =9A |
>> =9A =9A =9A =9A| =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A +------=
-------------------+
>> =9A =9A =9A =9A| =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A| =9A=
192.168.11.1 =9A =9A =9A|
>> =9A =9A =9A =9A| =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A|---=
------------------------|
>> =9A =9A =9A =9A| =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A| =9A=
 =9A Router =9A =9A =9A =9A =9A =9A|
>> =9A =9A =9A =9A| =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A|---=
----------------------- |
>> =9A =9A =9A =9A| =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A| =9A=
 192.168.12.1 =9A =9A |
>> =9A =9A =9A =9A| =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A +------=
--------------------+
>> =9A =9A =9A =9A| =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A=
 =9A =9A =9A =9A =9A|
>> =9A =9A =9A =9A| =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A=
 =9A =9A =9A =9A =9A|
>> +------------------------+ =9A =9A =9A =9A =9A =9A =9A =9A|
>> | =9A192.168.11.6 =9A =9A =9A| =9A =9A =9A =9A =9A =9A =9A =9A|
>> |--------------------------| =9A =9A =9A =9A =9A =9A =9A =9A|
>> | =9A System-2 =9A =9A =9A =9A| =9A =9A =9A =9A =9A =9A =9A =9A|
>> |--------------------------| =9A =9A =9A =9A =9A =9A =9A =9A|
>> | =9A 192.168.12.6 =9A =9A| =9A =9A =9A =9A =9A =9A =9A =9A|
>> | =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A|--------------=
--+
>> +------------------------+
>>
>> Routing table details of setup
>> ------------------------------------------
>> System-1
>> -----
>> $route -n
>> Kernel IP routing table
>> Destination =9A =9A Gateway =9A =9A =9A =9A Genmask =9A =9A =9A =9A =
=46lags Metric Ref =9A =9AUse Iface
>> 192.168.11.0 =9A =9A0.0.0.0 =9A =9A =9A =9A 255.255.255.0 =9A U =9A =
=9A 1 =9A =9A =9A0 =9A =9A =9A =9A0 eth1
>> 0.0.0.0 =9A =9A =9A =9A 192.168.11.1 =9A =9A0.0.0.0 =9A =9A =9A =9A =
UG =9A =9A0 =9A =9A =9A0 =9A =9A =9A =9A0 eth1
>>
>>
>> Router
>> -----------
>> $route -n
>> Kernel IP routing table
>> Destination =9A =9A Gateway =9A =9A =9A =9A Genmask =9A =9A =9A =9A =
=46lags Metric Ref =9A =9AUse Iface
>> 192.168.12.0 =9A =9A0.0.0.0 =9A =9A =9A =9A 255.255.255.0 =9A U =9A =
=9A 0 =9A =9A =9A0 =9A =9A =9A =9A0 eth1
>> 192.168.11.0 =9A =9A0.0.0.0 =9A =9A =9A =9A 255.255.255.0 =9A U =9A =
=9A 0 =9A =9A =9A0 =9A =9A =9A =9A0 eth0
>>
>>
>> System-2
>> ------
>> $route -n
>> Kernel IP routing table
>> Destination =9A =9A Gateway =9A =9A =9A =9A Genmask =9A =9A =9A =9A =
=46lags Metric Ref =9A =9AUse Iface
>> 192.168.12.0 =9A =9A0.0.0.0 =9A =9A =9A =9A 255.255.255.0 =9A U =9A =
=9A 0 =9A =9A =9A0 =9A =9A =9A =9A0 eth1
>> 192.168.11.0 =9A =9A0.0.0.0 =9A =9A =9A =9A 255.255.255.0 =9A U =9A =
=9A 0 =9A =9A =9A0 =9A =9A =9A =9A0 eth0
>> 0.0.0.0 =9A =9A =9A =9A 192.168.12.1 =9A =9A0.0.0.0 =9A =9A =9A =9A =
UG =9A =9A0 =9A =9A =9A0 =9A =9A =9A =9A0 eth1
>>
>>
>> When I do ping from system-1 192.168.11.5 to system-2 192.168.12.6 ,
>> ping echo packet is reaching on system-2 through NIC 192.168.12.6 bu=
t
>> system is not sending any response to 192.168.11.5 using either of N=
IC
>> i.e 192.168.11.6 or 192.168.12.6 ? Why this is happening ? Can you
>> help me ?
>>
>> I have observed same type of symtoms when I do SSH from 192.168.11.5
>> to 192.168.12.6
>>
>> FYI,
>> ip_forwarding is enable on router and iptables are no configured on
>> any of system .
>
> I think, reverse path filtering is the problem here.
>
>>
>> Thanks,
>> Anil
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter"=
 in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at =9Ahttp://vger.kernel.org/majordomo-info.html
>
>
--
To unsubscribe from this list: send the line "unsubscribe linux-newbie"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
Please read the FAQ at http://www.linux-learn.org/faqs
