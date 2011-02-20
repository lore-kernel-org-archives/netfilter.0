From: Andrew Beverley <andy@andybev.com>
Subject: Re: mark and accept in a single rule
Date: Sun, 20 Feb 2011 15:27:53 +0000
Message-ID: <1298215673.12048.12.camel@andybev>
References: <AANLkTimFXztjt5iJbv2bnP3iqe9GoTcaqEbg1ULsWynZ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1298215685; bh=k+9/UkVAGbCvZYjxp4ZN9wLr4ixx7AomphMjy
	2P1Efo=; h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:Message-ID:Mime-Version:Content-Transfer-Encoding; b=fmqSfMBQ
	RHyBNh+NcQuhASWa/pJo6FulQO492DiwpgZIo2PNsQO/V7r9qU0OFLmhRhgGqTtyg7s
	UoS9tGferEQVJfIrItJoCVWYhR8N/n36cYHd/+tkLRRDcAL6QMEm5lhDZv527Cwi5RN
	bTbGO8K5BDzgibgfmABkI6R3kvXXk=
In-Reply-To: <AANLkTimFXztjt5iJbv2bnP3iqe9GoTcaqEbg1ULsWynZ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: E2IA <e2ia.ci@gmail.com>
Cc: netfilter@vger.kernel.org

On Sun, 2011-02-20 at 15:13 +0000, E2IA wrote:
> Hi all i'd like to know if it is possible to mark packet and accept in
> the single iptable rule.

There shouldn't be any need to do this.

> i've these 2 rules:
> 
> /usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
> --l7proto  yahoo  -j MARK --set-mark 74
> /usr/local/sbin/iptables  -t mangle  -A FORWARD      -m mark --mark
> 74  -j ACCEPT
> 
> but it seam that the second rule is never match.

The second rule *should* be matched. What makes you think that it is
not? Remember: a packet ACCEPTed in one chain can be DROPed later.

It might be worth you posting your complete set of rules.

Andy


