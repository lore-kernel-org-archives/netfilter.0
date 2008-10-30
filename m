From: "Gilad Benjamini" <gilad.benjamini@gmail.com>
Subject: Userland Netfilter
Date: Thu, 30 Oct 2008 08:49:52 -0700
Message-ID: <4909d7a5.0fba720a.690e.70fc@mx.google.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:subject:date
         :mime-version:content-type:content-transfer-encoding:x-mailer
         :thread-index:content-language:message-id;
        bh=nUIKBToOysxZod3el4uS7brpQPYPB2MA/vD4GGfPEt8=;
        b=NkkSZvdYlRUhP7jiS01c2PoXSm+zmR3aG8mRJbB3ezyRkfkzRu6+r+cI35yqU9rLYq
         A9qjR/5IOmoDHliX66V6RGyw80LVDZKSNMmf8J6ueeRbIe0YAAfZ33hSfVJ7qQRkkGbn
         iFAkL/PXdZTB5YA6NGUgGUNlZfa9ZfZ6dHUTs=
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I need to create a userland simulation for filtering packets.
I remember running into a userland netfilter, but can't seem to find it. Any
pointers or info would be appreciated.
Another option is to feed the packets into tun/tap devices, and let the real
netfilter do the job. Performance, of course, is not a concern in my case.
Does that sound reasonable ? Tun/tap seems to be an almost dead project.
Will it work in newer distributions ?

Thanks
 

