From: Lubomir Rintel <lkundrak@v3.sk>
Subject: Re: conntrack GRE behaves differently in 3.17 / 3.18
Date: Mon, 27 Apr 2015 15:47:47 +0200
Message-ID: <1430142467.3948.14.camel@v3.sk>
References: <1430142363.3948.12.camel@alum.wpi.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1430142363.3948.12.camel@alum.wpi.edu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Neal Murphy <neal.p.murphy@alum.wpi.edu>
Cc: netfilter@vger.kernel.org

On Thu, 2015-01-22 at 18:51 +0000, Neal Murphy wrote:
> On Thursday, January 22, 2015 10:40:20 AM Eliezer Croitoru wrote:
...
> > 
> First deal with packets that are always blocked or may be blocked depending on 
> the current time. REL/EST that get past that are accepted. The remainder are 
> NEW and can be handled as slowly and excruciatingly as desired. Of course, you 
> DROPped INVALID packets very early, in mangle:PREROUTING; it isn't worth 
> wasting even one extra CPU cycle to process those since netfilter has no idea 
> why it received them and has no idea what to do with them. "Thentuwion! Thwow 
> it to the gwound!"

Ah, about eleven, sir!

> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
