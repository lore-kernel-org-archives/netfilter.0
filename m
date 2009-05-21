From: Anatoly Muliarski <x86ever@gmail.com>
Subject: Re: tc and priority
Date: Thu, 21 May 2009 09:53:45 +0300
Message-ID: <38db14850905202353r3c494d15se7f53f4b508f1ba0@mail.gmail.com>
References: <4A142FF7.1050700@duet.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=e2wIcde21T6KVxvShszzBRCQL2VRjNo8TO/qIGM56zM=;
        b=Sj+9E1z4VrerikyUpHmIsBTpDBb8U4xDC0d/SKHt2cWtos07bt0WUFBqQkC2SSHF6W
         8Ua7HXfRdfrDmPuE1cbLtFr/AkJ90Umvv+ekYCVajvpkqJAbipYTKRYYBtAOl01R03Dr
         B6X77+10X42GniiOef7roZFA+Yw2QGLclzuVk=
In-Reply-To: <4A142FF7.1050700@duet.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Fabio Marcone <fabio.marcone@duet.it>
Cc: netfilter@vger.kernel.org

Hi Fabio,

You should do something like this:

tc qdisc add dev eth0 root handle 1: prio bands 3
tc qdisc add dev eth0 parent 1:1 handle 2 sfq perturb 10
tc qdisc add dev eth0 parent 1:2 handle 3 sfq perturb 10
tc qdisc add dev eth0 parent 1:3 handle 4 sfq perturb 10
tc filter add dev eth0 protocol ip parent 1: prio 1 <your
criteria_high> flowid 1:1
tc filter add dev eth0 protocol ip parent 1: prio 2 <your
criteria_middle> flowid 1:2
tc filter add dev eth0 protocol ip parent 1: prio 3 <your
criteria_low> flowid 1:3

That works in my system.


2009/5/20, Fabio Marcone <fabio.marcone@duet.it>:
> Hi all,
> I'm studying traffic shaping and I need some informations.
> I studied HTB and I had no problem to limit bandwidth (with and without
> borrowing). Then I would undestand how assign different priorities to
> packets: I test qdisc PRIO and prio paramenter in CBQ (and HTB) but without
> success.
>
> with CBQ, I create 2 two classes with different priority and I filter
> traffic to send different traffic (source port) to a particular queue. Then
> I run 2 connections having different priority and I see that a connection
> stalls and the other uses all bandwidth then it succeeds the opposite.
>
> The same behaviour I see using PRIO qdisc.
>
> Instead, I would get that che higher priority connection uses all bandwidth
> until its queue is full (so che lower priority  connection waits until the
> other finish).
> What's wrong? Suggestions?
>
> Thanks,
> Fabio

-- 
Best regards
Anatoly Muliarski
