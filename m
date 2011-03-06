From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: --state for NOTRACK packets?
Date: Sun, 6 Mar 2011 18:09:25 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1103061808430.895@obet.zrqbmnf.qr>
References: <AANLkTimV6b_Ov6AX2nUKFzhthFDeB-auDCkevc4OQOEY@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTimV6b_Ov6AX2nUKFzhthFDeB-auDCkevc4OQOEY@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pandu Poluan <pandu@poluan.info>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Sunday 2011-03-06 17:27, Pandu Poluan wrote:

>Hello,
>
>If a packet got NOTRACK-ed in raw/PREROUTING, what would its
>--state/--ctstate be in the other PREROUTING chains?

Following -j CT --notrack, a packet will be --ctstate UNTRACKED.

