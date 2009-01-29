From: Didster <didster@gmail.com>
Subject: Multiple Incoming connections
Date: Thu, 29 Jan 2009 22:12:02 +0000
Message-ID: <bb09457e0901291412g1ad7f906x7251d1f3c866e712@mail.gmail.com>
References: <bb09457e0901291258n35a64c07t3f36fd935f98f71c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=RJC0f/BJinmXZPk3SjiOuv6gsv5WKm0aM69G/GJh6g4=;
        b=l2AornSeHQcTaNXtoVDachbt0d844Ok0nt0Ifg5079RukPXDN3k09QuqSVrZ26TGmd
         tlUxacS4+8brMhPsepOqK2acSOLQoAvN1T42dgBCwyrBVo2rMFN8uygYpke8X107sAyz
         YLH4PxMxPPDVv3AQvlidA7bKEqq57hv/mXdno=
In-Reply-To: <bb09457e0901291258n35a64c07t3f36fd935f98f71c@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: netfilter@vger.kernel.org

Hi there,

This is probably a very silly question, but here it goes.

I have a linux box which I am using as an internal router
[2.6.18-6-686].  These machine is connected two multiple ISPs via two
separate NICs.  The connections are not direct, they are via PIX 501
firewalls.  Both NICs use private IPs and the PIXes do address
translation.  A third NIC connects the machine to a LAN.  The default
gateway on the box is set to the private IP of PIX 1..

I am trying to get incoming connections working from both ISPs.  I
have apache running on the machine.  Both firewalls are set to allow
port 80 though and translate it to the IP of the linux box.

An incoming connection to the public IP of PIX 1 works just fine
But an incoming connection to the public IP of PIX 2 does not =96 unles=
s
I change the default gateway on the box to be the private IP of PIX 2.

A trace shows the connection coming from PIX 2 and then the reply
going back out on PIX 1

I have rp_filter switched off and ip_conntrack module loaded.

Does anyone know how to stop this?  I thought conntrack would send the
related traffic back out of the route the initial request come in on.

Also, another question

Does anyone know of the best way to implement fall over routing on
this box?  I have tried playing with /proc/=85/gc_timeout but that
doesn't seem to work =96 I guess because the next hop which is the
private IPs of the PIXes never go dead.  Currently I am doing it with
a script pinging a website and manually switching over when it goes
dead.  Sure there is a better way :o)

Thanks!
