From: aft <aftnix@gmail.com>
Subject: bizarre behavior of NFQUEUE for tcp socket
Date: Tue, 4 Aug 2015 18:24:49 +0600
Message-ID: <CAGuaRCtn_qN4zRx9Ox8MpeaOOiZSzPWAoGu6d30t4fa1=kU-Bw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=laBDRnPz4nDuAz9TbGA2YZJ2gnDd3g5af1BT821P++M=;
        b=s3TFbdao1XoWvcjmOSlIUsUza4yAE7KOzG7vEguy+nv+PkByFDSDy8rS1DuykvHb3M
         bq9oz4IzSHG0xUJvBvl2cK/TE5WKj5Ajaq+CcoKeCJtFz+yyyO4MOp9pu7GtwUjwzjtG
         OMmaDg7Ms5oTxTsHUTriJnZZqprH+C2eQJDpm2hlwt2Vv66u/of+82SYRZqOBwo8BNSi
         sJnZS761Nrvb/uGO2r2tz5edx8ffd6rf12X1QVy4I4Ouq3XO1GY21sFD7CvvN2YDWT1a
         x37ktXVqZ2xC7oTLFAso/deisCyxu9o9pJZrg/rlPxyH+GuAZJR0Yz5sqGOQND+kN8rH
         ta8g==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I have a NFQUEUE which gets packets destined for a tcp socket. I
change some contents of the tcp payload and calculate new checksum for
the packet. The payload contains mostly encrypted stun messages. I
decrypt it from the NFQUEUE callback. After decrypting the payload, i
calculate a new checksum.

But from the server, which is listening at that tcp port, it gets
initial tcp packets fine(with decrypted stun payload). But after
couple of packets, when stun data indication packets starts to flow,
it suddenly reports a huge 2096 bytes packets and breaks down.
Although from the NFQUEUE cb, all send indication packets are reported
to have a length of 68 bytes.

What explains this bizarre behavior?

Thanks in Advance.
