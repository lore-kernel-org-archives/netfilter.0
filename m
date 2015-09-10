From: Akshat Kakkar <akshat.1984@gmail.com>
Subject: Re: Feature suggestion ...
Date: Thu, 10 Sep 2015 15:50:02 +0530
Message-ID: <CAA5aLPjLFNhsAwP8uLVq=v-gNYaa6uU17Yqh8ikYwfPXEuQUww@mail.gmail.com>
References: <CAA5aLPgmP6hKQasPo+o6oQkZMMtuXieyxCadZ+1dzoaT1HmzkA@mail.gmail.com>
	<alpine.DEB.2.10.1509062024540.12913@blackhole.kfki.hu>
	<CAA5aLPjhXREe9W6fT1oNj=mKV3Yb6CBSLP44do-sgBrhKHa2mA@mail.gmail.com>
	<alpine.DEB.2.10.1509062215520.13557@blackhole.kfki.hu>
	<CAA5aLPi2of6Z4UGmD9pqvcq3hr2HCgVMrK46MxRKDbYL-jwK5w@mail.gmail.com>
	<CAEzD07JL13Pv00-b1B_y2UUK327O91kMMMc157yX6J93M2VPng@mail.gmail.com>
	<CAA5aLPg3hZOctA8VMRtg85L7i7VZ1NCG4yTA2E7HRTk_VcU+6A@mail.gmail.com>
	<CAEzD07JQYbtrjBr18=zS0vGMKhFXL52YVcaf3FJqa1Z3TaYZsw@mail.gmail.com>
	<CAA5aLPi3AuC3m0cZgU1wZ3_U=wQoL29tUjVjX9DYO1gU_bjMAw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type;
        bh=ExXonLf7RrFBgQvmjImm9qBGmRP6Oan0VvBsVP0qTOE=;
        b=GMIxAw3nuqL7PJPkH3aXlDxZ3fhFUN0Nx1QUR7Jd66zQ7itdO0mgzgW1RYMkIN6gzD
         LNzFQuKfi+vKzwITPSEiw7fKkGTfmPapF/YeTj7rBgpunykgReJNNGefjS/dqxfc6cmT
         egzkdiR8tr1ucD1Sg9H/FbSPp4AcOLqzbQ/qMnIWzbuXwBBxAIsUjF3n4Bju6JXh2+1I
         8jQMpN1EyYabqRn+bSU6eUZObg9vdr+rvwQThTQPiEX6MooYxy3BsveudTvt72Dd4wcl
         dWx8fdBlELEsWDuCCopG2Ox2QM++7RHS5Q6iSo2IE3Vvas2/BYcGv6ZOd+hD+UAPzG8D
         6IJg==
In-Reply-To: <CAA5aLPi3AuC3m0cZgU1wZ3_U=wQoL29tUjVjX9DYO1gU_bjMAw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anton Danilov <littlesmilingcloud@gmail.com>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

>> Without any options fw classifier maps fwmark to classid.
>>
>> tc filter add dev <iface> parent <qhandle> protocol ip prio 1 fw

What if the packet has fwmark and skbprio set?
