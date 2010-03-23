From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: Re: Nat and firewall holes
Date: Tue, 23 Mar 2010 12:50:39 +0530
Message-ID: <cfeab66d1003230020j1d38a9c3y5b6da0758cf92bd5@mail.gmail.com>
References: <cfeab66d1003220846h20c255d4u280ada41d2df1a2b@mail.gmail.com>
	 <4BA7A4F9.6020001@plouf.fr.eu.org>
	 <cfeab66d1003221027v65611783vf342e3038744a0f6@mail.gmail.com>
	 <4BA7AB63.6090908@plouf.fr.eu.org>
	 <cfeab66d1003221043g2057a7d3n4a6affac6429a323@mail.gmail.com>
	 <4BA7C79F.9030505@plouf.fr.eu.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type;
        bh=o8c6MuMYW1TSVAJuj3agS7rjFiMKIY1+xs4VXWZGcgI=;
        b=VSDyTNVWppL/QEMsfEaNEM2HIJA0dR5C56bI1FO3Szlp2oOgMhceE3mKfSElfP/K3l
         Qk55WR2aEf4mOSdQmoD1sf2zzSGMW8/2rKmEiI468fbxyhGHyW9yj8/bOJHN4rOPgH1g
         Mn86g+RutFE8GqZNpPkRwXrIsSYBeB2F64HdE=
In-Reply-To: <4BA7C79F.9030505@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

>> Pascal Hambourg <pascal.mail@plouf.fr.eu.org> wrote
>Actually not in your masquerading setup : INVALID packets skip NAT
> (which is good enough a reason to DROP them in a NAT setup, in order to
> prevent private addresses from leaking outside), so the packet won't be
> demasqueraded and will fall into the INPUT chain instead of the FORWARD
> chain.

 beautiful answer .
 Thanks a ton for  your valuable time .
