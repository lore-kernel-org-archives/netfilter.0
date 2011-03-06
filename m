From: Pandu Poluan <pandu@poluan.info>
Subject: Re: --state for NOTRACK packets?
Date: Mon, 7 Mar 2011 06:02:57 +0700
Message-ID: <AANLkTikvrMBJd_QtFV9HYa7-Op9b=j9F8hs1WnO_x8tG@mail.gmail.com>
References: <AANLkTimV6b_Ov6AX2nUKFzhthFDeB-auDCkevc4OQOEY@mail.gmail.com>
	<alpine.LNX.2.01.1103061808430.895@obet.zrqbmnf.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1103061808430.895@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@medozas.de>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Aha, thank you very much!

Rgds,


On 2011-03-07, Jan Engelhardt <jengelh@medozas.de> wrote:
> On Sunday 2011-03-06 17:27, Pandu Poluan wrote:
>
>>Hello,
>>
>>If a packet got NOTRACK-ed in raw/PREROUTING, what would its
>>--state/--ctstate be in the other PREROUTING chains?
>
> Following -j CT --notrack, a packet will be --ctstate UNTRACKED.
>
>


-- 
--
Pandu E Poluan - IT Optimizer
My website: http://pandu.poluan.info/
