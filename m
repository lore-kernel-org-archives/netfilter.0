From: Jari Laurila <jari.laurila@gmail.com>
Subject: Re: SNAT with ipsec => return packets not de-natted
Date: Tue, 3 Nov 2009 08:54:14 +0200
Message-ID: <a906663d0911022254w6642c66aw17b9609624086a36@mail.gmail.com>
References: <a906663d0911011050w59ae675dmc70ee93132cf6990@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type;
        bh=OgGpaDLdp9r+JoGNrVxr2QKAfUkU+ZZLs2RXOEiUNlU=;
        b=Bh15cJeUDLsdSMkejsTlBnoYkivUkYGSxt5LtcYMWuhwRDPBZILBaEd4cXZ5hrKLHM
         mJmt1iwKA6uZNAHiitDuCEFQdfJYMWUnB5acMO6Z96vgFYZDAjJjG2w/4ihnHC3fi0p7
         nra7kmQH2yK6q47ByEpWOZ8xveNBrzfxMqPkg=
In-Reply-To: <a906663d0911011050w59ae675dmc70ee93132cf6990@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Don't anyone have any clues for the problem I sent to the list on sunday?

I find it really strange that decrypted packets coming from ipsec
tunnel with destination address xx.xx.xx.42 are sent through interface
ext1 even though ip -s route get xx.xx.xx.42 says that packet should
go through interface ext0b. Ipsec tunnel itself is going through
inteface ext1 but shouldn't packets get routed after they come from
tunnel? I even tried to look at kernel code to figure out why this
happens but I don't know enough about kernel and my c skills are a bit
lacking, so I couldn't find the cause.
