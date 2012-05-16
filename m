From: Sudheer <sudheer.d@oneconvergence.com>
Subject: Re: Need info about how to run nfqnl_test.c !!
Date: Wed, 16 May 2012 16:08:27 +0530
Message-ID: <CAJRDWV6ej2uEj8BRMnoURjfz1Ma=7WVTe7o5zNrA+tpBRvo51g@mail.gmail.com>
References: <CAJRDWV6NkPdRVZo5LTSaMbR+_s+b+JnnVZLJ+SELrL=hVhJNQg@mail.gmail.com>
	<CAD4s1gRLFdhpchTez08n_Xjq1kYZ_-A=Y9USbK=eF4N7g-ES+A@mail.gmail.com>
	<CAJRDWV5Ki6iU-BhW6-YPazH3hG6KTvpmDYK-3pBMku6UDRpMtw@mail.gmail.com>
	<CAD4s1gSURy1dTTNZGOjhzOQ+tAWsSWYyM_D-EJ2zu1SuTdBFiA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAD4s1gSURy1dTTNZGOjhzOQ+tAWsSWYyM_D-EJ2zu1SuTdBFiA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Wentao Shang <wentaoshang@gmail.com>
Cc: netfilter@vger.kernel.org

Thanks a lot Wento !! for your time and information provided




On Wed, May 16, 2012 at 4:02 PM, Wentao Shang <wentaoshang@gmail.com> w=
rote:
> You may call nfq_create_queue() several times and specify each queue
> with different number (the 2nd param in the function) and different
> callback routine. However, I'm not sure how the incoming packets are
> delivered to different queues. Maybe you should use select() or poll(=
)
> here.
>
> Wentao
>
> 2012/5/16 Sudheer <sudheer.d@oneconvergence.com>:
>> Thanks Wentao for your reply.
>>
>> =A0I wanna use 3 queues for the same application. is it possible to
>> create 3 queues in same application and use to queue the packets int=
o
>> each queue ?
>>
>>
>>
>> On Wed, May 16, 2012 at 12:36 PM, Wentao Shang <wentaoshang@gmail.co=
m> wrote:
>>> Simply compile it and run it. Then it will start printing informati=
on
>>> about the IPv4 packets received on your machine:)
>>>
>>> Wentao
>>>
>>> 2012/5/16 Sudheer <sudheer.d@oneconvergence.com>:
>>>> Hi ,
>>>>
>>>> =A0 =A0I am new to the concept of netfilters so i have downloaded =
the
>>>> "nfqnl_test.c" =A0from the website and compiled it. Could you plea=
se let
>>>> me know how to run this code and check the output. =A0Do we need t=
o
>>>> execute any others commands before running this code ??
>>>>
>>>> =A0It will be very useful for me if you let me know the procedure =
to
>>>> use the "nfqnl_test.c" code.
>>>>
>>>> --
>>>> Best Regards,
>>>> Sudheer
>>>> --
>>>> To unsubscribe from this list: send the line "unsubscribe netfilte=
r" in
>>>> the body of a message to majordomo@vger.kernel.org
>>>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.ht=
ml
>>>
>>>
>>>
>>> --
>>> Wentao Shang
>>>
>>> Master Candidate and Research Assistant at CERNET Center & NGN Lab,=
 EE
>>> Department, Tsinghua University
>>
>>
>>
>> --
>> Best Regards,
>> Sudheer
>
>
>
> --
> Wentao Shang
>
> Master Candidate and Research Assistant at CERNET Center & NGN Lab, E=
E
> Department, Tsinghua University



--=20
Best Regards,
Sudheer
