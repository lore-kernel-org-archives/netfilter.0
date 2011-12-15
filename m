From: Erik Schweigert <ejschweigert@gmail.com>
Subject: Linux Bridge Not Queuing to Ebtables under ARP Cache Storm
Date: Wed, 14 Dec 2011 17:02:19 -0800
Message-ID: <CADVVA4_3hAK_9AcPzToDdwJuQXaGFuT2s-dx8ups7MUiUp0DFg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=BpsK3FMbp6VQgfVICgElZX8idjRPGvHnVk4vayc2S4s=;
        b=i5HMS/t2LKaUBWfV18ZVYx9kQxqdSk+UYkgdR28rXOo7s0oeQiqwjYIBSu5nVPsOD/
         jYHKiaCJRMYRBYbGDgkFyhigaoaKf/WbdVSKYFAZ8Yt8566pdpB3rZ6xfha38qBaMnPz
         UAGGjOVuBM8m9ATToKydac9R4OxMoCT4fQfqM=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hi all,

I am running 2.6.26.5, I have a transparent bridge (two ports) running =
ebtables.

The issue I am running into is the bridge mac address table growing to
a massive size because of an ARP cache storm (for testing purposes).
When I send the arp cache storm at the bridge (10,000 pps),
interestingly I do not get any packets queue'd to ebtables for ARP, or
any type of filtering. =A0The packet/byte count on my rule is 0
(ebtables -A FORWARD -p ARP -j ACCEPT). They appear to be dropped
somewhere in kernel?

If I set the ageing timer on the bridge to 1 second I am then able to
see packets hit ebtables. =A0In my mind I should at least see a few
thousand packets hit ebtables before the bridge is inundated with mac
address entries? Any thoughts?

I also noticed that this table can get massively large, i.e. over
100,000 entries.

# brctl showmacs transBR | wc -l
108975

I cannot imagine that Linux bridging would be susceptible to an Arp
cache storm attack...I also thought about modifying the=A0#define
BR_HASH_BITS 8 in br_private.h to a smaller value for the hash table,
but that doesn't seem like a fix but more of a hack. =A0The modificatio=
n
to the age-ing also seems like a poor solution as I do need to have a
working bridge.

Any help, suggestions, thoughts?

Thanks!

Erik
