From: Simone Zaffalon <zaffa@zaffa.it>
Subject: Re: conntrackd: failover problems
Date: Tue, 4 Jan 2011 11:06:17 +0100
Message-ID: <AANLkTik9OORTJp2qfVV4S42m7KGVGG+xBDB7c=T2sH0J@mail.gmail.com>
References: <AANLkTi=7BfQS07kPJyN_NO45apW-UsMZj-PUgnfboCpb@mail.gmail.com>
	<4D1A176C.5000105@netfilter.org>
	<AANLkTimcTzk29z_9CqY9a6jNfoQrSs+V4Qx7vKRisMJh@mail.gmail.com>
	<4D1B49BD.3030202@netfilter.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:sender:received
         :in-reply-to:references:date:x-google-sender-auth:message-id:subject
         :from:to:cc:content-type;
        bh=tFtz9wdUVbXWHJfxEaLOVZgfwD0bZjsL+b7yOftPF4E=;
        b=qW1F0/e/dpyUwl8JLxdneB4+mKKYzcglC+Z2+Ky/rSn69TaKxVeC4eRLWHjxKXAbcZ
         2incSvSyoe0KNj2kzxW365vUh2Vg1BH8+d2y0v6NW98Iz1WNDxFkKRxEnWKZCBBnlsr9
         1xBZipBvjM8tWSvksDpVzbgw5wZQNo/+4RTfY=
In-Reply-To: <4D1B49BD.3030202@netfilter.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

Hi Pablo.
I managed to do some more testing, and maybe i found my problem.
With conntrack running, i took for granted that every tcp connection
would be tracked and resumed.
So, as i said in my first email, i didn't set up any iptables rules
(except one for snat).

With this configuration conntrackd does'nt work. Then i tried some
iptables rules like the ones in
http://conntrack-tools.netfilter.org/testcase.html
and things started working.
Please, to be crystal clear on that, can you confirm that when you say in manual

"
...
3) A well-formed stateful rule-set. Otherwise you are likely to
experience problems during the fail-over. An example of a well-formed
stateful iptables rule-set is available in the conntrack-tools
website.
...
"

you mean : "To ensure that conntrackd work correctly you must have a
set of iptables rules with state tracking enabled" ?
If so that's great, i found my problem.
Many thanks in advance for your help,

regards
Simone Zaffalon
