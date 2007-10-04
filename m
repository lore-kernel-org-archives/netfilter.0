From: Florin Andrei <florin@andrei.myip.org>
Subject: Re: conntrack is bad during DDoS?
Date: Thu, 04 Oct 2007 15:12:57 -0700
Message-ID: <47056569.3020704@andrei.myip.org>
References: <4702BDCB.3060102@andrei.myip.org> <4704B0EC.2030802@trash.net> <470562BF.3090504@andrei.myip.org>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <470562BF.3090504@andrei.myip.org>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Florin Andrei wrote:
> I understand the thing about stateless NAT and 2.6.24 - that's very good 
> news, too bad it's not in older versions. :-)

Come to think of it, I need explanations for this one too. :-)
Is that true only for 1:1 NAT, or NAT in general? If the former, is that 
a special new case, requiring different iptables rules, or something else?

I assume these are recent changes to netfilter - is there a place where 
I can find these specific changes documented or discussed?

-- 
Florin Andrei

http://florin.myip.org/
