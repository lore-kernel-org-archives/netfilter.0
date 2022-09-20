From: Bruno de Paula Larini <bruno.larini@riosoft.com.br>
Subject: Re: BUG: soft lockup on kernel 5.19.9 when attempting FTP connections
Date: Tue, 20 Sep 2022 15:53:05 -0300
Message-ID: <f735370d-fdc7-b7df-0e96-599f3c230058@riosoft.com.br>
References: <b2f301f6-d335-04bd-43b2-001e5dcacc09@riosoft.com.br>
 <20220920151952.GD30575@breakpoint.cc>
 <37c01892-11ea-4347-7eae-871d46fecf41@riosoft.com.br>
 <20220920162401.GE30575@breakpoint.cc>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
dkim-signature: v=1; c=relaxed; h=message-id:date:mime-version:subject:to:references:from:in-reply-to:content-type:content-transfer-encoding;
 d=riosoft.com.br; s=default; a=rsa-sha256;
 bh=7soMIbdhMlMD+sEkHedfZRTNUG9efhlTnq7CNbrSWII=;
 b=AnzHjhgfOVOMxJ6LVeBXpwLX0JAiHNqkA9Ba4n+fm2WIdJqAypCV8oH94NucixBzj
 m2dUsr43YidPdzR6ywDbJ6ZxWAY0ZpoTCfA4zgEq+1a8akPIWKZvHlftpIMnnadrriD
 hPOeb9Gx66ZrSsmoYBZQvHixHhPOLzbWqYLJa0Q=;
Content-Language: pt-BR
In-Reply-To: <20220920162401.GE30575@breakpoint.cc>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Florian Westphal <fw@strlen.de>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Em 20/09/2022 13:24, Florian Westphal escreveu:
> Thanks, this is enough info.  I'll work on a fix.
I see you already issued the fix. That was quick!
Thanks a lot!
