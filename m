From: Tom Yan <tom.ty89@gmail.com>
Subject: ebtables dnat rule gets system frozen
Date: Sun, 3 Nov 2019 19:14:22 +0800
Message-ID: <CAGnHSE=RxEesfAnzhHi+qteoWs1Mpc5BVWPn8zteEGqpTbgMeQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=5o1Qh59bEfFHZT6OcFAVdeEilPh4rVY2q0THO0SXj+g=;
        b=sylxUZFp1Ietv/2hqpWtCVnMu2fUE5juHJJQN7t5FwcNqCR/XvjwaOfdlEVG8Y1e9U
         aYr8jbV8kf/QhvLhYIWMjsdzAJxIk7fOX0995vZTahrGPIRqK2F+0zGkb1snOuZOsHKe
         LfAdZVIGw+5UP2gx7a8uqnSRANSFeLGixanr23oa5UjGkmsORAzrKlnxUDMKiXDVbUAB
         92FPCBuRdPtJz8E3od3+grcQn0iPWXMR69y8pWUNFCR4yxPlb+6mQOurB4v9f0+rvIcA
         bLEOzAb1GhCNY5LAd7BFUO8l+ovA4/EYsxF99UyJa/IIVQJI9lxX5jygk2fH+ykqsAoi
         9YyQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter-devel@vger.kernel.org
Cc: netfilter@vger.kernel.org

Kernel version being 5.3.8, after adding a dnat rule (to the OUTPUT
chain) with ebtables-nft in iptables 1.8.3, my system is frozen as
soon as I ping anything. I couldn't catch anything with dmesg -w. Can
anyone reproduce the same issue? I am on Arch Linux.
