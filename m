From: michael <mteicher@gmail.com>
Subject: iptables1.4.1.1 no iptables
Date: Wed, 18 Jun 2008 20:20:28 -0700
Message-ID: <66c5208e0806182020x5465cfb8s6dc73a156259a7a3@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=8sisL42FcVFM100cAa+laDMNWbabUYpQZbKpq/+yGGQ=;
        b=mTEuOGHMYbDeJJGk6yakZI92UixnGbht4GlxwmPeRxvghjaYqdkjaJQoyvZ/O5d41U
         iI3i9Y3bwVhBC2pMAMMH8Y/8C1ucn+Q2jY1hbYiM5SVSVnO0+rCYfiF7TnzrHA6J8KNy
         uKQyRkI5B8/TK0qjMrJM/xcM9Gochdyrs17xc=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hello,

On linux 2.4.34
ran configure && make && make install
Everything looks good but I cannot see where iptables was installed.
The only new file I can see installed is /usr/local/bin/iptables-xml ,
/usr/local/libexec/xtables (no files in there), and several man pages
in /usr/local/share/man/man8.

The install exited cleanly.

I have been running iptables 1.3.37 for awhile.  I have done a cursory
search and have yet to understand what I am missing.

Any help/pointers/suggestions are appreciated.

Thanks,

Michael...
