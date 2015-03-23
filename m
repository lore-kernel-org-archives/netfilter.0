From: Arturo Borrero Gonzalez <arturo.borrero.glez@gmail.com>
Subject: Re: nftables feature request: don't fail "flush" on nonexistent
 tables (was: nftables: nft fails to add rules to chains)
Date: Mon, 23 Mar 2015 20:42:15 +0100
Message-ID: <CAOkSjBgWSF1Nj6WD+cp8_w+=ESd-6m74_Ev=7dB5PNeonyXhEg@mail.gmail.com>
References: <550B3069.7080209@skarnet.org> <20150322183106.GA4150@salvia>
 <550F0DBE.7000905@skarnet.org> <20150322190033.GA7145@salvia>
 <550F1155.5000501@skarnet.org> <20150323114515.GA5552@salvia> <551015F2.7060801@skarnet.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=2/WlKwLk+PPrfxjao++HW7YaSCrsjrapv1JrnAeCd4s=;
        b=Am/T/0r7ze8BzKWnh46k0Fn0zgy8bP2UWVgIonTfl7iOLPA3sADU9Vu+uJ0A58ll7V
         qG+PwohsbEygH8YC/pOPPd6/1XILBDf+PnPP0tjTCM5gmPlXXRWbCdfxImiyOQo+bmUp
         CTjziIz4Xrrp4NxdViQOi4Eytg8tfWekY5fzTXFktEDEi/LNI1n4zZXCo01tZj9ITY0S
         OpE547KP/JVaJRlR59otcttjeGT1G6L10fJpOi8QGyV+Iqkv1xO7hurJH10wui0eghuv
         UXLzW0WOLgnCbwvnGL6Gw0QbpjqnAmWESkSCtXxw4TM8kY66HO6h87PrwwJWg8LpJ0Gm
         3AHQ==
In-Reply-To: <551015F2.7060801@skarnet.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: Laurent Bercot <ska-devel@skarnet.org>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, Netfilter Users Mailing list <netfilter@vger.kernel.org>

On 23 March 2015 at 14:32, Laurent Bercot <ska-devel@skarnet.org> wrote=
:
> On 23/03/2015 12:45, Pablo Neira Ayuso wrote:
>>
>> Please, manually apply this:
>>
>> http://patchwork.ozlabs.org/patch/453392/
>>
>> And provide feedback. Thank you.
>
>
>  Done. It's working beautifully. Thank you.
>
>  Now that I can play with nft, I have a feature request:
>
>  I'm saving my rule set in a file, called whenever the rule
> set must be applied/reapplied via nft -f. (It's to be applied
> whenever my DHCP client obtains a new lease.)
>  I would like the rule set file to be the same for the first
> time and the subsequent times the rules are applied. It's only
> logical.
>  I have to "flush table nat" and "flush table filter" at the
> beginning of the file, so nft does not duplicate rules on the
> second and later invocations.
>  Problem is, the first invocation fails on those "flush" lines,
> because the tables are not defined yet!

perhaps `flush ruleset'.

That doesn't fail if there is no ruleset.

--=20
Arturo Borrero Gonz=C3=A1lez
