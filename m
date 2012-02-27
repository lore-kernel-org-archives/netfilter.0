From: vivek rajagopalan <vivvek.r@gmail.com>
Subject: Re: Source based routing using LKM
Date: Mon, 27 Feb 2012 11:59:41 -0800
Message-ID: <CAKbcA9KAuqiUCSDrMWySqkietE5V4COt08gcGUx4Gm1r6MOxvg@mail.gmail.com>
References: <CAKbcA9L2XVTuR04TONTRo7ECrBip9VYWk3T_Ar2c_ucN1QqY_A@mail.gmail.com>
	<alpine.LNX.2.01.1202111624290.22796@frira.zrqbmnf.qr>
	<CAKbcA9+2iVyHdj5issA8MCHN12629B3yNdjrGmFEHuuzv9QDVQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=fejzP6BSHwIr2okVzvpLi+54YJgXR3nY6P54K2L8ZYo=;
        b=LDdJ8Fm4dR4eNQjah1/cavV62sgk2PoMUnG/LIrL/Y30F5MUX3fgNQeDbN2PXO61Tn
         2uo7K08YwdY36IDDJF91nPo5hCxyNi24oOlZW6d/HCmv8J/4vhwzwaG45aDscxb8wVfg
         9TjYBv6MAR1eFTXTvu6ETX1AIk1tC0wULuPV0=
In-Reply-To: <CAKbcA9+2iVyHdj5issA8MCHN12629B3yNdjrGmFEHuuzv9QDVQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

>> Changing the addresses in-flight breaks end-to-end connectivity. It will
>> be better if you would, for example, mark the packets in the RX
>> path, based upon your desired criteria, and reuse this mark value to
>> select the routing table.
>
> I will explore this, thanks

Usage of mark (skb->mark in my case) along with policy based routing
helped me achieve what i wanted to do with source address based
routing. Thanks a ton for the pointer
