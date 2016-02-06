From: Scott McGillivray <scott.mcgillivray@gmail.com>
Subject: two bridges back-to-back with veth pairs, SNAT not working and
 traffic goes missing ?
Date: Sat, 6 Feb 2016 10:08:51 +0800
Message-ID: <CABXj3oBJRF6fT7EFKwy-ywpeZEVP_O8jBThmO2OOWTRO5D5bAA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:from:date:message-id:subject:to:content-type;
        bh=ZTOfoAvU3tkUmyqEtaoIvo8Qbav4ugpIoBn3FLK3XZw=;
        b=QWBD35bgsdPmU1VQnbjWgJx3XGH9KA0L786SmNU9//y9JGHzKGfGBbKwh2zwmaAKBl
         drrZRO16C2FLMCeGi9hT7hvRn3VWDgw5PZV3J5MYsUlZR2QGXvJC5IdvPImGNdRISWTY
         0x012tcJ9AqSkw75QRwC2jrAoScwD0a05SYY3ydM+I3lavZJ2YneV9rzsFUdHGlBqCfq
         Tgtxgaa48/5ENjCf0Z+TpJ+7RdTvVHd15xYVG7om5zhoi6BoOC0t8yrukAL97iCusDX9
         ieQ7p/fz0w0BZC2meU8aNr/poMHiF+VljEUiksuDoMP7mKvlwYhSVr80mfwCWGkCZSKq
         tupg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi

I was testing what i thought to be a simple setup with two bridges
connected back to back with veth pairs and then iptables doing SNAT
but for some reason the traffic goes AWOL and tcpdump output is quite
strange.

I posted full details of the problem here
http://superuser.com/questions/1035443/rp-filter-not-working-still-get-martian-errors-and-dropped-traffic/
hoping to get some help but after someone else helped test my config
and got the same result the suggestion was a iptables/netfilter bug.

I've read on a couple of sites that this 'problem' has also been seen
with xen and openstack type setups and the solution is to disable
iptables for bridges or use NOTRACK.

I'm curious if anyone can explain if this is expected behaviour or
maybe is actually a bug ?

Thank you.
