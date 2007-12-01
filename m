From: "G.W. Haywood" <ged@jubileegroup.co.uk>
Subject: Re: Text based filesystem interfaces (instead of netlink)
Date: Sat, 1 Dec 2007 22:05:47 +0000 (GMT)
Message-ID: <Pine.LNX.4.58.0712012204550.32465@mail3.jubileegroup.co.uk>
References: <20071130115747.GB28817@nibiru.local>
 <Pine.LNX.4.58.0711301242030.11051@mail3.jubileegroup.co.uk>
 <20071201193243.GA12864@nibiru.local>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20071201193243.GA12864@nibiru.local>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Enrico Weigelt <weigelt@metux.de>
Cc: netfilter team <netfilter@vger.kernel.org>

Hi there,

On Sat, 1 Dec 2007, Enrico Weigelt wrote:

> * G.W. Haywood <ged@jubileegroup.co.uk> wrote:
> >
> > On Fri, 30 Nov 2007, Enrico Weigelt wrote:
> >
> > > ... I wondered why netfilter doesn't do the kernel interface
> > > entirely via an synthetic filesystem (or maybe within sysfs).  ...
> >
> > Performance?
>
> Really ?
> How often are the netfilter rules touched ? More than once a day ?
> And is it really that much more expensive to call sscanf() than
> first creating the netlink packages and later parsing them again ?

It was just a suggestion.

http://lists.netfilter.org/pipermail/netfilter/2007-July/069325.html

--

73,
Ged.
