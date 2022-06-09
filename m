From: Gordon Fisher <gordfisherman@gmail.com>
Subject: Re: Possibly dangerous interpretation of address/prefix pair in -s
 option
Date: Thu, 9 Jun 2022 07:21:37 -0700
Message-ID: <62A201F1.9080401@gmail.com>
References: <mail.629a20b0.7e37.7f80bf761b5d8a04@storage.wm.amazon.com>
 <768e4d99-0c50-01af-4434-20378c06a3cf@thelounge.net>
 <mail.629a35d7.2a64.4a0b184f3a85fa1c@storage.wm.amazon.com>
 <010201812a625427-9b51500d-3126-4b6f-95d0-d71702c349a7-000000@eu-west-1.amazonses.com>
 <b6945516-3120-24f0-9990-294f1653c9a4@thelounge.net>
 <mail.629a388a.7bba.0e9843742ea45568@storage.wm.amazon.com>
 <010201812a6ce183-1a849304-791a-4874-9668-23f871060bac-000000@eu-west-1.amazonses.com>
 <mail.629a3f4f.4e0b.2e3e82745c98ed1d@storage.wm.amazon.com>
 <06924b12-8664-1e96-2a0b-d3711bbb67d7@thelounge.net>
 <010201812a875150-65c17845-7e32-4eac-8c72-28bf90279b54-000000@eu-west-1.amazonses.com>
 <CANGix0CNMH0yhVSxaVqX5DnuZs0oNc6fKMDX=BAm=+PzhFVKSg@mail.gmail.com>
 <CANGix0Ddy_BW5wgUbmEmMiJajs_FxEFRcYDPuzNL3aaBxnCtoQ@mail.gmail.com>
 <mail.629a519e.0cd7.3039eb4576cddb5d@storage.wm.amazon.com>
 <010201812aced64c-cfcce59b-f83c-4892-b6eb-43b9b0a2fc64-000000@eu-west-1.amazonses.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:references:cc:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding;
        bh=JDGCirT8zOXpfVGob6KeNKygXX9mfaWaUr41YIv7oo4=;
        b=GxrYVY2AkXkoJlV14qVv6j21OTTvoUuHrnPLOantopn9gZ2rhR8NrsMfDUNYlSTWWd
         9oxN5yvpOi9odl4/mawX2FlCsPVzdOQcXtsechpvgs/h5Oh0If3Jsq7jq/MS8uiVLVf5
         LPiciRqn9KLJHhNRHTeY0XowqDjIeexJs7pP1fx/60lY3WI0B4zBHGLAMFxcIVP/Y4LR
         rLkn54rh4v5z8ZVPXjNznt8iWii041YyUUrWVq3ch8WYTRM7RGvu1Iby2c1q+iCjpHyP
         FQFU8+sQIXE0NBcXGrpkPqZQ/RkXUo/x9nQMdgLPNtADm7iuZEkHxHwu6XhyBMpoARrh
         63gw==
In-Reply-To: <010201812aced64c-cfcce59b-f83c-4892-b6eb-43b9b0a2fc64-000000@eu-west-1.amazonses.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: 
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 6/3/2022 11:23 AM, Stefan Riha wrote:
> Hmm, but don't other programs do indeed interpret 10.0.0.2/24 
> differently? For example systemd-networkd interprets 10.0.0.2/24 as a 
> single Ip address in the subnet 10.0.0.0/24. Which makes a lot of 
> sense to me, because why would one specify the .2 at the end, if one 
> meant the subnet?

I would say that it depends on context; that is, what the parameter is 
supposed to be. Is it meant to specify single address, a network, or either?

In the your systemd-networkd example, IIRC, that is supposed to be a 
single IP address, and `10.0.0.2/24` is a short hand for entering 
`10.0.0.2` and `255.255.255.0` for a network interface.

Another example that comes to mind where context matters, is the older 
`route` command (that predates `ip route`), which has `-host` and `-net` 
arguments for `route add` commands, that tell the program whether to 
interpret the address part as a network based on the mask given, or as a 
single host (where the mask can be omitted.)

`ip route` on the other hand just goes by the mask given similar to `-s` 
and `-d` in `iptables`, where it really just does as it is told: check 
this address according to the given mask. And like `iptables`, assumes 
/32 if no mask is given.

-- 
gordonfish

