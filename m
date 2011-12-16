From: Andy Furniss <andyqos@ukfsn.org>
Subject: Re: Filtering pppoed frames
Date: Fri, 16 Dec 2011 19:46:10 +0000
Message-ID: <4EEBA002.4030402@ukfsn.org>
References: <CAKEn5-LiE2Dv0zw_8JREHoyT1DHwQ17EirqGPsykU3GkX9XfvA@mail.gmail.com> <4EEA61F1.9020709@ukfsn.org> <CAKEn5-Kmc=OUcThwX8DeZGNzfQ-C6Zj-=siF0okA87Fb25=FxQ@mail.gmail.com> <CAKEn5-J95Qu_Hx8bHk3F-Kde7BhGjg6W9hK=7p8CA5uOMujgRQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAKEn5-J95Qu_Hx8bHk3F-Kde7BhGjg6W9hK=7p8CA5uOMujgRQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Marius Nicolae <marius.e.nicolae@gmail.com>
Cc: netfilter@vger.kernel.org

Marius Nicolae wrote:

>> If you can't identify from the frame alone and need state from the pppoe
>> server or some statistics then it's going to be trickier.
> Yes, is possible to identify the frames alone from macs and ethernet
> protocol only, in a stateless manner, but it must be rejected only the
> "noisy" macs. As a very simplistic description the pppoed protocol is
> used to create and terminate pppoe sessions (frames with 0x8864
> ethernet protocol) which encapsulates IP frames by signing and even
> encrypting them. Thus is very important to let the good and legitimate
> macs to send/receive such frames in order to create/terminate pppoe
> sessions.

The only tc thing I can think of would be to keep a list of bad macs - 
maybe from a script parsing pppoe server logs or something and then 
periodically replace a tc filter that matches and drops those macs + 
protocol 0x8864.
