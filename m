From: Marius Nicolae <marius.e.nicolae@gmail.com>
Subject: Re: Filtering pppoed frames
Date: Mon, 19 Dec 2011 10:03:09 +0200
Message-ID: <CAKEn5-LbLfG_cGvzE5h+hw91JRWq_ArXtCUzppwiaCZzbffqPA@mail.gmail.com>
References: <CAKEn5-LiE2Dv0zw_8JREHoyT1DHwQ17EirqGPsykU3GkX9XfvA@mail.gmail.com>
	<4EEA61F1.9020709@ukfsn.org>
	<CAKEn5-Kmc=OUcThwX8DeZGNzfQ-C6Zj-=siF0okA87Fb25=FxQ@mail.gmail.com>
	<CAKEn5-J95Qu_Hx8bHk3F-Kde7BhGjg6W9hK=7p8CA5uOMujgRQ@mail.gmail.com>
	<4EEBA002.4030402@ukfsn.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=Y0NZ8JM5kip/kGrdQkXILFW2ZjkTj2B7GMvXQRtBbx0=;
        b=CxXvdttdT6NpoapmnPd8rpjCtoaTO8X2N/dcxqCTzoJNQhzDLEaToY6F4FZjZWtU1s
         CgsV0r9kPpQvcEx/O7942XgH8Sw80Ake23C7kA2lNvsq5tLDz8CAQcPPXwbORsN9JEKk
         /9vdl2RNdQ+0t2I04+2HrXn/VSVgO/yeB760I=
In-Reply-To: <4EEBA002.4030402@ukfsn.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andy Furniss <andyqos@ukfsn.org>
Cc: netfilter@vger.kernel.org

Hi Andy,

On Fri, Dec 16, 2011 at 9:46 PM, Andy Furniss <andyqos@ukfsn.org> wrote:
> Marius Nicolae wrote:
>
>>> If you can't identify from the frame alone and need state from the pppoe
>>> server or some statistics then it's going to be trickier.
>>
>> Yes, is possible to identify the frames alone from macs and ethernet
>> protocol only, in a stateless manner, but it must be rejected only the
>> "noisy" macs. As a very simplistic description the pppoed protocol is
>> used to create and terminate pppoe sessions (frames with 0x8864
>> ethernet protocol) which encapsulates IP frames by signing and even
>> encrypting them. Thus is very important to let the good and legitimate
>> macs to send/receive such frames in order to create/terminate pppoe
>> sessions.
>
>
> The only tc thing I can think of would be to keep a list of bad macs - maybe
> from a script parsing pppoe server logs or something and then periodically
> replace a tc filter that matches and drops those macs + protocol 0x8864.
Good idea. Another thing I can think of based on what you've said
would be to perform ingress policing and to assure a very small amount
of bandwidth for such frames. Everything which would exceed that
amount would be dropped. Simply put, the idea is to drop the frames
based on their generated traffic and not based on their number
(packets/second).

Currently I'm learning the Linux kernel network stack internals and
see if there is a more robust solution. I think netfilter is a no go.
It refers to IP packets (I guess its name mislead me) and it is placed
to high on the network stack. It appears it's needed a kernel module
right after device driver which register for a specific ethernet
protocol (with dev_add_pack() ) and receives the frames it registered
for. I've just found a good article as a starting point just for that
http://www.phrack.org/archives/55/p55_0x0c_Building Into The Linux
Network Layer_by_lifeline & kossak.txt . pppoe kernel module also
register for receiving such frames. Another idea would be to see if is
possible to investigate packets from there.
-- 
Best regards,
Marius Nicolae
