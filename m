From: Satish Patel <satish.txt@gmail.com>
Subject: Re: Build firewall with millions pps support
Date: Wed, 27 Apr 2016 11:02:05 -0400
Message-ID: <CAPgF-fpwkShxm4uHV8vuzAsHC9C8=Ske-MY14axtWxELvZvCZA@mail.gmail.com>
References: <CAPgF-foyqY7_UbQVK7R4vU5MRP0XsfgXAjpQUNwNROZVq9YxDQ@mail.gmail.com>
	<CA+hQ2+ja5bRqH301R1q0ThKNno87yUHVCCc8pfvPVMFW48sDiw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc;
        bh=aKsEqiU5Y64g4UkvRCkbAtThZFNmRcLRkG7WX9rHS3k=;
        b=vNG+hFBDG+USHOhehMZvEyYMzCBKLpnMwq8pQ9zZvrrV5LQ138aaJh/LdxZjP9OhwM
         +byNZ96HKqrFkQQeuH+O63ySe+eqVsYWXeJbN6YWxrcHlBU99MQV6vOwBmn6wY7lhMkz
         f6zUVsPxgZO8AJncSrbsdJC4OHGvfexhmrkCw3Auac0v+mVKMkQeeFmx34Lz+hufrxMj
         aekHw5DXTa+DwgCYy7Y+rGbL/GeLL6CSCtgnmIm7AoRP3vLCDe1iaZXLkzwoEekfcC6z
         jRQrz2Y6XQS4cxFz6Toyo5wHnoojZCg80btP1+emYO3DXZ7fEIb5bzQsF57ldysHa6fH
         +OSg==
In-Reply-To: <CA+hQ2+ja5bRqH301R1q0ThKNno87yUHVCCc8pfvPVMFW48sDiw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Luigi Rizzo <rizzo@iet.unipi.it>
Cc: netfilter@vger.kernel.org

How about this Intel NIC
http://www.intel.com/content/dam/doc/product-brief/ethernet-x520-server-adapters-brief.pdf

Does it support Multi Queue?

On Wed, Apr 27, 2016 at 2:13 AM, Luigi Rizzo <rizzo@iet.unipi.it> wrote:
> you may want to look at github.com/luigirizzo/netmap-ipfw ,
> it is a version of FreeBSD's ipfw+dummynet which runs on top
> of netmap.
>
> This works on both Linux and FreeBSD
>
> Re. cards in my experience the Intel cards (the old X520
> based on the 85299, and the newer X710 based on the new chipset)
> are both decent (I have a slight preference for the older,
> which I find more performant)
>
> cheers
> luigi
>
>
> On Wed, Apr 27, 2016 at 5:20 AM, Satish Patel <satish.txt@gmail.com> wrote:
>>
>> Planning to build stateless firewall which support 10GE link with
>> handling 2 million packet per second, need following suggestion from
>> folks
>>
>> 1. Which OS i should use?  (BSD or Linux?)
>> 2. what type of 10GE NIC i should pick to achieve high Mpps (multiqueue
>> etc.)
>> 3. what should i use for bypass kernel (I heard from googling people
>> saying use this technique).
>> 4. what kind of server i should pick?
>>
>> We are build this firewall to stop bad traffic at front door and DDoS
>> (specially flooding and UDP IP Fragmentation stype)
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
>
>
> --
> -----------------------------------------+-------------------------------
>  Prof. Luigi RIZZO, rizzo@iet.unipi.it  . Dip. di Ing. dell'Informazione
>  http://www.iet.unipi.it/~luigi/        . Universita` di Pisa
>  TEL      +39-050-2217533               . via Diotisalvi 2
>  Mobile   +39-338-6809875               . 56122 PISA (Italy)
> -----------------------------------------+-------------------------------
