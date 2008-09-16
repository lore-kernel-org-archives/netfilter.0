From: "Xu, Qiang (FXSGSC)" <Qiang.Xu@fujixerox.com>
Subject: RE: iptables not prevent access
Date: Tue, 16 Sep 2008 15:28:15 +0800
Message-ID: <D8C9BC7FFCF8154FB7141EB8DB609C172172606D47@SGPAPHQ-EXSCC01.dc01.fujixerox.net>
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
> In fact, try this one too:
>
> * From the client, access the webpage
> * From the server, check the access logs, and see which IP
> had accessed the particular webpage you did in the previous step.

This is really a good suggestion.

> But, what continues to baffle me is the fact that no requests
> were coming from your client's ethernet interface!

It turns out to be the web proxy that does evil behind the scene. Yesterday I thought of it, and modified the field "Do not use proxy server for addresses beginning with" for "8.119". On that machine, I appended ";13.*" into the field, the semicolon in the beginning serves as a separator to what already existed there. But some addresses already existed in the field made it ineffective. So it always didn't work, meaning the traffic to the server "8.106" always went through the proxy server.

Today, a colleague tried to block the telnet port 23, and it was blocked successfully. So the problem was narrowed down to http connection. And he tried to play with various scenarios with or without proxy in use. And he came to a conclusion that something is not quite right with the proxy. After this field is tidied up, blocking works.

Thanks to Vimal, and others who have given suggestions.
Xu Qiang
