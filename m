From: =?UTF-8?B?WXVjb25nIFN1biAo5Y+26Zuo6aOeKQ==?= <sunyucong@gmail.com>
Subject: Re: conntrackd and TCP flow recovery
Date: Wed, 18 Jul 2012 01:17:55 -0700
Message-ID: <CAJygYd1uK29fk0LRtEMUZ5keRnXGMFpRU0G9fQcTPk+tRmC40A@mail.gmail.com>
References: <CANaOheZh5o_XY+nyyguo6PjYn00-fmS79ypTybCosEFmB0Qypg@mail.gmail.com>
 <515168F006F2D643952F8FFD24F2E073016D566704@sonne2.gw.bringe.net> <CANaOheYxQb0QC4g1VbWYNtv_uc8-TE0qmxv8BFp1Kp3p4KEq7Q@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=AXpZSGjQhzo58IqQTbymepJquz2YCOzJWnsbqT+/e1Q=;
        b=V4ncyp8foW+v6QHANoRamXYw/5p0550B6rLVpI7xtgx+EgtoN65elJGqVbVL9ALGqp
         t8mCcGHBgs9GDhpyLBkIP4/6dsnVL3YzM9auHuJSOVMPUnlQzFGikMj7sNH/pEhi7CUK
         AM3j0GeiCNPWWDdqWp5uL9xksFDA6AaJ4OXT37iRSUggubcrDbBVcs9ScC+PO8qZrn1p
         kXxFiFq7QafRK0wW+PVExfXLRK/M8EY1OcHSIUEwFvyt1EPCMR4oOsa8WryOYk0F9u6D
         3S9UMISn542ckbE3tLaFstFrwkWFvRuBLUAY0gi2jTRjT9WfIFlpoIEacWdK8wFwRLZJ
         f7PA==
In-Reply-To: <CANaOheYxQb0QC4g1VbWYNtv_uc8-TE0qmxv8BFp1Kp3p4KEq7Q@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kay <kay.diam@gmail.com>
Cc: netfilter@vger.kernel.org

I know what you mean, and I said in my email , this is what I see most
close to it.

http://dragon.linux-vs.org/~dragonfly/htm/tcpha.htm

On Wed, Jul 18, 2012 at 1:13 AM, kay <kay.diam@gmail.com> wrote:
>
> That is what I am trying to achieve. Fake TCP handshake with automatic
> TCP session recovery once traffic goes to web2.
>
> >  how could it, without the tcp handshake?
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
