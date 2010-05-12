From: =?UTF-8?Q?Mamadou_Tour=C3=A9?= <e2ia.ci@gmail.com>
Subject: iptable how many rule can manage iptable
Date: Wed, 12 May 2010 17:09:45 +0000
Message-ID: <l2vf1cc03e01005121009j3ce0e30cj56ac615688a58916@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=9L3FoGLW6kujHcmkLxqQS46Xgjv3H1rUWhCXcPRb2IM=;
        b=tC2QI0stSZTl8UBASW/J5vwVihIkHFFYObnC2P8U2bbBi92bL2O+2GZfVhgsUbVyj2
         rMGJTQfg9VYKDCuBeA8GUfQfPcrab/KZlEXjSWq5Es0UURnlJcGOW1QPgdHHDVF923tM
         Ee6dv+2gk4qJX/ptvkg4qqI+ksBGWFDrHrs04=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi, all
i'd like to know how many rule can manage iptable.
I'm asking that because i'd to drop all traffric from my localnet to porn site.
I've a database of porn site witch contain about 900 000  domains.
I know there are solutions like squidguard. But for my linux box i'd
to use iptable to prevent users access to porn site and other
blacklist site.
I waiting for your advices.
regards.
