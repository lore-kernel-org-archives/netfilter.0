From: "David S. Miller" <davem@redhat.com>
Subject: Re: Oops in replace_in_hashes (ip_net_core.c) 2.4.19
Date: Tue, 01 Jul 2003 02:47:32 -0700 (PDT)
Sender: linux-net-owner@vger.kernel.org
Message-ID: <20030701.024732.71580915.davem@redhat.com>
References: <S261808AbTGAJfh/20030701093537Z+14616@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-net-owner@vger.kernel.org>
In-Reply-To: <S261808AbTGAJfh/20030701093537Z+14616@vger.kernel.org>
List-Id: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: mikesmith1@btconnect.com
Cc: linux-net@vger.kernel.org, netfilter@lists.netfilter.org

   From: Mike Smith <mikesmith1@btconnect.com>
   Date: Tue, 1 Jul 2003 10:52:58 +0000

   please CC me, I'm not subscribed. I'm getting occasional oopses
   from my Linux box -- one every week or two -- and I finally managed
   to capture one (see below -- it's transcribed by hand). This is a
   RH7.2 based box, running kernel 2.4.19. I'm using iptables NAT
   to share my ADSL line. In case it's relevant, I'm using Johan
   Verrept's speedtch driver for my USB-attached SpeedTouch ADSL
   modem. 

I believe 2.4.21 has a fix for this, but the netfilter
experts will know better.
