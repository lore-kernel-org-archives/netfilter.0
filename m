From: santosh prasad nayak <santoshprasadnayak@gmail.com>
Subject: Re: [Bridge] [PATCH 2/3] netfilter: potential null derefence.
Date: Sat, 3 Mar 2012 14:34:43 +0530
Message-ID: <CAOD=uF4qvMZ3aa+x_aXS+SvxYQ46HnQEjkvO7Mwh=sHdhoHM1A@mail.gmail.com>
References: <1330593434-19275-1-git-send-email-santoshprasadnayak@gmail.com>
	<20120301123004.GA7250@1984>
	<4F513C2B.6030604@pandora.be>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=9WMOXHOfWHwDmIzwBBaS22rNUVrUqWzTQYe/2egbebc=;
        b=K8RlVq0PWcc7c12d2Vanpu87nEq1olFYjwz6Wvl477zxMqDWfzLCOPzAyCT0Dt0otx
         5msF3oDiV95fncCP2MPwg7GwX9OpacsEExsKmagd0bveyumqt6Fmvy3c9tc1j9SVyTwj
         xsHYdJxjOdBUDeVPE1pOVHK9m/mTO1pu8JCxR3oEicqWthBZu23fcdkgaNe80IMuGyAv
         dNvPaWfhOqNxkR8EXGzKYvYsV3+WtQP7mbc48HntG9NtzZ1SAOnWNyCUpfcev5/r4KWH
         Gh32xMQJVOUkyANTHQ9m2HgSx4sxQ3MU34R5DN5LSlb74+RGyd0HIarwomywRPPoxblY
         z7EQ==
In-Reply-To: <4F513C2B.6030604@pandora.be>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Bart De Schuymer <bdschuym@pandora.be>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, netfilter@vger.kernel.org, coreteam@netfilter.org, kernel-janitors@vger.kernel.org, davem@davemloft.net, bart.de.schuymer@pandora.be, netfilter-devel@vger.kernel.org, shemminger@vyatta.com

Hi Bart,
         Its good to do the testing before rolling up the patch
but code analysis shows there is a potential bug.

=46or cs=3DNULL the following statement will cause crash.
       i =3D cs[sp].n

The aim of this patch is to avoid possible null dereference.


Regards
Santosh

On Sat, Mar 3, 2012 at 3:01 AM, Bart De Schuymer <bdschuym@pandora.be> =
wrote:
> Op 1/03/2012 13:30, Pablo Neira Ayuso schreef:
>
>> On Thu, Mar 01, 2012 at 02:47:14PM +0530, santosh nayak wrote:
>>>
>>> From: Santosh Nayak<santoshprasadnayak@gmail.com>
>>>
>>> I am getting following error.
>>> " net/bridge/netfilter/ebtables.c:269 ebt_do_table()
>>> =A0 error: potential null derefence 'cs'"
>>>
>>> =A0 =A0 i =3D cs[sp].n; =A0// If cs =3D=3D Null then this will caus=
e problem.
>>
>>
>> Very sorry, I didn't see the out label.
>>
>> I'll apply this to my nf [1] once David takes my previous request fo=
r
>> pulling.
>>
>
> Hi,
>
> Has this patch been tested? Really, that code in the core firewall fu=
nction
> is there for a reason, wouldn't you think?
> The chainstack is only allocated when user-defined chains are used (s=
ee
> translate_table).
> Never blindly trust a tool.
>
> Bart
--
To unsubscribe from this list: send the line "unsubscribe netfilter-dev=
el" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
