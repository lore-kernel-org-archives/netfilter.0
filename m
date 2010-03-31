From: agashi shipora <gashipo@gmail.com>
Subject: uisng L7 filter in ebtables commands
Date: Wed, 31 Mar 2010 23:54:28 +0530
Message-ID: <x2v861e3bca1003311124sa0aa2ab6y94fa42c650ef16f8@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:received:message-id
         :subject:from:to:cc:content-type;
        bh=/Sf7/HOah5EstQrEoJXuXGe0gj3DowP0cvc0WwVqJP4=;
        b=MbIM9O/fu0efpL6wjniSw4xfFPi5igJGlo/Q9xX4OZkaRioOqqg8xBmuGC+MyHtNW+
         mYHiN6jhxeGooKLaJrC+AlPvaG62aGQ6/j+FJEWsNNAAJFElbovSZbLmbZSMhTO5jgHJ
         uwiMUEY0aN9MFb9w8RJRf5DFxHPoCZwETGjW4=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter-devel@vger.kernel.org
Cc: netfilter@vger.kernel.org

I want to use L7 filter with ebtables for setting a MARK on the packet
similar to how it is being done with iptables today.

Using brouting the bridge packet can be re-directed to the routing
path traversing the iptables.But all packets arriving on the interface
enslaved to the bridge would have to be brouted.This may not be
acceptable as a solution in my case.

example:
Whats available:
iptables -t filter -A FORWARD -m layer7 --l7proto edonkey -j MARK --set-mark 3

What needs to be supported:
ebtables -t nat -A PRE-ROUTING -m layer7 --l7proto edonkey -j MARK --mark-set 3

Is any work going on to port L7 filter to ebtables or does this port
of L7 filter already exist?

Thanks
GP
