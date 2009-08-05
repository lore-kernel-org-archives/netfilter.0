From: Steve Fink <sphink@gmail.com>
Subject: Re: Port redirection
Date: Wed, 5 Aug 2009 11:30:23 -0700
Message-ID: <7d7f2e8c0908051130j2c43ed4cv73163e980dba6222@mail.gmail.com>
References: <7d7f2e8c0908042157y4e80136ct82efd1dd2446db2c@mail.gmail.com>
	 <4A79915B.7050407@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=AqXu4H8jAmliV37IuC4J/vA7fNuV8lgtKXBsPsWIEsA=;
        b=mbetOIzWj2Yly5eW/ff9nEBucm9+mUpGAnEMz9/H0q7FssQHmn3p/l3H9yP6IA4iPR
         ZykFS8BS/RUvG80CW/j1kZltYvebqAxtRRL0D3jgZ94zbaVMtFqwXHBIjZknpkv7WWpR
         DjXOWnnxrPbudXJB45clnSXYJ1WjdeswPO0N4=
In-Reply-To: <4A79915B.7050407@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

On Wed, Aug 5, 2009 at 7:04 AM, Pascal
Hambourg<pascal.mail@plouf.fr.eu.org> wrote:
>
> You don't see these packets in the 'nat' table because the "connectio=
n"
> already exists and has an an entry in the conntrack table. You can de=
lete a
> conntrack entry with the conntrack command from the conntrack-tools p=
ackage.
> You can also prevent the packets to create a conntrack entry by using=
 the
> NOTRACK target in the 'raw' table until after you add the NAT rules. =
Make
> sure to match packets in both directions. After you remove the NOTRAC=
K
> rules, the next packet will enter the 'nat' chains and hit the NAT ru=
les.

Thank you! That works perfectly. Both approaches are useful to me (as
is doing NOTRACK and then waiting the 30 seconds for the conntrack
entry to expire; installing conntrack-tools is a bit of a pain on
these boxes.)

I don't need to match packets in both directions, because there aren't
any coming back -- I'm streaming MPEG data out and no response is
desired or necessary.

>> =A0sysctl net.ipv4.ip_forward=3D1 # Dunno if this matters
>
> It doesn't matter. Packets are locally generated, the box does not ac=
t as a
> router.

Right. That's what I thought, but I tend to cargo-cult that line
because it's usually the thing I forget when I'm bouncing packets
around a network.

>> (I'm testing this over a VPN, hence the tun0 device. Both $ORIG_DEST
>> and $SPY are accessible via the VPN.)
>
> This matters a lot : for both $ORIG_DEST and $SPY, the actual next ho=
p is
> the VPN endpoint.

Ok, that makes sense. 'ip' is only routing, not rewriting.
