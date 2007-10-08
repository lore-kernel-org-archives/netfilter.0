From: Patrick McHardy <kaber@trash.net>
Subject: Re: conntrack is bad during DDoS?
Date: Mon, 08 Oct 2007 10:46:48 +0200
Message-ID: <4709EE78.4010005@trash.net>
References: <4702BDCB.3060102@andrei.myip.org> <4704B0EC.2030802@trash.net> <470562BF.3090504@andrei.myip.org> <47056569.3020704@andrei.myip.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <47056569.3020704@andrei.myip.org>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Florin Andrei wrote:
> Florin Andrei wrote:
> 
>> I understand the thing about stateless NAT and 2.6.24 - that's very
>> good news, too bad it's not in older versions. :-)
> 
> 
> Come to think of it, I need explanations for this one too. :-)
> Is that true only for 1:1 NAT, or NAT in general? If the former, is that
> a special new case, requiring different iptables rules, or something else?


Its implemented as TC action, so its independant of iptables. It only
supports 1:1 NAT, everything else needs to be stateful to avoid clashes.

> I assume these are recent changes to netfilter - is there a place where
> I can find these specific changes documented or discussed?


Check the netdev archives of the past two or three weeks.
