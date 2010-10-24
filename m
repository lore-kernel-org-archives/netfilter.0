From: Scott Mayo <scotgmayo@gmail.com>
Subject: Re: Blocking machines by both Mac Address and IP address
Date: Sun, 24 Oct 2010 08:14:04 -0500
Message-ID: <AANLkTimLU-tt6vtrXC21wG77CFH=aJiB48hEp0vBUu3q@mail.gmail.com>
References: <AANLkTimE3DpKibaqKH53D9PEtt_AxSAimdaTiyTy1VZK@mail.gmail.com>
	<1287873234.1700.330.camel@andybev>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=eIZybRARErab+jCort+g++tIny9Rh4Y2ijYmGAQwZH8=;
        b=wnsj02uGdRQPjxkAmgyMzkr02hHB97kHNcrfGLlzcEZVA38AXhkFkYtc1LCq6BfRo/
         kDkxO8OfkshGExKMl6FDXtmNhcmSkEIENY7ekImGujKXHUX9ah4t/Yc49/D7BSCNtHix
         FUPh3NxfSd/q3W1LwHJnE37e+FWczavl8GqpE=
In-Reply-To: <1287873234.1700.330.camel@andybev>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

On Sat, Oct 23, 2010 at 5:33 PM, Andrew Beverley <andy@andybev.com> wro=
te:
> On Sat, 2010-10-23 at 17:19 -0500, Scott Mayo wrote:
>> I have my DHCP server setup so that it hands out IP adresses accordi=
ng
>> to a machine's Mac address. =C2=A0Is there a way to deny traffic to =
the
>> internet by both MAC address and IP address?
>>
>> i.e. =C2=A0If MAC address 00:11:22:33:44:55 is given IP address 192.=
168.0.1
>> by DHCP then that should be the only combo that can get to the outsi=
de
>> world. =C2=A0If the IP address is changed to something else or if an=
other
>> machine that has a different MAC address is given the IP address
>> 192.168.0.1 statically, then in neither situation should the machine
>> be able to get out to the world.
>
> Something like this...
>
>
> Set your default policy to drop:
>
> iptables -t mangle -P FORWARD DROP
>
> Then set up a rule for each client that matches both IP address and M=
AC:
>
> iptables -t mangle -A FORWARD -s 1.2.3.4 \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0-m mac --mac-source aa:aa:aa:aa:aa:aa -j A=
CCEPT
>
>
>
> Andy
>
>
>

Thanks for the help everyone.  I will try this out next week.  I
figured there was a way to do it, but I am still not the greatest with
IPTABLES.  Not sure that I have ever done anything with the mangle
table.

Thanks again.

--=20
Scott
