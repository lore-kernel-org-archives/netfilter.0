From: Stephan Arndt <arndt.stephan@gmail.com>
Subject: Writing nftables extension / modifying packets via nftables and netfilter
Date: Fri, 8 Apr 2016 13:04:47 +0200
Message-ID: <CADe663unBJZxLKgvbHh7rhZGOjmrYo8O_n4os8Boex0VcwBSvw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to;
        bh=94O88MVg9FfIWoyYa45ORve6j3exg4DnSrf6dU0CK5w=;
        b=HtNt0vG2p17IGeyt6fs/2+gKk0uZbZBJTnwOivXPCv+Jr7iPj03LmSgycukAfcv7RX
         VP+5g+JlDKeldECkKwaqtG/SaESO3mi8c03NqBuWoAH9XuCDoZ3ck/4zNRi0ydc/ud0Z
         JWpW7iKC6fJsMDZThgjqPXdAq0aUFVkH8oW1dmboc2TssCPl99XzSdj4pV7xPCMUUvaI
         X/Pg/MvtMG7S8VjA9WdyaJkOiFRe2RIlGZCr23lkoalFku8gcG+TIco2hS4ZjFDM6zgN
         IWn1vyq95e/W1PihBLGQ2c5VyWwfOr8+Dkt5dCDzLVEXx/xUWydzg8Q5WtVUrKTaV2WI
         siXQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello!

I've originally written this to the netfilter-devel list, but got no
reply, so I thought I might've asked in the wrong place?

I would like to write a netfilter module to modify packets going in
and out of my machine (TCP/IP headers, maybe content) after some
analysis of the packet. For this, I wanted to extend nftables with new
matches or targets that control this modification behavior. I've
looked around some, but couldn't find documentation on how to do this
properly using nftables, can someone point me in the right direction?

Using a netfilter/iptables combo, this kind of extension seems to be
pretty well documented (e.g. at the HOWTO page for netfilter hacking
[1]). I could also go this route, but as nftables seems to be poised
to succeed iptables, I wanted to try my hands at using the
future-proof technology.

Regards,

Stephan

[1] http://www.netfilter.org/documentation/HOWTO/netfilter-hacking-HOWTO-4.html
