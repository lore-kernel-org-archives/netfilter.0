From: =?ISO-8859-1?Q?Humberto_Juc=E1?= <betolj@gmail.com>
Subject: Re: Block Facebook with Layer7
Date: Tue, 18 Sep 2012 07:49:48 -0400
Message-ID: <CACuyg26uU6pRHFgTNbLMf+ZQRDSSu+u3U8P1=sL2MKLx4tjA1w@mail.gmail.com>
References: <CAMTjHrwPuUTra2hHqP8oq3=SDVi_K_nAE4cjcGsaANL_ge63cA@mail.gmail.com>
	<47e26662c03e90efdd07a69583376777@linuxwall.info>
	<alpine.LNX.2.01.1209180731540.1837@nerf07.vanv.qr>
	<1347963305.21992.21.camel@denise.theartistscloset.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=YbIRPYBBuzbuewfXJT9lHyPufX+I7Vh3NMLRcI2LZNw=;
        b=VbUd5CIg+hPDTRDiIOpMpJo0DTQEh1W0sOj+JTej9EG9qrOa+R4u40UJuxghYYQdSA
         2vqwCLQkHRiqLwBE61eDMmI2TGbHS4xrtGsregtoIVnB5VsWe/mT31StMZolRVlhmVjx
         6mBExwqDK4M2Fo/FqEZaum6fLUz/KWSft8L+OCDqTLhkB4avaz+XlBUMHGXvg/YjZMK/
         0Gw/xwp96pJc/dD0PkoDO+lnXO1QRBE8KDWYKY5pEC/PK2I773USZmcuKLkZ2pF/PF1f
         0NTuEPUCw5Nd82lf7L/E4k+OtV5F8czcbYpnETiIL9hVS6Y/jD5o0FQ3b+VamS7pMsdV
         s11g==
In-Reply-To: <1347963305.21992.21.camel@denise.theartistscloset.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Cc: netfilter@vger.kernel.org

Try this (filtering facebook.com DNS request):
/sbin/iptables -t mangle -A POSTROUTING -m string --hex-string
"|66616365626f6f6b03636f6d|" --algo bm -p udp --dport 53 -j DROP

**** All sites with facebook plugin will be slowly! ****


IMHO, with proxy applications (like Squid/Dansguardian) you have best r=
esults.
With TCP/443 open, you greatly facilitates the use of tools such as Ult=
raSurf.

Change your proxy config to WPAD and deny tcp/443 FORWARD chain.


2012/9/18 John A. Sullivan III <jsullivan@opensourcedevel.com>:
> On Tue, 2012-09-18 at 07:32 +0200, Jan Engelhardt wrote:
>> On Tuesday 2012-09-18 03:54, Julien Vehent wrote:
>>
>> > On 2012-09-17 18:30, Usu=E1rio do Sistema wrote:
>> >> Hello everyone,
>> >>
>> >> it's possible to drop traffic to facebook with iptables Layer7 ? =
I
>> >> have done some test with Squid but I found some difficult because=
 I'm
>> >> using Transparent Proxy so maybe it been  more easy to drop with
>> >> iptables layer7.
>> >>
>> >> any tips is welcome......as well as some how to....
>> >>
>> >>
>> >
>> > iptables -t filter -I FORWARD -p tcp --dport 80 -m string --string=
 "host:
>> > facebook.com" --icase --algo bm -j DROP
>> >
>> > Of course, this won't work with HTTPS connections.
>>
>> And easily kills the connection whenever there's "host: facebook.com=
" in
>> the payload. Like... this mail, when read through a web archive.
> <snip>
> Isn't that where one would specify the offsets - not to mention more
> efficient parsing?
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
