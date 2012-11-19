From: Ricardo Klein <klein.rfk@gmail.com>
Subject: Re: [ANNOUNCE] ipset 6.15 released
Date: Mon, 19 Nov 2012 16:31:59 -0200
Message-ID: <CADuigkV+d=xvKvKODTyA8avp21ZcL0pY0TjhxAehQi975wkwdQ@mail.gmail.com>
References: <alpine.DEB.2.00.1211191356240.21756@blackhole.kfki.hu>
	<CADuigkXXwhGkjYVCo68BmOGSbe95DzSYcM6u-YQmrjKSD5VWaQ@mail.gmail.com>
	<alpine.LNX.2.01.1211191927160.9275@nerf07.vanv.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=d4UOitXypGEuY3DE2EUtd1cw0/h0aUECb9MO8I6r4TY=;
        b=zKgiFFCsDb7aT/5uUVofO/1IIT3cQa5PKbbRJd1ajMEW1PyIrjMVI0eSXDLo/BkVX6
         FP4UkAhflV0KaaS5x3E89uu05COUelcvwMA6O6VIZwOmImMFi09YzcqquY26IqfE1pVm
         VitERvOD8p4iuwlf6gv5X/E1URePd4ZRxpzkredOTtUvt+N9vP/eAXKtwChaZCHSRaJ0
         DIAdaTFvSmWsBdV5lRao/5+sP5btIb0GjAuBATt55onrmlpIakYs9MFyLqwqqmv9moFs
         eIYG/94n8pFCmsa1Eyu9yIzSVmvzDjxLdSpu13eyqDZESYy5AFBpqrH6CjkCHw/uklKk
         RXhQ==
In-Reply-To: <alpine.LNX.2.01.1211191927160.9275@nerf07.vanv.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@inai.de>
Cc: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

if  you need, I can deploy a clean CentOS 6.3 64bits and test it again
running autogen with pkg-config installed....
--
Att...

Ricardo Felipe Klein
klein.rfk@gmail.com


On Mon, Nov 19, 2012 at 4:28 PM, Jan Engelhardt <jengelh@inai.de> wrote:
> On Monday 2012-11-19 18:39, Ricardo Klein wrote:
>
>>It fails on ./configure on CentOS 6.3 x84_64 with the message:
>>./configure: line 14702: syntax error near unexpected token `libmnl,'
>>./configure: line 14702: `PKG_CHECK_MODULES(libmnl, libmnl >= 1)'
>
> This means you ran autoreconf (which you normally don't need to, because
> there already is a configure script), while at the same time did not
> have pkg-config installed.
