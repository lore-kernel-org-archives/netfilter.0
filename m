From: Scott Mayo <scotgmayo@gmail.com>
Subject: Re: Public IP to Private IP
Date: Mon, 27 Jan 2014 15:01:59 -0600
Message-ID: <CAFPGR9guTGspBJ8yfOVNZAAMy44YGS+UeV+QmYNLpAJ+ZxTuxw@mail.gmail.com>
References: <CAFPGR9jhpurA644xdfWc6dF58iVCc5t7mbUw6NsjxPqYQxtUHw@mail.gmail.com>
	<CALFTrnO7SAm0ghr7b1p+o9cWnbwtRJQMtSmtJy_VXJxd-xxkcw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=g32/+TCmv4g4UgiyCQAJg1BLzsWrTblZvXLVKpa/AU8=;
        b=EIFKqBR29Zdj1HBn5kHBwNX0ie0jv3/Ns0vOaytE+ZCkoNBuCbzpwXks7wRJ8LkUHE
         TGHNljMRzFfOqtWk86oJ8lPcoFYddIS0fAgpSWCSs3T+U8sRY1EJkVIX6RtPF+Dz0D79
         5R2sl3RIywsqBgu9SW760YVmNAbbaGUwl5nfu/dtjmRqTAOaL1VV4WbJXQ3/+PF5YFGj
         chOlzylt0zvBIWiJVzAyaAFpHTulBZR2mF+3DgrlJiDlT9lGK/f2HLCo3x4ZkKl6MXPN
         hWu51Xyi2G9rbI4b5M/pkNc+xd22V9Jh5YtCsDJBgUlp2GPWt8b2VHsJeCwh9/mo2EP8
         1Q1w==
In-Reply-To: <CALFTrnO7SAm0ghr7b1p+o9cWnbwtRJQMtSmtJy_VXJxd-xxkcw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ray Soucy <rps@maine.edu>
Cc: netfilter list <netfilter@vger.kernel.org>

On Mon, Jan 27, 2014 at 2:48 PM, Ray Soucy <rps@maine.edu> wrote:
> The term you're looking for is "NAT reflection" or "hairpin NAT".
>
> If you're not running split DNS, then trying to reach a system via its
> "outside" IP from an internal system will present a problem because
> the source IP of the request is seen as on-link by the server, so the
> server responds directly from an unexpected source IP and the
> requesting host drops the request.
>
> You can get around this issue by NATing the return traffic when its to
> and from the internal network.
>
> Assuming that your inside interface is eth1, and your inside IP
> network is 192.168.0.0/23:
>
> iptables -A POSTROUTING -s 192.168.0.0/23 -d 192.168.0.0/23 -o eth1 -j
> MASQUERADE
>

That did not seem to work either.  Getting the same results.  Thanks.


> Split DNS, however, is a better approach, if you can do it (using
> views in BIND).


Yes, if I can get time to setup a Bind server. I just need some more time.

-- 
Scott Mayo
Mayo's Pioneer Seeds   PH: 573-568-3235   CE: 573-614-2138
