From: Jacky Lam <lamshuyin@gmail.com>
Subject: Ebtables usage
Date: Tue, 15 Feb 2011 17:04:23 +0800
Message-ID: <AANLkTikpZ+q-L7AcYPmZzED3QAtNF-mDx47E5kfo41CW@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:date:message-id:subject:from:to
         :content-type;
        bh=NU66q/18aICvqjuN0z6KHlbAswh+w16Exic6/dymvY8=;
        b=aIKwE4cJYQfCmvAdS3MZkf0Vgqtw8qkAqHKtLSqAyfNExh5civOA2DGZWEiQb/NdGn
         NzSzWv+TcvGRacIa6Z78MYmUc8RNX5vzR+jpzwYnqvGBiCo8aHm3DpktS4YGP8O63PMB
         GjpbtiAYYAUD3Q5LLN/BH6OXAxeikrwuM9ywA=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

     I am a dummy about network administration. But I currently setup
my Linux box as a switch to forward the packet from eth0 to eth1. But
I find the throughput is not good. It seems the overhead of IP stack
is too high. I want to know if ebtables can allow me to do the job
below IP level? If yes, can anyone show me how to setup up that?
Thanks very much.

Jacky
