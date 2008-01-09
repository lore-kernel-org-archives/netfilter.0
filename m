From: "Videal ,)" <videal@gmail.com>
Subject: Is it possible that iptables reads a trace from a file?
Date: Wed, 9 Jan 2008 15:46:32 +0100
Message-ID: <9c90ecd00801090646r268ee7f8scf67bcfd53380cda@mail.gmail.com>
References: <9c90ecd00801090645u2c1adb71n653eb3209a7a6ceb@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=B4ooeCS/mSqgVYEh0HgCSjcf6eSZt5FbIHr/HpkPswU=;
        b=JO5FCzeMCbCLezhXunsWuKTPMvFr1MZOGAKr0n8qMOFnmdzNizgCYYtOdXIVdtFZpJTyn+VsWOK2sM0apjzW8r3uyJn5mJsKQwG/Dgarplc2QdL7AG/zX7bH1t2Tep5k1cKuiRdjMpMDqGQsd+hjSDFNNqgnybDmtjfCn7MGBqE=
In-Reply-To: <9c90ecd00801090645u2c1adb71n653eb3209a7a6ceb@mail.gmail.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,

I'm using iptables 1.4 with layer7-filter and I would like to know if
it is possible that iptables get the packets from a trace saved in a
file. I mean, get the packets from a file instead of a normal
interface. I know that perhaps I could make a dummy interfaces or
something like that, but I would like know if there is a more elegant
way to do it.

Thank you!
