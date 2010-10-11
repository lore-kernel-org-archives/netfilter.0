From: =?Big5?B?qVCrwqfK?= <richard925215@gmail.com>
Subject: About lxc and libnetfilter_queue
Date: Mon, 11 Oct 2010 18:11:45 +0800
Message-ID: <AANLkTikytEZUNH9DRT-tAmuNy2-XwNZVgz6u4LggdR5Z@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=lBybfmhiMW7LCvXvC25FxuIteQSQ4JmoEyldyy9fn60=;
        b=emzogirJKk00+ZSYSu4L+0QG3eQWkH2IdtujuO1ubTIMNrKKXPvnqVWsOub9yd3q2T
         28wxph03xuCTB47klCd06xOV4Xf4xbdbn4hjUYjGmbT5i3glb1mdWnz8KKYGSn/RBQXW
         vB2tgTuD9fuRJQ//SMqKLa1mMkqKaK+pdzAxs=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi every body,

I'm a newbie to netfilter_queue use.

I set up a VM by lxc and installed the libnetfilter_queue on it trying
to forward the packets to the guest userspace, but it didn't work.
Do anyone else has been try this way before or had a similar experience?

I followed the website below to set up my container.

http://en.opensuse.org/LXC

All libnetfilter_queue related libraries installed by zypper, as
the following commands.

$ zypper in libnfnetlink-devel libnfnetlink0
$ zypper in libnetfilter_queue-devel libnetfilter_queue1

I really appreciate for someone who can help me to deal with this problem.

thanks,
Richard
