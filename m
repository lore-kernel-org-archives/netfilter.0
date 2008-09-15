From: Vimal <j.vimal@gmail.com>
Subject: Re: iptables not prevent access
Date: Mon, 15 Sep 2008 17:36:20 +0530
Message-ID: <ff71fbf20809150506o20814abfid25565078f711b95@mail.gmail.com>
References: <D8C9BC7FFCF8154FB7141EB8DB609C1721725A3FD3@SGPAPHQ-EXSCC01.dc01.fujixerox.net>
	 <9518B26607784D55A361431633134C9B@dcyb.net>
	 <D8C9BC7FFCF8154FB7141EB8DB609C1721725A40CE@SGPAPHQ-EXSCC01.dc01.fujixerox.net>
	 <ff71fbf20809150342u52afb246vbb672cbdf36a43ad@mail.gmail.com>
	 <D8C9BC7FFCF8154FB7141EB8DB609C1721726062E3@SGPAPHQ-EXSCC01.dc01.fujixerox.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=eYwRaCJCVzZ4dkSnYJSBkBcDRwUCRZVaORkZltdCYd4=;
        b=p3kRLIrYErsUyC7mC0qnoxbsXi/ndS5DAV1qoJ5Wc92PGx2Sk/cgm4Iq9VCHV+ED82
         raWGXDjH+Ixtx5ubXhQOhtH3otWiXkawkVyrXMBTPcn97Y3oyA4A+yemZJX8uF0Mn2uV
         YIZLATB4gmhDlyMNQ83aoLl7S6sLrTUCt2yvI=
In-Reply-To: <D8C9BC7FFCF8154FB7141EB8DB609C1721726062E3@SGPAPHQ-EXSCC01.dc01.fujixerox.net>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Xu, Qiang (FXSGSC)" <Qiang.Xu@fujixerox.com>
Cc: Rob Sterenborg <rob@sterenborg.info>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

> How to find the routing table? 13.121.8.119 is a Windows 2003 Server OS.

As someone mentioned on this thread, use: netstat -nr and paste the output here.

>
>> So, it looks like the packet isn't arriving via interface eth0.
>
> Looks like so. But from what I see, 13.121.8.119 has only one network card. Is it possible that it has interfaces other than eth0?

Hmmm... Could you paste the output of an ifconfig equivalent program?
I am not sure what it is on Windows (ipconfig, maybe?). But, this will
show all the network interfaces.

You did mention that you ran a network packet capturing program. Could
you run it on _all_ interfaces?

(Just a wild guess) One other possibility is that your server == your
client (13.121.8.119). In this case, all packets are routed via lo,
and not via eth0. :) Can you type: http://127.0.0.1 in your browser to
see if you can access the website?

>
> Yep, looks like so. But I have no clear proof of it. I have got some screen captures of the network settings of 13.121.8.119. Can I send them to you guys as attachments?
>

Could you try this:

* Run the sniffing software on the client, capturing _all_ packets
(without any filter) and on _all_ interfaces.
* From the client (119) access the server webpage.
* See what you get on the client side.

I hope I wasn't too confusing.

-- 
Vimal
