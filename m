From: "ArcosCom Linux User" <linux@arcoscom.com>
Subject: Re: IPMARK
Date: Thu, 18 Sep 2008 11:06:12 +0200 (CEST)
Message-ID: <ab7c86db305dee20fc2b059a44ef302a.squirrel@www.arcoscom.com>
References: <397309.80901.qm@web37302.mail.mud.yahoo.com>
Reply-To: linux@arcoscom.com
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <397309.80901.qm@web37302.mail.mud.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Why you want to use IPMARK?

If you only want traffic priorization, perhaps you are looking for
"wondershapper":
   http://lartc.org/wondershaper/
   http://freshmeat.net/projects/wshaper/

Or take a view into:

http://lartc.org/howto/lartc.cookbook.ultimate-tc.html

Another project you can take a view (and is more recent), is this:

http://www.adsl-optimizer.dk/

Regards

El Jue, 18 de Septiembre de 2008, 10:30, Jason Cosby escribi=F3:
> All,
>
> Sorry to post here, but the LARTC list has gone belly up. I have a LA=
N of
> 35 with IPs from 192.168.1.6 thru 192.168.1.40 sharing a satellite li=
nk. I
> need to limit total bandwidth to 512Kbps and divide it evenly between=
 all
> 35 clients. My plan is to create 35 individual queues and allow 100%
> borrowing so that the queues don't have to constantly be deleted/recr=
eated
> upon user enter/exit. All traffic is run through NAT at the gateway
> computer.
>
> I see using IPMARK as the way to go, but am not clear how to put it
> together. The documentation doesn't quite clear it up for me. Can any=
one
> help me get together a simple down and dirty script to do as I descri=
bed?
> Once I get the network under control a bit I will continue implementi=
ng
> proper QOS. If I don't get a handle on this soon I will be tarred,
> feathered, and thrown in the desert to rot (almost), so any help is
> GREATLY appreciated.
>
> Thanks,
> Jason
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>


