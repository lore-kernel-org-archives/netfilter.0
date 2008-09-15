From: "Xu, Qiang (FXSGSC)" <Qiang.Xu@fujixerox.com>
Subject: RE: iptables not prevent access
Date: Mon, 15 Sep 2008 19:14:59 +0800
Message-ID: <D8C9BC7FFCF8154FB7141EB8DB609C1721726062E3@SGPAPHQ-EXSCC01.dc01.fujixerox.net>
References: <D8C9BC7FFCF8154FB7141EB8DB609C1721725A3FD3@SGPAPHQ-EXSCC01.dc01.fujixerox.net>
	 <9518B26607784D55A361431633134C9B@dcyb.net>
	 <D8C9BC7FFCF8154FB7141EB8DB609C1721725A40CE@SGPAPHQ-EXSCC01.dc01.fujixerox.net>
 <ff71fbf20809150342u52afb246vbb672cbdf36a43ad@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <ff71fbf20809150342u52afb246vbb672cbdf36a43ad@mail.gmail.com>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vimal <j.vimal@gmail.com>
Cc: Rob Sterenborg <rob@sterenborg.info>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

> -----Original Message-----
> From: Vimal [mailto:j.vimal@gmail.com]
> Sent: Monday, September 15, 2008 6:42 PM
> To: Xu, Qiang (FXSGSC)
> Cc: Rob Sterenborg; netfilter@vger.kernel.org
> Subject: Re: iptables not prevent access
>
> > What's strange is that, when I run the same command to
> other machines, say 13.121.8.120, the http access is
> successfully rejected. Does that mean something wrong with
> the network configuration of the machine 13.121.8.119? What
> is the possible cause of that behavior?
> >
>
> This could have been possible only if the rule doesn't match it.
> Let's look at the rule:
>
> * -i eth0 ... If this doesn't match, it means that there is
> some other routing going on that uses another interface to
> route the packet to this particular IP address. Try pasting
> the routing table here, so that we can see.

How to find the routing table? 13.121.8.119 is a Windows 2003 Server OS.

> * -p tcp ... This has to be matched :)
> * --dport=80 ... Unless you're running the webserver on some
> other port, this is likely to match as well.

These two should have no problem. The web server is run on port 80.

> So, it looks like the packet isn't arriving via interface eth0.

Looks like so. But from what I see, 13.121.8.119 has only one network card. Is it possible that it has interfaces other than eth0?

> You might have done the network trace on one interface. How
> many interfaces are there:
> * On the server
> * On the client (13.121.8.119)

There is definitely only one interface on the server (13.121.8.106), and from the network configuration, I see that 13.121.8.119 (the client) has only one network card. Does this mean it has only one ethernet interface?

> What is the server IP address?

13.121.8.106

> From what you say, it looks like 13.121.8.119 and the server
> have established contact via an interface that is other than eth0.

Yep, looks like so. But I have no clear proof of it. I have got some screen captures of the network settings of 13.121.8.119. Can I send them to you guys as attachments?

Thanks a lot,
Xu Qiang
