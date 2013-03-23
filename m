From: John Lauro <johnalauro@gmail.com>
Subject: Re: Need help with dialup connection (and syn packets)
Date: Sat, 23 Mar 2013 17:11:19 -0400
Message-ID: <CADGd2DrqjdgQ96xxCY+0jt-XjKFhZPceBUSGZSfgu704qcqVVg@mail.gmail.com>
References: <514DD967.1080501@wildgooses.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:in-reply-to:references:date:message-id
         :subject:from:to:cc:content-type;
        bh=pAx/9nmIun7ytm99T4ZiX2CTYjb3q4nyulPMYWHY42E=;
        b=sZigyK/BL+m3LhYkpbS8VjCfId9ltjU+LCrQ6MIYLQ5VdeLdPUmX6XHnwQnPofXYr1
         evMZtyHYyAj0fFohKYc6FKbQnFQKcFGjS9HvtmOufteZ/sXCMVkz0vFCpabQLf26Jr39
         ztIBQiLlyJm3uAwzJIecAHSv7xS8eVFOJ4ra2izmmrKpVSLz2lwIzLorZBKD4lw2fKXc
         QadgIgT1LN+P6HRi7vxuXFvovGVNBbEfiKIFRWSM0FwU8byv34Gn3NnifacsjxOtvKgP
         oUB8GNw7NPwDMsq9tywwoGvbXMACstmays2An68NjJeE76Ap9IsammHKOmNW5jFA0nun
         a0HQ==
In-Reply-To: <514DD967.1080501@wildgooses.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ed W <lists@wildgooses.com>
Cc: netfilter@vger.kernel.org

Sounds like the main problem is your aggressive hangup due to
inactivity.  It should be at least 4 times as the connect time, not
under half!.  I suggest 6 minutes, but at least 2 minutes.

If you can't adjust that, probably the next best alternative is a
pre-emptive ping or something to wake up the modem about 25 seconds
before you want to connect, or just ping every 5 seconds until you get
a successful response

On Sat, Mar 23, 2013 at 12:33 PM, Ed W <lists@wildgooses.com> wrote:
> Hi, I have a dialup connection (yes they still exist) and PPP with demand
> dial.  I have a problem with the exponential backoff sending new SYN packets
> when creating a new tcp connection. The problem is that the dialup
> connection takes around 23 seconds to complete (and then hangs up 10 seconds
> later due to inactivitity), but by then the gaps between SYN packets is very
> long...
>
> Unfortunately most operating systems send an initial SYN, then exponentially
> backoff with intermittent resends, say after 1 sec, 2 secs, 4 secs, 8 secs,
> 16 secs, etc.  So what we observe is that because the dialup connection
> takes so long to complete, by then the tcp connection is only trying quite
> intermittently to connect, eg you might well wait another 8+ seconds before
> the next syn is resent, quite easily my demand dial connection will hangup
> before the retransmit is even fired...
>
> Does anyone have any suggestions on how I might fake this a little? I
> effectively desire to simulate buffering syn packets before the PPP
> connection comes up?
>
> Thanks for any off the wall thoughts...
>
> Ed W
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
