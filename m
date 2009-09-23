From: Richard Horton <arimus.uk@googlemail.com>
Subject: Limited logging by dest ip address
Date: Wed, 23 Sep 2009 12:08:59 +0100
Message-ID: <56378e320909230408v41cd97b0n70afdb5d4a0824c2@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type;
        bh=pqUJMyB1gx+8v+VV22+mhAJ4I3idDzs6gwDB/DKb4MI=;
        b=eJB8dgioYRgin+8w9rjFbJ2PpueN2Zq31Rop6w57axEhaVgDuzBeqOrZbYz/+AH8B2
         WRHeHw5YQ17xpA6+3xQQypFJyM3PHU6LRgqNI6J+fkumEDJ4+6TmMhQLsgZS0ut5Kq18
         dFHyr8TyBKKGLGLRuAqmDRkaxzKALKEAT1a9k=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I'm setting up a firewall on an embedded linux router/firewall with
limited (well relatively) log space.

I'd like to limit the firewall logging for dropped packets to 1 packet
per minute per destination ip address.

I can easily limit the logging to 1 per minute using
iptables -A LOGDROP -m limit --limit 1/min --limit-burst 1 -j LOG
--log-prefix "FW-DROP" --log-level warn

What I can't see an easy way to do is limit logging based on
destination IP address...

iplimit is more about limiting connections by address rather than
throttling the logging back and works on concurrent connections not
the number of connections in a given time period.

If I can easily limit logging by destination ip address and a time
period then fine, otherwise I'll just limit logging to a time period.

(Note: dest ip address is unknown so its in effect something akin to
pool based matching but I don't know the number of pools I'd need...)



-- 
Richard Horton
Users are like a virus: Each causing a thousand tiny crises until the
host finally dies.
http://www.solstans.co.uk - Solstans Japanese Bobtails and Norwegian Forest Cats
http://www.pbase.com/arimus - My online photogallery
