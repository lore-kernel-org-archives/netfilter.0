From: Gadre Nayan <gadrenayan@gmail.com>
Subject: Re: Ipset kernel module functions
Date: Wed, 24 Feb 2016 04:57:22 +0530
Message-ID: <CAKJ7aR77U2XBBQqBg4ey5-np=6i=2Kj+R0o37vovM90=0S0Fkg@mail.gmail.com>
References: <CAKJ7aR5_xNAeDdnU53K4sVvOVzDTzBjYZ1yxJ7jX8cL=jCRBJQ@mail.gmail.com>
	<alpine.DEB.2.10.1602230936460.11314@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to;
        bh=PowB+5Un5N2A6tc1rtY6hpt8Ikvg3Rt9o5JdPBvZrrQ=;
        b=ZnyEYepOdllZtoHEFxqehu3anox0voOWDojKa0UBJW9am4T3I30dDhR1zHmtQgO/LV
         H8bZkuCbE9Mu+MX2eNdEf18zHPlpIOabise+92p7XTtDn1Li9COLqQhQD8tGlWEj1OCY
         4P+SnMV320zyRF8lmGukpSrVB30rdk68SEDhS5RKTQ1v7PevXsZJAiSBAGOzIxqTBEN1
         gZ31yzMM5ZW3b+ifHakQitq0bEw3csG+JfC9XHlWTKticWf4jwS1+heKGOroUhyift8k
         YPLHLJiRnptzI24wBdbNEcdip+5kXY6yMTomPo56q4LwkqhOI7sqsaGPJTOLZpOQbk5y
         rUig==
In-Reply-To: <alpine.DEB.2.10.1602230936460.11314@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, netfilter@vger.kernel.org

Hi,

Thank you for the explanation. So, I was tracing the user space source
and I had few questions regarding the Netlink messages sent from User
space.

1. The command gets transformed into Netlink Message in
ipset_cmd(session, enum cmd, lineno) ---> lib/session.c

I see the attributes getting created. So which BUS id (Subsystem ID)
in Netlink is this message send to ?

2. If I have to trace this command Netlink message in Kernel source,
where can I start loooking. (I would typically start at the subsystem
registration) so where can this IPSET subsystem be registered and
parsed.

Thanks and Regards
Gadre Nayan A

On Tue, Feb 23, 2016 at 2:55 PM, Jozsef Kadlecsik
<kadlec@blackhole.kfki.hu> wrote:
> On Tue, 23 Feb 2016, Gadre Nayan wrote:
>
>> I am trying to understand the IPSET modules in linux kernel 4.3.
>> Particularly Macset. In the source file:
>> /net/netfilter/ipset/ip_set_hash_mac.c
>>
>> I have few questions:
>>
>> 1. What is the purpose of HTYPE, it is not getting used further.
>>
>> /* Type specific function prefix */
>>          #define HTYPE           hash_mac
>>
>> 2. What is the purpose of MTYPE.
>>           #define MTYPE           hash_mac4
>
> Most of the functions are generated and the macros are used in the
> included ip_set_hash_gen.h file. HTYPE is used for the IPv4/IPv6
> independent functions while MTYPE required for the IPv4, IPv6 specific
> ones.
>
>> 3. Why 2 different functions are used. KADT and UADT. I understand ADT
>> is Add delete, Test and K and U might be Kernel space and User space.
>> But what is different operation of KADT and UADT.
>
> Those are the kernel and userspace common routines for add, del and test
> elements. The functions are separated because the input comes in different
> forms: in the userspace case in netlink attributes, while in the kernel
> case through the API.
>
>> 4. Who calls Kadt in kernel space. How is UADT called from User space.
>
> The kadt functions are called from the kernel part interfaces (ip_set_add,
> etc) while the uadt ones from ip_set_uadd, etc (see ip_set_core.c). Please
> note uadt functions are NOT called in userspace: the functions work on
> data sent FROM userspace.
>
> Best regards,
> Jozsef
> -
> E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
> PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
> Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
>           H-1525 Budapest 114, POB. 49, Hungary
