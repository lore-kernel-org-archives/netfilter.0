From: "Marc Franquesa" <marc.franquesa@gmail.com>
Subject: iptables error limit match: invalid size
Date: Wed, 20 Feb 2008 15:17:36 +0100
Message-ID: <5db5e03e0802200617t9bf4d03ufe27fec5c80bf0bd@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
        bh=EyKaFC8DbxQc5vnLyvu8Ug1sTe2jrE8CYXATz8WsQuc=;
        b=Sq54PYSsOoz21g5xZShWPeTYz3hT/2tBhQpjwGXpa79hY+he82tFq0YKabGl/PR3dsUtKmJDLEqFUzQ3gq/tFxSi5xNk3sDCzbU7gJddXZOAwQu8dk1tSMKO4viWDcsoADR22VICkljdaL0pK5GvTJjcDIpPS2BwjRfdwXpOWAw=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

I get this error when I try to use 'limit' rule:

idoru:~# iptables -I INETIN -p icmp --icmp-type 8 -m limit --limit
1/sec --limit-burst 5 -j ACCEPT
iptables: Invalid argument

And in the kernel messages (dmesg) appears this:

ip_tables: limit match: invalid size 40 !=3D 32

This is on a Debian (etch) mips (SGI O2) machine, exactly the same
command on another Debian (etch) machine (x86) gives no problem.

I haven't found anything on google.

=BFAny suggestions?
