From: evan <composingmotion@gmail.com>
Subject: How to count access attempts per ip and block automatically
Date: Tue, 20 Jun 2017 17:49:22 -0500
Message-ID: <1497998962.14144.1.camel@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:date:mime-version
         :content-transfer-encoding;
        bh=z7QQXkiN0A/TKL9T4TPZjszOg9UlKqYY/GwU7MICBMY=;
        b=s9Il2uMDOfKK49hDOfIHmxwMZ4w7GZHT4Cm4VMaDN+eGUXR5jgB+6vk8QMzwSVev06
         IqXsvTWwyoe7eFxX9NIJd0Vc3eZDkrA+4nTjo9FtTiu7iicVeoJ4NbQcl2LMC423nLEh
         GXeIz1bLylr47VHukSD7eO0IHXfszoHEFWbmqU8+LKygLP58EG3Y/ci1j5JERLtKG6zs
         Pylyp8MbQmdWBdj1Ut94JJ5GTsDgd1yeIL7a+D65iIj3hduLNe1RE8JYP9AyqFRc7JhC
         fvVvfM21Hk7QDcyVz2dco9EhbdW9C8lUrGdvNPWyglEP0XBYk0BGufA29KdB73SEGCGc
         TPeA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello Netfilter Community, first message, I would be grateful for any
guidance, thanks in advance

What I have already, watches for new ipv4_addr that are not on a
white/blacklist'set' and adds them to an evaluation set. 

however I would also like monitor the evaluation set and automatically
add to the blacklist any address that for example 

attempts more than 25 connections on port 22 per hour.

probably this is has been explained alas I have yet to find this issue
described elsewhere. Best regards
