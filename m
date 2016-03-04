From: Sebastian Damm <damm@sipgate.de>
Subject: Re: "Operation not permitted" from nf_conntrack under high UDP load
Date: Fri, 4 Mar 2016 08:34:54 +0100
Message-ID: <CABkWSFwxnoM7kHAKApPi=xEJ4zhPmuGTwsj=BzdsRL=D+hZ+cw@mail.gmail.com>
References: <CABkWSFxpuoGST0CuSrYKb15dOixPvJ0aCzQof2A7aXqY_06_PA@mail.gmail.com>
 <56D90832.7020009@hallowe.lt>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sipgate-de.20150623.gappssmtp.com; s=20150623;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=JiRsFigPY3VkH5XySPO7lPJ/qjh9TTR4YIcjW0KaUes=;
        b=y2TQQ+J0m34pwxnfnkatpCKTDYihTQ+B4RJirzkMch9SaimXRSIkcXMEu6SX1v6spB
         8NkWOqMD7ytOfDtZ6kXtpVLJyY1HVx3TBitFUy6b8JNQWc23H02nksmQKaOPv01G0z+9
         qDsOYcv51WPWXtUL7zP4DyUyWpVlivqTtY8JPWNDFPdKQcEv+VEl18PBadONByVjD3Ox
         qsUwVvnqBS0Kaj2b8cV9W3mn97JFFC71Uw9aSlQlSAmHUAf0ZZNcmxdCSey0sMh4wu/b
         LfBhAl76R+PvliG15ajdptk6T5hcZaBzm8aWX5BZpL0not4rdt7mDZnnByKwnTijd4pZ
         fCJQ==
In-Reply-To: <56D90832.7020009@hallowe.lt>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi Kevin,

On Fri, Mar 4, 2016 at 4:59 AM, Kevin Holly <root@hallowe.lt> wrote:
> you might want to check your system logs for messages similar to "ip_conntrack: table full, dropping packet." because for me this sounds like a problem with the size of the connection tracking table not being large enough for the number of connections you're dealing there.

As I wrote, we have a max for the connection tracking table of 800k
set, and it is filled with about 300k entries, so this is definitely
not the problem. We also don't see those log messages you mentioned. I
was aware of those, and I've seen them before on other systems, but on
this machine, this is definitely not the problem.

Any other hints, anyone?

Best Regards,
Sebastian
