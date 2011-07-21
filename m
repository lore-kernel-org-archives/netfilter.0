From: Stephen Hemminger <shemminger@vyatta.com>
Subject: Bridging netfilter and forwarding
Date: Thu, 21 Jul 2011 09:05:25 -0700
Message-ID: <20110721090525.09d8e10d@s6510.ftrdhcpuser.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

There is a recurring theme of people that want to forward link
local multicast and other packets. There is a patch that adds a mask
value, but I would prefer a more general solution using netfilter/ebtables.

Is there some way to use actions to do this better?
Or change the existing NF_HOOK somehow do this.
