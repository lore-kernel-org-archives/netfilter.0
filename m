From: Vinicius Massuchetto <viniciusmassuchetto@gmail.com>
Subject: Re: Can't share ppp internet connection
Date: Mon, 22 Aug 2011 08:27:55 -0300
Message-ID: <CAJ1a921swM2RDS0hn6qfAHoNeWw_LfejOiAzBEYRoFhjw9u-sA@mail.gmail.com>
References: <CAJ1a921b0HqJmUxTfqmsO+RG56w+DS6tBoWWhPBFQb8t2cHQCQ@mail.gmail.com>
 <CAA2qdGWCeRLwrJBrXujXjf_mk=4DQ6GS+KascfZv9=sDSRw=Rg@mail.gmail.com>
 <CAJ1a920B=sXLdAXZ_Oc9MGT=MdPzV4RaWtQpsvfm1HkeX4oP9g@mail.gmail.com>
 <CAA2qdGUa=REEFe3861GoNUwY11yxCxYTJkhuuzSfALdu02vh6Q@mail.gmail.com> <CAJ1a923xODT+mS8EKkTrsWUh8xKNN4yQy3NGRDf7yr_+onV8+w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=nHDjTqInIz3pRfSGu5mCiasYCwXX1VlkAqeB2Yh0yBI=;
        b=aloRbUb2dj2IXGiwUOq9A2abjyRv3gp75e4io+gHzW0aUGTEXBeFE6vSHwQ5D02I4b
         VMg1EqxG8FHXZodoVHb2zjOPaNWi4+P/OBHNxa69JqldTSbmObPA13LLkhVPrigRSNgg
         BNFxmDDI6aG3CBrgnz+gW0Fx0bFr7ySYj1Vyk=
In-Reply-To: <CAJ1a923xODT+mS8EKkTrsWUh8xKNN4yQy3NGRDf7yr_+onV8+w@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pandu Poluan <pandu@poluan.info>
Cc: Netfilter <netfilter@vger.kernel.org>

As I said, this configuration "was working before". The new server I'm
working has the following ethernet card:

13:00.0 Ethernet controller: Atheros Communications AR8152 v2.0 Fast
Ethernet (rev c1)

After testing things again and again experiencing this odd network
behavior, I didn't realize that my kernel version was really old:
2.6.32. This kernel version has a Debian bug [1] that describes
exactly what was happening. All I had to do was upgrade to 3.0.0, that
has a fixed driver for AR8152. Everything works fine now.

I'm really sorry for this inconvenience, as I should have my system
up-to-date before saying "I'm using that distro version".

[1] http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=610474

Thanks everyone for helping.
-- 
Vinicius Massuchetto
