From: =?UTF-8?Q?J=C3=B6rn_Krebs?= <jk@smartbyte.de>
Subject: Re: VoIP conntrack issue
Date: Thu, 15 Nov 2012 11:15:09 +1100
Message-ID: <CABY2qi9AnCJDXUFxo_ocUwU0dCmUEJ4W8aMQUbVBmRcS_=5EzA@mail.gmail.com>
References: <CABY2qi8n0ttC99_UktcT+Jwnd9WCCsvk5+ug1GXrrYbd9ixxWw@mail.gmail.com>
 <alpine.LNX.2.01.1211150035180.32273@nerf07.vanv.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:from:date
         :x-google-sender-auth:message-id:subject:to:content-type
         :content-transfer-encoding;
        bh=Jsfw1zxvLHLQbR7ge3Z5kGuQawO3a5yq+y8bxo+MVUI=;
        b=fNyXg88E74ga4seJw37LSnR5TIt1S7bNS2UtPxUkmqe15KfUflU9txFIV6PXgRrCKd
         i5JyjXXF4+TeT716Gy2zI+bVj7AQZUxBNjvCvmcB/HNJpcG2TOGF9kFz/OS6t8iBWomA
         PywmFuAqEOvh873e8Q+3tT4yVxFAHJi20NBhac3sbuWMPhD8LhWBoCkMs60ydJFlrPXn
         HmB4A4121NDh92bVssFnrWjyhzpkzqknLLZAfBU0a5s5Z4ND1a+CPd1GXFuKe6U7CHXC
         stTw5H8YJsNuvqL94nhQwZ3I9p3kiCvn/t0v+EZw04KTTUK07z5fKW+vVFWEftcnVS5P
         AJLA==
In-Reply-To: <alpine.LNX.2.01.1211150035180.32273@nerf07.vanv.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter <netfilter@vger.kernel.org>

Hi,

I think you don't get the point. I have many devices that are
connecting to the same servers(n:m connections),
so I cannot put any simple rule in there. Esp. because the GMX Server
which is the second one that connects and is changing port and IP
address all the time,
my internal phone is changing the port, and might even change it's IP,
so I cannot define a rule based on that.
(I have mentioned that in my first post: It is working, but not when I
like to use direct rtp, which for some reason is possible in every
other network I am working in (mostly Cisco routers), but not in my
own one, and because linux should be / is highly configurable I
though, that this feature just has to be enabled somehow (with feature
I mean a real symmetric NAT))

So I don't want to do "hard" changes that would one work in one situati=
on.

Yes I always have nf_nat_sip compiled in my kernel. It might have
helped, but in this specific case (which isn't specific in VoIP at
all, it's basically a standard case in that world), it doesn't seem to
work.

I WANT A SYMMETRIC NAT!!!! -> Why doesn't anybody understand that?
I mean I am on the netfilter list. Everyone here should know what I
mean with the term symmetric NAT, so what is the problem?
I more and more got the impression, that you are developing in your
own little world, and not the world where we have different types of
NAT.
Most of them can be covered with netfilter/conntrack, but some cannot
and I don't think it can be very hard to implement a symmetric NAT,
can it?

Please advise me on how to implement a symmetric NAT with iptables.

What does the random flag for example on iptables do?

What is the difference between MASQUERADE and SNAT?
Is there any option I can give to the conntrack modules that might
change anything?

Thanks, Joern.

On Thu, Nov 15, 2012 at 10:38 AM, Jan Engelhardt <jengelh@inai.de> wrot=
e:
>
> On Wednesday 2012-11-14 23:41, J=C3=B6rn Krebs wrote:
>>
>>The problem I have with case 1 is that Linux is assigning a new exter=
nal port.
>>So and my router Case 1 looks more like this:
>>A:5000 <-> router:5000 <-> C
>>A:5000 <-> router:1030 <-> D
>>Which causes a big issue with my VoIP setup!
>>(VoIP is negotiating the ports inside the SIP protocol. They are not
>>detected and they are fixed and not detected on the fly)
>
> Are you sure you have tried loading nf_nat_sip, like I mentioned
> in the thread[1] on netfilter@ ? Or the extra DNAT rule?
>
> [1] http://marc.info/?l=3Dnetfilter&m=3D135289221821117&w=3D2
>
>>(Hope I made my case clear)
>
> (The conntrack -E dump made a lot more sense to me.)
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter-d=
evel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



--=20
Bye Bye, J=C3=B6rn Krebs
--------------------------------------------
64 Queen St., Blackstone 4304
Phone: +61731363381
Mobile: +61431068955
Telefon: +495516345347
