From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: iptable rule to change incoming interface
Date: Fri, 7 Dec 2012 08:17:19 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1212070816080.1338@nerf07.vanv.qr>
References: <1DAF6950-F0F7-4B32-88F4-FC65798EB4B3@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1DAF6950-F0F7-4B32-88F4-FC65798EB4B3@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rishi Kapoor <rkapoor.rishi@gmail.com>
Cc: netfilter@vger.kernel.org

On Friday 2012-12-07 05:12, Rishi Kapoor wrote:

>Hi,
>
>I am looking for a iptables rule which can change packet's incoming interface.

But what is the point of doing that? You cannot deny the fact that it 
has come through a particular interface regardless.
