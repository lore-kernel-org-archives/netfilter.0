From: Kristian Evensen <kristian.evensen@gmail.com>
Subject: Re: MASQUERADE/SNAT and multiple interfaces with the same IP
Date: Fri, 16 Aug 2013 13:14:46 +0200
Message-ID: <CAKfDRXgNtPgQjtrSL=oVkws6GB_sTv+h+-_GLVvVvpWoEHBRnw@mail.gmail.com>
References: <CAKfDRXjXkY--PjXAa1m=As+Vf_1__WBokkTAE5BHg+gxsM9Yxw@mail.gmail.com>
	<20130816110443.GB5154@breakpoint.cc>
Mime-Version: 1.0
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=+QBSFXqgX+/6m0UwYtk1FtxPQq0QrG+0Vic240zlWYs=;
        b=bkYlE2idCck8jPywa4SQ4okYx5cAR4tVb3JzI8qcsLOoaMXseIZzayLGB3tx+RNRty
         hhA8jCGUpcdb8IetAFc3dErpFbmVw7oUT+Os6Vf6fZ10XUvbxE9ForFxlM/Kbx9Wi42o
         I21LHuhJw4oPbHI++EI+DM++f6FYfzFjsHSVWEg34ZqhBEu0IOETJBVWvi5kaxxrPfgO
         Z4LQltZa3AaORsLarLhrzdt8aUSKe1A9yCMF+fazYInx/znkvvDPxZdx161WoMHK9oBc
         CCDawrV/Jr/jRmKSzU+1F9r/S9HtqYBNniXwe1VW3jLAvC2jbN+oVKRUAkJCh57lQHhc
         1knA==
In-Reply-To: <20130816110443.GB5154@breakpoint.cc>
Sender: netdev-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Florian Westphal <fw@strlen.de>
Cc: netfilter@vger.kernel.org, netdev@vger.kernel.org

Thank you very much for your reply.

On Fri, Aug 16, 2013 at 1:04 PM, Florian Westphal <fw@strlen.de> wrote:>
> The MASQUERADE target zaps conntracks that it "owned" when the
> associated link goes down, see masq_device_event() in ipt_MASQUERADE.c

I added a pr_info() here to see when this function was called. It is
triggered when the link goes down, as expected, but not when I just
change the mark and move the flows to another interface. I still see
the DESTROY/NEW-behavior though.

> Also, the nat core zaps conntracks when they are sent out on an
> interface other than the original interface.
>
> See nf_nat_oif_changed() in iptable_nat.c

Thanks for letting me know, I will start looking into this function.
Does this mean that even when using SNAT, the old mapping is deleted
and a new created? And does this event not notify conntrack? I have so
far used conntrack -E to monitor changes to nat, but that is perhaps
incorrect?

-Kristian
