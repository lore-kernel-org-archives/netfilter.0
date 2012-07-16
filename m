From: steve kyrn <stevekyrn@gmail.com>
Subject: Change packet inject it back to the queue dosnt work. However inject
 copy of the packet work
Date: Mon, 16 Jul 2012 23:32:51 +0300
Message-ID: <CA+dk8vsqbsNv=nHFJfWFV7kieAQ1KJ4yvDqbnptVbv+p402YDw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=pjtWxQI2n9y8pJEXz9MxD0lsr3RZr/LkKeSv8VYdTTs=;
        b=QMbL+GPE9gDBQhsahrMaVr0Fe5Bb+JqCaTK8WEOuduAs5EbRwqRfkh03C/+aYG8vgz
         UJHkTUkivPuuxy3y+gVK677kAu5Edo3FZMUhj7ACT7isRuh9jn28CkmJSiK7clggDvvS
         Hz6F1fGzt2qBGlru1Xc8Ui/F2TGaTx2SBUrHDfE1mHiJ3fE46SZlBTdG9Mu1piK+M7y1
         /MynrmTqp2hKghQAuKWvqX0gKJNeFT68Yww+orDCw1pj4sfJJvRUSArna/yD4wAqGhg9
         4/NTqgdnANBJjqJ+KfmqhRePcxALeEcr1Cf+DI15Q/dPjuKVEFkDNFnOC/L978aBZ8la
         +ufA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I am using in libnetfilter_queue library.

I need to change the dest ip in the packet. I change it and inject it
back to the queue like this :

nfq_set_verdict(qh, id, NF_ACCEPT,size, originalPacket);


but change didnt take affect.

How ever if i change the packet copy it to new char array and call to
set verdict with the copied array than the change take affect.

Am i doing something wrong?

Thank you
