From: Soroosh Sardari <soroosh.sardari@gmail.com>
Subject: Re: ipset v6.25.1 does not recognize 'counters' as option
Date: Fri, 21 Aug 2015 14:27:30 +0430
Message-ID: <CAFUsPDZjpkKSgdv29kH0snwm=-XOBXPVF4JUhmU2B-U=dCFBbw@mail.gmail.com>
References: <CAFUsPDZw6uGSsNvoZN3TKm=NHdUJTQ79QakYvxP1OyHMzZDzmQ@mail.gmail.com>
 <CAEzD07KL6CaBq8dHsPVLQH-R=Em76iiS=ErNOXFsVMd4Gygsfw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=VhMfJH+NR0Z9Q/G32/WCx+aCo9bbUBnVveoh4YqqDgc=;
        b=BlZTqoiT3zjv/mDgh/KAxeEDuxbZw1q2qoGp/aWWvPtJNHUoKLshIz/bcor1jbvTi/
         iRj/PdKfzZKO5ecv94Bphxpi69gOPKbKMBtiC8/LJqlMVP0q+6VCOa3ft0YBNdlloG4l
         pn3fc8vddcuVLqJtHvgmu4ShanDiHVwpP8M11s8ewckzLSs+Rok9JXIbcfY72oN2SSZI
         HsA48xMIEBiNUlMzVj3/mFklS2yFcqHHOnPw8RRe0xz3ZVUuebcS8qcLR+DU3mV4WTY3
         URrtcXiAilTtuLno5jihLcDvfur34bt5ZjrwrfHTdPpOBtZI3Jpoq/Kp6PEMpiAGKWcx
         5Icw==
In-Reply-To: <CAEzD07KL6CaBq8dHsPVLQH-R=Em76iiS=ErNOXFsVMd4Gygsfw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anton Danilov <littlesmilingcloud@gmail.com>
Cc: netfilter@vger.kernel.org

Thanks, this is the output of ipset help | counters:

    list:set 1 counters support
    hash:net,iface 3 counters support
    hash:net,port 4 counters support
    hash:net 3 counters support
    hash:ip,port,net 4 counters support
    hash:ip,port,ip 2 counters support
    hash:ip,port 2 counters support
    hash:ip 1 counters support
    bitmap:port 1 counters support
    bitmap:ip,mac 1 counters support
    bitmap:ip 1 counters suppor

Seems I'm using the new kernel modules. Is there any make option to
enable counters in ipset user space tool?!

On Fri, Aug 21, 2015 at 1:52 PM, Anton Danilov
<littlesmilingcloud@gmail.com> wrote:
> Hello.
> You should be sure of using of right version kernel modules.
> Check output of 'ipset help'. May be you still using of old version
> kernel modules.
>
> 2015-08-21 11:08 GMT+03:00 Soroosh Sardari <soroosh.sardari@gmail.com>:
>> Hi
>>
>> I'm using ipset v6.25.1 in ubuntu 12.04
>>
>> uname -a
>> Linux soroosh 3.2.0-72-generic-pae #107-Ubuntu SMP Thu Nov 6 14:44:10
>> UTC 2014 i686 i686 i386 GNU/Linux
>>
>> ipset -V
>> ipset v6.25.1, protocol version: 6
>>
>> I compiled the ipset source code as following:
>> ./autogen.sh
>> ./configure
>> make
>> make modules
>> make install
>> make modules_install
>>
>> Unfortunately i get this error:
>> ipset create foo hash:ip timeout 0 counters
>> ipset v6.25.1: Unknown argument: `counters'
>> Try `ipset help' for more information.
>>
>> Any help appreciated
>>
>> Regards,
>> Soroosh Sardari
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
>
> --
> Anton.
