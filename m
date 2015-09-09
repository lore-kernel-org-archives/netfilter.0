From: Akshat Kakkar <akshat.1984@gmail.com>
Subject: Re: Feature suggestion ...
Date: Wed, 9 Sep 2015 12:05:03 +0530
Message-ID: <CAA5aLPg3hZOctA8VMRtg85L7i7VZ1NCG4yTA2E7HRTk_VcU+6A@mail.gmail.com>
References: <CAA5aLPgmP6hKQasPo+o6oQkZMMtuXieyxCadZ+1dzoaT1HmzkA@mail.gmail.com>
	<alpine.DEB.2.10.1509062024540.12913@blackhole.kfki.hu>
	<CAA5aLPjhXREe9W6fT1oNj=mKV3Yb6CBSLP44do-sgBrhKHa2mA@mail.gmail.com>
	<alpine.DEB.2.10.1509062215520.13557@blackhole.kfki.hu>
	<CAA5aLPi2of6Z4UGmD9pqvcq3hr2HCgVMrK46MxRKDbYL-jwK5w@mail.gmail.com>
	<CAEzD07JL13Pv00-b1B_y2UUK327O91kMMMc157yX6J93M2VPng@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=WnV5/n0mgqZ+enbrUrlyLWmjbhDWjt4v48+00uNrDi8=;
        b=N1K9pLxEUnT6zZF2Mf108cNABxW9a2BL6TnGbT0CoBiQ+1fbqQkmugFgl/DtF7c39g
         /eolgJ5uES2OtLCMF/k/VBXKXDkc8sqZkGjj1qJm7bkb7OW7hCgMO0Z99lvH0QI3ANiT
         poSeqHKiDn0oxInoGADCWtKLsXd7qOj2ngcRA/xImSQAzZzRmaX+BFDFsCWdSDFD5A+n
         LxiRfux0lMYcXZDvHlExLUJipTQ+kF2JJKZsesM8rIHgfDsN3Vc82HY1SJnLyTnN0RSG
         zB2eFYtE3lLPuI/SvV9WTvbKf56htw7UykaVHw1uXMF7660zkFnyZUB45zdsA/A7phEJ
         LrOQ==
In-Reply-To: <CAEzD07JL13Pv00-b1B_y2UUK327O91kMMMc157yX6J93M2VPng@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anton Danilov <littlesmilingcloud@gmail.com>
Cc: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Mon, Sep 7, 2015 at 6:22 PM, Anton Danilov
<littlesmilingcloud@gmail.com> wrote:
> Hello.
> You can use the firewall mark as tc classid with fwmark filter.
> It can interpret fwmark as tc classid. So, you can use this feature
> inside your ipset/iptables/tc rules.
>

Can you provide an example as how fwmark is intrepreted as classid ?
