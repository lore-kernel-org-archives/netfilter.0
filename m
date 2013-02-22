From: Marco <listaddr@gmail.com>
Subject: Re: conntrackd questions
Date: Fri, 22 Feb 2013 11:12:55 +0100
Message-ID: <CAHPDOiEvpU1hEKkNJMpUrxJP6Lb=9pKDsEbMjqbr7DWKyZt_Ew@mail.gmail.com>
References: <CAHPDOiHUU+4qXB3iz6_6ZKOBRg8beBL_7SHC8c4zULw1vJ2CnA@mail.gmail.com>
	<20130219195237.GA3208@localhost>
	<CAHPDOiFpF2+F8CTJ_fF26bXaCtTCUMDPV8JtZT-HX+m2u1j3AA@mail.gmail.com>
	<20130221183711.GA6061@localhost>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:in-reply-to:references:date:message-id
         :subject:from:to:cc:content-type;
        bh=m0+uCNuXPHjWjmP1NAkQdDHO0g7NPbRM+y606B1W1Ko=;
        b=exYLcJio3T+Jd7zrcRp5R2ESXwAiTnRnvhZKaMcMrdmz85kRhFRYjEvQzCltce/UFy
         dwbgNlvPv5K9+5vD3g3lQQ6Wm/YnXCulh7MutpndJYwlMIUHzW8vmyHM3mlsZRP1Gv9H
         yFM/0UY9n7jurbjI5az1heh4yuJvThi56pFOVL4XARap+1rKSpdOwMGl1fhgGiaiZjdQ
         NCXZCzb2PfAJx3cP4sJCyXnjkwGhDcGeStALk6axrENcmY1t+9ph1q6dUMCwqfaEJgOa
         +vh3XHdsvu2cf5lkNqGQ1sCaOS3ap58WetvyO//MKtZK1YaLbnibITrDt+6hEh2MpsOP
         hIcw==
In-Reply-To: <20130221183711.GA6061@localhost>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

2013/2/21 Pablo Neira Ayuso <pablo@netfilter.org>:

>> But on the capture taken on the upstream router, I see that, at the
>> point when the client hangs, there are many RST packets directed to
>> the website from which the client was downloading. Obviously, this
>> resets the connection and the client has a hard time waiting for more
>> data. I suspect these RST are coming from one of the firewalls. For
>> example, while there is a failover from fw1 to fw2, but fw2 hasn't
>> synchronized the full conntrack table yet, data comes back from the
>> website; fw2 doesn't know anything about it yet, so it sends RSTs.
>
> Thanks, that's a much more accurate report, I can help you better with
> that.
>
>> Could a race like this be possible? I can probably live with that, but
>> I'd like to understand if my analysis is correct.
>> If I disable external cache, it still happens, although less frequently.
>
> The firewall sends an RST if it finds no state information / the
> traffic is considered to be invalid by the TCP tracking code.

From the capture, that's what I suspected too.

> In your previous config, assuming you use a 3.x kernel, I saw you did
> not enabled TCPWindowTracking On. That allows the new primary to
> recover TCP window tracking from the middle.

Unfortunately, the system where this will run has a 2.6.32 kernel, so
this is not an option for the moment.

> Another possibility is to disable disable TCP tracking.
>
> echo 1 > /proc/sys/net/netfilter/nf_conntrack_tcp_be_liberal

I've done this, but I'm still seeing client hangs from time to time.

Perhaps what I need is really the TCPWindowTracking On setting?
according to question 5 in the docs:

5. Does conntrackd support TCP flow-recovery with window tracking enabled?
Yes, but you require a Linux kernel >= 2.6.36 and the conntrack-tools
>= 0.9.15. To enable it, check the TCPWindowTracking clause in the
example configuration files.

(assuming TCP flow-recovery is

> I think they are documented in the official docs, let me know if not.

Well, the docs mention window tracking here and there, but (at least
to me) it's not clear what that does, and that it's (or could be) the
solution to this problem I'm seeing.
Furthermore, I found no documentation or explanation of
nf_conntrack_tcp_be_liberal on google, neither it is in the sysctl.txt
file that documents the /proc/sys/net entries, nor anywhere else.

> It's also good to have a "sane" stateful rule-set, ie. one that drops
> invalid traffic, see the rule-set in:
>
> http://conntrack-tools.netfilter.org/testcase.html

The ruleset I'm using is indeed sane (with added rules to do NAT, as I
explained).

Thanks
