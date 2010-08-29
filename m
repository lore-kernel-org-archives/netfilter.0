From: Tomasz Chmielewski <mangoo@wpkg.org>
Subject: Re: using iptables with tun/tap interfaces? no rule sees tun/tap
 interface traffic
Date: Sun, 29 Aug 2010 13:50:10 +0200
Message-ID: <4C7A4972.4020304@wpkg.org>
References: <4C7A3E75.5020202@wpkg.org> <20100829131559.23abd652@catus>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=wpkg.org; h=message-id
	:date:from:mime-version:to:cc:subject:references:in-reply-to
	:content-type:content-transfer-encoding; s=default; bh=+bEtgHBUS
	258Z824fJR0sOoSHf8=; b=TI+QYZXVQTgAaRs3isp0gl9AoblK9jkwlv+tAT21B
	PRDU8HCdjkpDCeoOCtUZE7pi6U4utK+vjAcyE04w4cONuydXL+fHXEzo2Uij9XU6
	wrUO1dLp6vcwzmiYjyh64fDaDL4Qw9lgiKMdF5U0tWxPDEepu+kP3Op+IC7bTBqn
	r8=
In-Reply-To: <20100829131559.23abd652@catus>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Marek Kierdelewicz <marek@piasta.pl>
Cc: netfilter@vger.kernel.org

On 29.08.2010 13:15, Marek Kierdelewicz wrote:
> Hi Tomasz,
>
>> tcpdump: WARNING: tap0: no IPv4 address assigned
>
> So you're bridging.
>
> Make sure /proc/sys/net/bridge/bridge-nf-call-iptables is set to 1.

# cat /proc/sys/net/bridge/bridge-nf-call-iptables
1

Using 2.6.35 kernel.

Should I use ebtables for this? iptables seem more flexible here.



-- 
Tomasz Chmielewski
http://wpkg.org
