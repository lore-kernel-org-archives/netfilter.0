From: "Gilad Benjamini" <gilad.benjamini@gmail.com>
Subject: Direction of netfilter development
Date: Mon, 9 Feb 2009 06:48:24 -0800
Message-ID: <49904249.1d078e0a.40d7.ffffa3b0@mx.google.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:subject:date
         :message-id:mime-version:content-type:content-transfer-encoding
         :x-mailer:thread-index:content-language;
        bh=+x7OI6Qz9vq8yWQWi6i0NtFadIvGPioqQ5aP6cvE4Kk=;
        b=K6yzN9z5kQL2aZhbCxBm8fvh1YPcfhKY+sCB6BgB0GdXrmJ9OV/P8fKqOcCUCrB3JE
         MRnGkCc43/Dg8nT+cf1jRjZclpOOdB2IXyLnN6pdHh3HdjTgtkRHqWYDfYx0ELWknqia
         hv0o3vvUFD1SOLbLEQ5ylGHkXEnN42JttJ764=
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Looking at the direction the netfilter project is taking, it seems to be
moving from an IP orientation to a more general packet orientation, and if I
understand correctly, aims at unifying such tools as iptables and ebtables.
Is there any document out there that describes where netfilter is going ?

