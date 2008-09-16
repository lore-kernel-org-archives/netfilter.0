From: "Xu, Qiang (FXSGSC)" <Qiang.Xu@fujixerox.com>
Subject: RE: iptables not prevent access
Date: Tue, 16 Sep 2008 11:45:10 +0800
Message-ID: <D8C9BC7FFCF8154FB7141EB8DB609C17217260693A@SGPAPHQ-EXSCC01.dc01.fujixerox.net>
References: <D8C9BC7FFCF8154FB7141EB8DB609C1721725A3FD3@SGPAPHQ-EXSCC01.dc01.fujixerox.net>
	 <9518B26607784D55A361431633134C9B@dcyb.net>
	 <D8C9BC7FFCF8154FB7141EB8DB609C1721725A40CE@SGPAPHQ-EXSCC01.dc01.fujixerox.net>
	 <ff71fbf20809150342u52afb246vbb672cbdf36a43ad@mail.gmail.com>
	 <D8C9BC7FFCF8154FB7141EB8DB609C1721726062EC@SGPAPHQ-EXSCC01.dc01.fujixerox.net>
 <ff71fbf20809150511g6db0b772o9ebf7fdf54325dac@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <ff71fbf20809150511g6db0b772o9ebf7fdf54325dac@mail.gmail.com>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vimal <j.vimal@gmail.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

> -----Original Message-----
> From: Vimal [mailto:j.vimal@gmail.com]
> Sent: Monday, September 15, 2008 8:12 PM
> To: Xu, Qiang (FXSGSC)
> Cc: netfilter@vger.kernel.org
> Subject: Re: iptables not prevent access
>
> * From the client, access the webpage
> * From the server, check the access logs, and see which IP
> had accessed the particular webpage you did in the previous step.
>
> The two should be equal.

This is a good idea. I think you are probably right. The request received by the server perhaps does't come from 119 in the server's eyes, although the webpage IS opened from 119. But the server is a linux environment, and tailored quite a bit to run embedded system software. So apache is not in "usr/local". I've got to try to locate the access log in the printer first.
:-)

> But, what continues to baffle me is the fact that no requests
> were coming from your client's ethernet interface!

Me, too.

Thanks,
Xu Qiang
