From: Enrico Weigelt <weigelt@metux.de>
Subject: Re: Text based filesystem interfaces (instead of netlink)
Date: Sat, 1 Dec 2007 20:32:43 +0100
Message-ID: <20071201193243.GA12864@nibiru.local>
References: <20071130115747.GB28817@nibiru.local> <Pine.LNX.4.58.0711301242030.11051@mail3.jubileegroup.co.uk>
Reply-To: weigelt@metux.de
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.58.0711301242030.11051@mail3.jubileegroup.co.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter team <netfilter@vger.kernel.org>

* G.W. Haywood <ged@jubileegroup.co.uk> wrote:
> Hi there,
> 
> On Fri, 30 Nov 2007, Enrico Weigelt wrote:
> 
> > ... I wondered why netfilter doesn't do the kernel interface
> > entirely via an synthetic filesystem (or maybe within sysfs).  ...
> 
> Performance?

Really ? 
How often are the netfilter rules touched ? More than once a day ? 
And is it really that much more expensive to call sscanf() than
first creating the netlink packages and later parsing them again ?


cu
-- 
---------------------------------------------------------------------
 Enrico Weigelt    ==   metux IT service - http://www.metux.de/
---------------------------------------------------------------------
 Please visit the OpenSource QM Taskforce:
 	http://wiki.metux.de/public/OpenSource_QM_Taskforce
 Patches / Fixes for a lot dozens of packages in dozens of versions:
	http://patches.metux.de/
---------------------------------------------------------------------
