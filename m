From: Viktar Palstsiuk <viktar.palstsiuk@promwad.com>
Subject: Is it possible to convert multicast UDP stream to unicast
Date: Thu, 29 Dec 2011 13:05:00 +0300
Message-ID: <CAKa7sPQxr1WD3n2so65MhxtRnDvuNhWyo+X62rR9Yz86G5Tfhg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:sender:from:date:x-google-sender-auth:message-id
         :subject:to:content-type;
        bh=dp64cCM7LKlGwtDY/eODAZWA3W4LsuYS8iwCZafj1Gc=;
        b=b592KrcNnTb/3U2W/95cbanjzu02Y3IRMFRl+kQqhJYVRJ5XcGryRZLtEqvgi0mGtY
         NC6var3sAEFCoriUBYPw387QOcfPy9aquO77qhNAawPEJbvmc7rYK2gMqCclSIJN2kfS
         UEOE6RfwyVXia2xFZDX4doAeZzrwCtg2ZmAy4=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,

Is it possible to convert multicast UDP stream to unicast stream
(specific destination IP) to be sent over wireless connection with
iptables NAT?

-- 
Best regards,
Viktar Palstsiuk
