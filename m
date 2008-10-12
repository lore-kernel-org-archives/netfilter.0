From: okahei@gmail.com
Subject: CONNMARK target
Date: Sun, 12 Oct 2008 19:12:58 +0200
Message-ID: <ab52e4180810121012he399cf3pb7c1a4b9474f872f@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=jdkae7WZsgSnq8BO9nySqGnrT5Th2UpA9YOc0yvSGFw=;
        b=d1Vz6lztmB7I2NvPxJhmFXwY7bIkD9vFjDoS22E7/Z4xWWU1ErynxcYfa1diaqD9bH
         fouT2gctB6X8PKx3B6kbClx75PTyYlFk1of8G3to8Yhc3PkOtag8P1J7IZRVEhVTebvz
         TqYwvW0mvtPNM+uyPLZaWcjgYpvMbMtP+jkHk=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello list.

I've got a question with CONNMARK target.

It's possible to mark whole connection playing with this parameter ?

What i want is when a packet arrives to port 6900 UDP of firewall,
mark it with 0x99, and when the response packet arrives again from DMZ
interface of the firewall, are marked again with 0x99.

I want to mark only packets arrives from one interface of the firewall
plus the response must be marked too "dinamicaly".

I can mark all outgoing packets src port 6900 udp coming from DMZ
iface, but thats not what i want to do, becouse i want tou route
packets back through the corresponding inet iface that thouse udp
packets coming.

Then i can do something like:

ip rule add fwmark 0x99 lookup table2

Is this possible ?

regards
