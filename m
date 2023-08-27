From: Duncan Roe <duncan_roe@optusnet.com.au>
Subject: Re: Extending an IPv4 filter to IPv6
Date: Mon, 28 Aug 2023 04:58:09 +1000
Message-ID: <ZOucwX7c4k7+uaoF@slk15.local.net>
References: <9d98b203-b22a-898c-1a4f-c83e706bc411@tana.it>
 <ZOKIl6qWCdLCTPPT@calendula>
 <29680eb6-1004-f1af-38bb-f9da49712d58@tana.it>
 <ZOO2q6mJZQZR+QM7@calendula>
 <b736646f-016d-3775-fa06-2babf1612dc1@tana.it>
 <ZOsKgctjEQWSARet@slk15.local.net>
 <279a392a-31e0-cfcb-3d28-d0bca7c239ea@tana.it>
Reply-To: duncan_roe@optusnet.com.au
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693162693; x=1693767493;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:reply-to:message-id:subject:to:date:from:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/15Uo9rH8RY+MudCak4v8x1gFERDfejpZeileLukKyQ=;
        b=a3mxmzDwu+rHEl6YfNoIn3CUrSDt+JArtg2ffvyVIlKr3B5oRSWZVTZcVHVeSVYwXh
         cHrDg11jADoVfcqdlvlUCFdLdXVO+LrWl1s3l8gBKxHQTO8tNsYaq4jNNvNyr6s6qEA8
         zWs81fJ9oKAZndsjkJ1Rl1e0dhjc4k9XzOWZMKauVrbkcOT+ak3mhyywvDpHDdNRvFXb
         kE/KMDeokrm2/RdhiE6YHc0BUDkPVj9ApXjo10Q4mmoawQQmsURjrnc4ydf2ICDfkDhI
         TDiWjmTStpb9RQixxpJpnhXWGxX2mtgviG/80aNWWTjM5o/I5D5hLdJiqKf0Xmvrg14W
         X6Sw==
Sender: Duncan Roe <duncan.roe2@gmail.com>
Content-Disposition: inline
In-Reply-To: <279a392a-31e0-cfcb-3d28-d0bca7c239ea@tana.it>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Sun, Aug 27, 2023 at 07:20:45PM +0200, Alessandro Vesely wrote:
> On Sun 27/Aug/2023 10:34:09 +0200 Duncan Roe wrote:
> > > It seems a buffer can contain several packets.  Is that related with the
> > > queue maxlen?
> > >
> > man 7 netlink will tell you that netlink messages may be batched.
>
>
> Thanks for the pointer, I hadn't noticed it.
>
>
> > This is straightforward to observe in a libnetfilter_log program under gdb. >
> > However libnetfilter_queue programs never get batched netlink messages. So the
> > callback isn't strictly necessary but it would mean extra code to special-case
> > libnetfilter_queue (among all the other netfilter libraries) so it's been left
> > there.
> >
> > If you rely on this behaviour it might be prudent to check that bytes read ==
> > *(struct nlmsghdr *)buf.nlmsg_len.
> >
> > > > You can obtain the packet payload length via:
> > > >
> > > >           len = mnl_attr_get_payload_len(attr[NFQA_PAYLOAD]);
> > >
> > > And this should be the length specified with NFQNL_COPY_PACKET (or less), correct?
> > >
> > You can check for packet truncation by checking `len` above against what you
> > actually received.
>
>
> I'll try.  However, I'd never know if my test conditions equal what can
> happen at runtime.  As I only look at addresses, it's fine to truncate
> packets at that length.
>
> I just want to minimize memory footprint, but without hampering performance.
>
You definitely want to use the new pktb_setup_raw() function then. git clone or
fork the repo at https://git.netfilter.org/libnetfilter_queue/

Cheers ... Duncan.
>
> Thanks
> Ale
