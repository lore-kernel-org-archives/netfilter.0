From: =?UTF-8?B?WXVjb25nIFN1biAo5Y+26Zuo6aOeKQ==?= <sunyucong@gmail.com>
Subject: Re: iptables hashlimit question
Date: Sat, 9 Jun 2012 14:11:03 -0700
Message-ID: <CAJygYd1vCtsFnss+LVHE2DKZYNcdcu4HEXbSV+E4Gz8zDsHz1Q@mail.gmail.com>
References: <CAJygYd1qba-vxbCqtBB2k_XrL4GSz_ysDrDOJ96VSk5uCbo7cQ@mail.gmail.com>
 <4FD39EA2.20302@evcz.tk>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=LNe+JNcJn7a0lVj8jJ1bVNFUhRvMKy+InEiXRTS9XU4=;
        b=Dk0xwrsrikqO0N5gxDdtx0clX2jZV9lLQ63SvbWBwaBvQm3eaqSQCW1PrdruQ2q2Hy
         L1rAQ7D9AFDu+IABy2EJnzGtOvWLkCkBQyqnD0msKk8H5G0HDHg9rekIr+9LrFJC8sHv
         NtkAkbHkck104CiiE29AAvwRyqmMgUsAvtcVKkpQiA8UgH95XC985uyElliK9H+Hj3j9
         m6f41+iINnuU+T26oZXrD7Ui1a/t9Qkbwj2Qf7P5/5HoSx9kybxSsYw5wlmCPeVPd2AL
         vfKRUHpEa0aqNkuLyMMw/ZDuA14oO8ci9LPm59PjdimoLLkp1Ll3HvTVzcnCMC5G2rhn
         u9BA==
In-Reply-To: <4FD39EA2.20302@evcz.tk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marco Padovan <evcz@evcz.tk>
Cc: netfilter@vger.kernel.org

Thanks! However when i was reading xt_hashlimit.c , it notice that it
is actually doing credit = cfg.avg * cfg.burst  , how would that work?

Also, I just want to confirm that this rule is packet by packet
matching, right? i have all traffic under NOTRACK.

Thanks.
