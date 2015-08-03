From: Dovydas Sankauskas <laisve@gmail.com>
Subject: limit NFLOG PCAP to 64 bytes
Date: Mon, 3 Aug 2015 20:49:35 +0300
Message-ID: <CAB_DuvDY0QKxdw3-RCdHtU=+SopsCMnNmduKBjxT9EaY=FnG4Q@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=f/XB6gwJNAxE9ohWzZ8Di5yQY2VM5FDbZIe9uvbElhc=;
        b=exAmHxHcCL/opwAMzrJLFkXcwpkEGJQajEclERyurO0+vKnI7oJfOqfaaVZn0ZDNRT
         jNK5nA5L9rsxHPdH10uG9LhJS4mwBVujgyTRnNSR46IfGnADI3JDzWrz7NjX93Tunu+R
         6XL86+foSRHeyMS7DC7cMuGq7NYFwDdLS7D1HAmUx6aMY3N352Zu1ZClSyoCNjz7z/v8
         C5DIavvxdCla5m6fN5toFUogpV11hqkkSr5lLTfJmGRdbVDob7ylJUgjf5nbei9XdnwW
         iXOFreIv17hRrcwDv+5Z1oe/n6DeyRaegosSnGfY4u8aHc2/j2S8/Ms4Wi2foxGMnQBq
         8T7g==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I am trying to limit logged packet size to 64 bytes.
-j NFLOG --nflog-group 1 --nflog-range 64

However I get full size packet log.

I use ulog2 with ulogd2-pcap.
On Ubuntu 14.10 machine it is at version 2.0.4-1
On Debian Jessie it is at version 2.0.4-2+deb8u1
Neither works. I get full packets no matter what I try.

I believe that I've set it up correctly.
Am I missing something here? Please can you help?



-- 
Dovydas Sankauskas
