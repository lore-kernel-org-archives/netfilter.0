From: "Cade Robinson" <cade.robinson@gmail.com>
Subject: Default netfilter kernel buffer size?
Date: Thu, 12 Jun 2014 16:29:36 -0500
Message-ID: <007501cf8685$69b9a460$3d2ced20$@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:subject:date:message-id:mime-version:content-type
         :content-transfer-encoding:thread-index:content-language;
        bh=saHfOH4Npb40iFxCk44r//UQhRF7paP4AYPC29K2tVc=;
        b=U5JIXMMFvHgrD0DqERABoIJOTEibP1mD6p0E1KTx0YQJ74vcUWh59e5eu9ytFgc/j3
         TeLXjc0Xd2Yav/J5jnC/mHAgEiObG23lAXK/mBBvkN3yjvdYbtSP++uSiEvW5LMyNJoj
         jX3UAUqIpjXBXbjM2R6FKTx88M8O9A5/yxxh7xbBlN4It6YiyF2/K3WA2tmzw8nQIJrG
         shaeELgiOgxMl75R4a7JW6CvkUFCZgqd8lpUFKpDk2dcCAI9eyRGofaE3EgkYqb1DaQX
         rlvNeErXjdRp6R6+4LK5pKeRidlrXDmzZwq8c8OrvcDkHeYw2i6GAFN2tCpja8MKS4sf
         BYYQ==
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I have been searching around and can't find it so maybe someone can tell me.

I am looking for the default size of the kernel queue netfilter uses and if
there is a /proc file to see what the current setting is?

 

The story is I have a program that marks packets coming into netfilter.

On slower devices while a blacklist loads I have run into ENOBUFS error from
recv.

I am thinking that if I use nfq_set_queue_maxlen to set this to a higher
number I won't get the ENOBUFS error but I can't find the default to know
what may be a larger number.

Also I can't find any /proc file to show me the current number.  Does one
exist and is it the same for 2.6.20+ kernels?

 

This is on a 3.14.6 kernel with netfiler 1.0.2 and nfnetlink 1.0.1

