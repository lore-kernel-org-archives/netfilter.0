From: =?ISO-8859-2?B?SnVyYWogR2Fi6O1r?= <juraj.gabcik@gmail.com>
Subject: nftables
Date: Thu, 5 May 2011 09:24:06 +0200
Message-ID: <BANLkTi=vKmGCm5t1tyUn_KuKMAJ8=UxqjQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:date:message-id:subject:from:to
         :content-type;
        bh=mqiqCIbm7qggXd+GkoMD+xnL/mzKu8YoRvlSWToMU4k=;
        b=GZ3Rr4x6xLGuq9IVbcBLrHD5Yuvwwj9aath8aJrAjsUqj6rXIiWBYjdOr56TdCG0FM
         5nVkhwSlx7dufgOaLMc87mSojOeAZNkBhoMe2HuzHF5CPpFMT9CD9VLnPmD5iRmCbt8+
         DP+mU/qw/wa2dzeQ5H+BhDGc4CjxebOqTHNRE=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi
I have a problem:
I try run nftables - i followed steps written here
http://lists.netfilter.org/pipermail/netfilter-cvslog/2009-March/006316.html
I downloaded kernel tree, and compile nftables into kernel
run new kernel wiht nftables support BUT when i wrote some rule f.e.
nft rule add inet filter output ip protocol tcp => drop , system
accepted it bud it doesnt have some effect - I still had internet
access
maybe problem is, that i have compiled iptables into kernel too - and
they are useful
so i tried compile kernel without iptables, but it crash
so can somebody advice me how to compile functional nftables?
sorry, my english is not very good :)
