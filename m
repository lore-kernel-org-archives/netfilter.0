From: Nick Khamis <symack@gmail.com>
Subject: Re: Dabase BAcked IPTables
Date: Sun, 30 Jun 2013 09:27:43 -0400
Message-ID: <CAGWRaZaCaXiHabg478qKrFu=vdghJ2=oofkDYhm243DciZvEtg@mail.gmail.com>
References: <CAGWRaZYZnq3bneKNdisrRAfk=9PvKD=cXVWN_b0ySVRMaPw9Dw@mail.gmail.com>
	<1372536635.3924.89.camel@andrew-desktop>
	<CAGWRaZbQXv=J8YfofS4HEUYovcLTdoW5yvLpKdfP83rOkyRyng@mail.gmail.com>
	<201306291700.53177.neal.p.murphy@alum.wpi.edu>
	<CAGWRaZaWGwQ1KcdXXLN-fVCOVJzMa83s7_1h9eBcBnzQZK1bcQ@mail.gmail.com>
	<51D02105.4070201@googlemail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=RzSmw0fRxLNuG2Vc98GNpkek7SKRNMiOl2Ma9/hmFFw=;
        b=JKQzbqQCbIM9Wo1uVyEyNEorpcPXAyRYU7YLqomZizFUaiYULicTgd6uIMp5x3jMV+
         Qy9gIuKgCasQEWn0NZoJf6Hgw2Hym0hNsAKpKvz8YUd1coByLYyAQ8y9tbK0tUVhhnry
         RML0owsdocbejzRFbzaD42vJGjOwnDWvRMFkjzomwR5SB1oyNAP36nrM4U3DNSCmJ6db
         9dR0XiotsE1a6NQvn8f9e3fGQwGdHaOrN3RjuYEWGcpXmoeb8VenXSy3yldS9oIBy3ox
         F9WfedXzWvykPBWNQttFIOS75WifMK5OQpYuJ+t1KQ46RmPIWSoplACUmTRUV4kfcFZU
         5oRQ==
In-Reply-To: <51D02105.4070201@googlemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dash Four <mr.dash.four@googlemail.com>
Cc: netfilter@vger.kernel.org

>> why don't you secure the signalling using PKI

I think this is the smarter way of doing it.

>> The server on your side of the connection won't accept it unless a secure handshake has >> been established - job done.

I am familiar with PKI and SSH handshake. In this scenario what would
be responsible for securing the handshake? Can we use iptables to
match public/private keys and establish a secure connection? We really
like to abstract outwards the different services (i.e., leave SIP
related doings to the SIP server, and handshake securing to OpenVPN?).

>> OK, that won't prevent you from somebody ddos-ing you, but you could easily protect
>> yourself from this using standard iptables tools.

I think with PKI, and standard iptables ddos is less of an issue?

Guys, thank you so much! And thank you iptables for making our
networks a little more secure, and the internet a little more
bearable!

Kind Regards,

Nick.
