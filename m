From: "Xu, Qiang (FXSGSC)" <Qiang.Xu@fujixerox.com>
Subject: RE: iptables not prevent access
Date: Tue, 16 Sep 2008 12:14:35 +0800
Message-ID: <D8C9BC7FFCF8154FB7141EB8DB609C1721726069D2@SGPAPHQ-EXSCC01.dc01.fujixerox.net>
References: <D8C9BC7FFCF8154FB7141EB8DB609C1721725A3FD3@SGPAPHQ-EXSCC01.dc01.fujixerox.net>
	 <9518B26607784D55A361431633134C9B@dcyb.net>
	 <D8C9BC7FFCF8154FB7141EB8DB609C1721725A40CE@SGPAPHQ-EXSCC01.dc01.fujixerox.net>
	 <ff71fbf20809150342u52afb246vbb672cbdf36a43ad@mail.gmail.com>
	 <D8C9BC7FFCF8154FB7141EB8DB609C1721726062EC@SGPAPHQ-EXSCC01.dc01.fujixerox.net>
	 <ff71fbf20809150511g6db0b772o9ebf7fdf54325dac@mail.gmail.com>
	 <D8C9BC7FFCF8154FB7141EB8DB609C17217260693A@SGPAPHQ-EXSCC01.dc01.fujixerox.net>
 <ff71fbf20809152052x163607e4k8bcba0590c997502@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <ff71fbf20809152052x163607e4k8bcba0590c997502@mail.gmail.com>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vimal <j.vimal@gmail.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

> -----Original Message-----
> From: netfilter-owner@vger.kernel.org
> [mailto:netfilter-owner@vger.kernel.org] On Behalf Of Vimal
> Sent: Tuesday, September 16, 2008 11:53 AM
> To: Xu, Qiang (FXSGSC)
> Cc: netfilter@vger.kernel.org
> Subject: Re: iptables not prevent access
>
> Just like you blocked client 119 and it failed, and then you
> tried 120 and it worked; block the gateway and unblock 120.
> If it works from 120, but it doesn't work from 119 (now), it
> means that the request is coming from the gateway for 119.

I just tried "iptables -p tcp -j REJECT -A INPUT -i eth0 -s 13.121.8.0/24 --dport 80", to block 13.121.8.* from accessing 8.106 via WebUI. But the blocking still fails.
:-(
