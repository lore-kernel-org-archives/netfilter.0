From: DIGVIJAY SINGH <digvijay09020@iiitd.ac.in>
Subject: Re: Build arptables target extension module
Date: Tue, 3 Apr 2012 18:31:00 +0530
Message-ID: <CA+EzgVQ3gawYHdzmi5Leaq4Ax4DZCeNzQr9B5hg55ijeUmVsjw@mail.gmail.com>
References: <CA+EzgVTduzG+RiuAWCWebs002+x_VTLFKk1EXZERABYtBHYrWA@mail.gmail.com>
	<alpine.LNX.2.01.1204031420050.15235@frira.zrqbmnf.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=D1VzfZbZl9G9hmDm7zG3/YIqWRHCy2cfL8rfNR7n4uM=;
        b=X0a5bN3DkxGxoq0CJWXXXrdp3p8UwK4qR3g8jOJ4C8elXS5vvw6zSgXDRyM3uZ8fwN
         kdQ8tB9wBt4TtAI5WONTphrVqSMZbYOVaKFgKXMpr+T8czJrE/6cMJtVj2vvtX0FmBBE
         pgUJ726UNCboFzTi6l7KgNFIiWa3dnUFbt0Co=
In-Reply-To: <alpine.LNX.2.01.1204031420050.15235@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

Hey!
Yea but, in the mconfig file, we need to specify the "type" of the
module. Like match modules have m. What do i do for targets?

Digvijay

On Tue, Apr 3, 2012 at 5:51 PM, Jan Engelhardt <jengelh@medozas.de> wrote:
> On Monday 2012-04-02 19:17, DIGVIJAY SINGH wrote:
>
>>I went through Jengelh Medozas
>>"Writing Netfilter Modules" guide, however it seems have skipped the
>>entire section of how to build the target extension.
>
> Regarding Makefiles, it's obviously the same irrespective of content of
> the .c file.
