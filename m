From: "Charles 'Boyo" <charlesboyo@gmail.com>
Subject: Compiling and using libipq on Fedora Core 5 & CentOS 4
Date: Wed, 23 Jul 2008 20:50:47 +0100
Message-ID: <a0410a580807231250w580bf169t23c49c413d799bb5@mail.gmail.com>
References: <a0410a580807231241o3527e899v533d37f32eaed47d@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=7odj62ti/q024XhIZ3Plw/njcnwtvxI1h8B+mu6gQf4=;
        b=GF1+P6oNzfWMwvC/pfh81XAgTbpg11jQqsmAiCGoH8oOL81890e29ldsdBuYiBb8O9
         Mep7ACsWWP5CS1YgyIPZzN0f/IxI2HiFllEnXpRr4CB/WBOGGfkHO+xohdzeyiKxTBqf
         kH/qvLintU6moOETbkzmCHyaqf5qP4T9gAReA=
In-Reply-To: <a0410a580807231241o3527e899v533d37f32eaed47d@mail.gmail.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello netfilter team.

I have a requirement to make some modifications to incoming UDP
packets and I am in possession of sample code that could be modified
to suit my purpose based on libipq.
However, attempts to build the applicaton on a pair of Linux servers
have failed. These boxes are running:

Fedora Core 5: 2.6.15-1.2054_FC5
CentOS 4.4: 2.6.9-42.EL

It appears the neither of these contain any references to libipq. In
its place appears to be libnetfilter_queue, however I am not about to
make any kernel levels changes. Neither do I have the code that works
with that.

The source code in question is as found at:
http://www.cs.princeton.edu/~nakao/libipq.htm

Thanks

Charles
