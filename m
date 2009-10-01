From: Richard Horton <arimus.uk@googlemail.com>
Subject: Re: Using iptables with high volume mail
Date: Thu, 1 Oct 2009 12:54:06 +0100
Message-ID: <56378e320910010454v7a200e8evb7b39f1923637dd4@mail.gmail.com>
References: <594040.85734.qm@web53111.mail.re2.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=zhsGkmuXeyV31W20IqFUMHQS8zZylHA8QUkrMiQkdlA=;
        b=csckgMpAzNFiU7W94+zGHSwOq7RErXYTJPapdzDr6SVERwD8NMI3EIrTriu7WHIWg5
         94o1PcaVRfnE6E+hK7fEnkegRlgm4hDZmeaHN5ERamD9C8Xemv+YjzwSCwAEX6i18sCl
         avJ/nsQcuEPNuRYrgfPaTKL318GwhR/nt32kU=
In-Reply-To: <594040.85734.qm@web53111.mail.re2.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: John Little <jlittle_97@yahoo.com>
Cc: netfilter@vger.kernel.org

2009/10/1 John Little <jlittle_97@yahoo.com>:

> What modules, tables and rules to use to optimize iptables for this t=
ype volume? =A0All of the mail is sent on the standard port 25. =A0We n=
eed to optimize for quick deliverability. =A0(I've read the man page an=
d looked at TOS with the mangle table. =A0I read somewhere that this on=
ly for udp.)

Setting the DSCP / ToS field via mangle will work with IP traffic
regardless of payload type (UDP/TCP/IPSEC Tunnelled/etc). However,
there is only any point in applying it for 'quick' delivery if the
upstream routers are configured to apply a diffserv policy on a per
hop basis.

Apart from that 'quick delivery' isn't really something diffserv can
give you: EF traffic (Expedited forwarding) is intended for real-time
jitter sensitive traffic where loss is less of an issue than excessive
inter-packet delay. For reliable delivery use an AFxx class. However I
don't believe applying diffserv / tos in your case will achieve the
end results you are looking for unless you have control over all the
hops along the mail path, or SLA's in place with the network
provider(s) -- and usually once you exceed your purchased amount of
traffic within a class its either remarked or dropped - and strictly
under diffserv should be dropped as you should not remark outside of a
class.

--=20
Richard Horton
Users are like a virus: Each causing a thousand tiny crises until the
host finally dies.
http://www.solstans.co.uk - Solstans Japanese Bobtails and Norwegian Fo=
rest Cats
http://www.pbase.com/arimus - My online photogallery
