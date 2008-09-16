From: Vimal <j.vimal@gmail.com>
Subject: Re: iptables not prevent access
Date: Tue, 16 Sep 2008 09:22:54 +0530
Message-ID: <ff71fbf20809152052x163607e4k8bcba0590c997502@mail.gmail.com>
References: <D8C9BC7FFCF8154FB7141EB8DB609C1721725A3FD3@SGPAPHQ-EXSCC01.dc01.fujixerox.net>
	 <9518B26607784D55A361431633134C9B@dcyb.net>
	 <D8C9BC7FFCF8154FB7141EB8DB609C1721725A40CE@SGPAPHQ-EXSCC01.dc01.fujixerox.net>
	 <ff71fbf20809150342u52afb246vbb672cbdf36a43ad@mail.gmail.com>
	 <D8C9BC7FFCF8154FB7141EB8DB609C1721726062EC@SGPAPHQ-EXSCC01.dc01.fujixerox.net>
	 <ff71fbf20809150511g6db0b772o9ebf7fdf54325dac@mail.gmail.com>
	 <D8C9BC7FFCF8154FB7141EB8DB609C17217260693A@SGPAPHQ-EXSCC01.dc01.fujixerox.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=dM/gBkD8BjLcWhyORa8ouzZFJLcODUBnRVD49A8yTHY=;
        b=LWd7RRDUhzsYx2nmbftL1L2ENq1eOedGEwcj2MQ27MhFpGodgDVHcVKH6d0xNpw2ON
         1eDKi7mkCv9WUI9O3Tnoh+6f7oGNOEUzKVfmkPPzFV2K+OGXamf//ftvWeKYAe7I4JYj
         9hvuMEw9BWABKRlvrogeAHDssK6xlnbSbvI/8=
In-Reply-To: <D8C9BC7FFCF8154FB7141EB8DB609C17217260693A@SGPAPHQ-EXSCC01.dc01.fujixerox.net>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Xu, Qiang (FXSGSC)" <Qiang.Xu@fujixerox.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

> This is a good idea. I think you are probably right. The request received by the server perhaps does't come from 119 in the server's eyes, although the webpage IS opened from 119. But the server is a linux environment, and tailored quite a bit to run embedded system software. So apache is not in "usr/local". I've got to try to locate the access log in the printer first.
> :-)

I haven't yet read your previous mails about the routing tables. But,
if you could give this a try, then we can confirm the hypothesis.

Just like you blocked client 119 and it failed, and then you tried 120
and it worked; block the gateway and unblock 120. If it works from
120, but it doesn't work from 119 (now), it means that the request is
coming from the gateway for 119.

-- 
Vimal
