From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: ebtables PREROUTING -drop
Date: Wed, 4 Aug 2010 16:35:19 +0530
Message-ID: <AANLkTikUczLiyxy3A5eVv7bg1XWhH-ggN1yUv2-EwLYM@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=wkFOTtyEtH96LNWqfeul4akyWh5/DtZNAF8TogHa0ts=;
        b=UPiWlqUGbbrMPsRKWlPErRpHrOYSvHA3V2COC4b8RwL+IdXSncQz8eeyetPG8w2O/9
         vIh+2UF0CavIgfXosMM3ZUFG/2mT2J7vm8HIkcW+1whHms95V80QGZ85tf8oq8KUelje
         MrsiNYJkwrXXAQQBkbYQhrteFmMAJy1ZNqLpo=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: bridge@lists.linux-foundation.org, Netfilter mailing list <netfilter@vger.kernel.org>

I  googled and  understood that "If we  DROP a packet at BROUTER chain
, it will be passed to upper layer  and netfilter subsystem will
process those packets .

What will happen,  if we drop a packet at PREROUTING chain  of ebtables ?
