From: macach <macachuto@gmail.com>
Subject: Re: Question: Why it is not possible to mark packet BEFORE first
 "route selection" in OUTPUT chain
Date: Sun, 25 Oct 2015 21:20:48 +0300
Message-ID: <562D1D80.60205@gmail.com>
References: <562CBFAD.40405@gmail.com> <562CFF2D.9030201@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-type:content-transfer-encoding;
        bh=vYaewtHWfg4f3EOG+lxT3Ii2XnR06dJhfmsCHnZ4bKY=;
        b=MgkIBYdTfI+JWUcQx8iyEdFvK+IgkFn2bomkDcmqhIeC9z3XWfEojtjCdk/jlivEqN
         APWOPadDnmmweWSptORQpTLNX9X22ZIqEIV5cXfx9vPZ5iO0x9KtfzMPqexY2cvoiGrh
         92g9zfpu96U/nJFsuCEwquPL8sKQib4neKI+sp1edUQ2bl7fyhCcvGdFnEVTfhfPcvuY
         AjFebfZ/lWof/ZOuOAEVk8gK1qsnb4zfz+rlkLB1neaWwHVMs2FDWOed4+rmEMU0BDuB
         gVgNpUOBmA9joy4mLZTE//VP7yceswfrr5B5sBzPcO1xeaf49FB19Wx8/d9HauHt/cln
         yqYg==
In-Reply-To: <562CFF2D.9030201@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Pascal Hambourg <pascal@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

On 10/25/2015 07:11 PM, Pascal Hambourg wrote:
> macach a =E9crit :
>>
>> Why it is not possible to mark packet BEFORE "route selection" in OU=
TPUT chain.
>
> Because when the initial route selection happens, the packet does not
> exist yet. It is in the process of being created. The reason why rout=
e
> selection takes place during the packet creation is that its result
> influences packet features such as the source address, TOS...
>

Thank you for your answer.

I understand that it necessary to put "something" into the packet heade=
r.
But why it should be one of many interfaces ip, which may be changed la=
ter.
In this case, without default route, packet will never left "route sele=
ction", this is completely irrational =3D just to put something and=20
change it later.
If packet transformation doesn't finish at this point, why to apply rou=
ting and interface source ip?
Why do not use local host ip =3D 127.0.0.1, inside of output packet bel=
ongs to the local host anyway.

Then apply mangle (if any) and other modification (if any), then finall=
y select appropriate route.
And routing decision should the last action, because I think router it =
just packet dispatcher.

Also I forgot to ask: why second "route selection" doesn't change sourc=
e ip.
=46or example in multi-routing table when decision is made by port or d=
estination.
It is necessary to add another operation to modify source ip according =
to interface: -t nat POSTROUTING ... -j SNAT ...


Thank you in advance.
