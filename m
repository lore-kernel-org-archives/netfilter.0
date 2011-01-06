From: Rich Rauenzahn <rrauenza@gmail.com>
Subject: limiting connection duration
Date: Thu, 6 Jan 2011 12:16:27 -0800
Message-ID: <AANLkTinqiKZNqixyB7jien-M=dg9bJ2wKSY6VmT8GUmc@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=U9XTsMCighpMKUbowgx6aI19s39dxsf/8xcj504YXPc=;
        b=PA/bPOyof4VfXmd6Rhf/klNSS3/nZQMLuIzw17kn6Q/2B0uxnBAlRX9wsRYgQVRfpw
         3wSQBPhT61nh7QyvalRH60tj1KvKhqW/rQi7Ocoy9tGaod0odhXjB4rFrVeeXpH43kKA
         z1aR8IOanW8dxVnv/2zee77nO+Z+MIOiP8deo=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I'd like to allow a connection to connect and communicate to a
specific for as much as it wants for N minutes and then have iptables
block the connection until the connection goes away.

The details of WHY I want to do this are in this redhat bug regarding
the NFS portmapper:
https://bugzilla.redhat.com/show_bug.cgi?id=666932

[In short, Windows 7 nfs clients don't disconnect from it (even though
they are done) and use up all of the portmapper file descriptors.]

I've written a script that manually adds entries to iptables to kill
the idle connections and also added keepalive to the portmapper
process via libkeepalive.   But a single iptables rule would be so
much more elegant :)

Looking at the --limit related options, it seems that all of the
options are about limiting rate, not duration of a connection.

Rich
