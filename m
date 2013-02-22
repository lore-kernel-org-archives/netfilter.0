From: Donghua Liu <liudonghua123@gmail.com>
Subject: how to write rule specification according to port availablity
Date: Fri, 22 Feb 2013 16:19:12 +0800
Message-ID: <CAJhv45gug+73Fr4w2s+snYzPn1bMK-BLbvJGpx1cJOQn6jhPfQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:date:message-id:subject:from:to
         :content-type;
        bh=e/hY5Fxp2gfdAMWlOT8y+C6ifqvYVFp72yxrHBXMYtk=;
        b=ErtpoPKC2vWUktqwNlzjy8DgGjFTF/X4a/4Gthcj898N0/nbEG6pgKCD2/ZegjjiMU
         JTix+DGfqc6c1CXuQJ8LIG2PVol2SwVI7+l4+u2cCGfyC5fmPcPOKU2ytl6GKG/b+kVG
         g4P+wksNhojbU4mRG3yAkI1Z4iAQ+phPTPeDlM4LY7fyfnHpncXHlSHevF2LouCgMhrp
         Ok9j8Cv5x7+DChRp37apNMDJrilz6VkfrsxCGDzieGrvPlGIMrskcJUwgSCovOkcWUgQ
         U25G49v/pNgbQH9cqTMI/v1Uuno5qLdO2IbVaVLAmCTfqSzfkRZDHYp5d3h+SDN7Zxy4
         aihw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,
Now I have such a scenario that I should write different nat rules
according to the designated locally port is open or not.
For example, if the port is listening then do the nat operation,
otherwise do not use this rule.
Any help would be greatly appreciated!
Donghua, Liu
