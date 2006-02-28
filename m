From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: packet-data
Date: Tue, 28 Feb 2006 20:19:21 +0100 (MET)
Message-ID: <Pine.LNX.4.61.0602282019120.15391@yvahk01.tjqt.qr>
References: <503e0f9d0602272023x4628208cv5d9845b79ed90ae5@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S932441AbWB1TT0@vger.kernel.org>
In-Reply-To: <503e0f9d0602272023x4628208cv5d9845b79ed90ae5@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: tim tim <tictactoe.tim@gmail.com>
Cc: netfilter@lists.netfilter.org, linux-kernel@vger.kernel.org

>
>hello.. i know how to capture a packet using netfilter hook.. i even
>succeeded in getting the source and destination adderss of the
>captured packet. but i was unable to retrive data from the packet .. 
>i came to know that there are pointers to access it . but can anybody
>plz show me an example to access data.. thanks in advance.

look at ipt_XOR, for a simple example.


Jan Engelhardt
-- 
