From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: [NFLOG] How to determine the connection a packet belongs to?
Date: Tue, 7 Jun 2011 13:59:39 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1106071358090.25037@frira.zrqbmnf.qr>
References: <BANLkTimnO5UzNvq6SfuWc7osck=QL=HrMw@mail.gmail.com> <4DED6538.3090404@netfilter.org> <BANLkTi=7eDTNM+OEuDnZucX2sc4Bck_Q6w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <BANLkTi=7eDTNM+OEuDnZucX2sc4Bck_Q6w@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Clemens Eisserer <linuxhippy@gmail.com>
Cc: netfilter@vger.kernel.org

On Tuesday 2011-06-07 12:40, Clemens Eisserer wrote:

>Hi,
>
>> You can build the tuple from the packet in user-space to look up the
>> conntrack via libnetfilter_conntrack.
>
>How can I do that?
>
>Assuming there are two open connections:
>IP1:80       <----> IP2:39678
>IP1:39678 <-----> IP2:80
>
>How can I know which packet belongs to which connection?

Because packets contain IP1, 80, IP2 and 39678.

