From: Chris <chris@deksai.com>
Subject: Parts of firewall disappearing under load
Date: Tue, 2 Jun 2009 09:52:00 -0400
Message-ID: <20090602135200.GA3494@chris-laptop.a2hosting.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

We've got quite a few heavily loaded boxes (ISP shared servers) which
have firewalls enabled.  The firewalls basically allow certain ports,
block some naughty IPs, and use limit and recent to keep some services
under control.

What we've noticed is that on rare occasions, a box will
firewall itself off from the world.  After a few times of this happening
we found that we could sometimes ssh in from certain IPs, but not
others.  That made me curious, so I did a diff of iptables-save output
with a known good state, and sure enough, the two weren't the same.
Much of the firewall was just missing.  I'm not sure if the firewall
rules it output were actually being used or not.

My only guess is that we are being hit particularly hard that day, and
perhaps a table of IPs is getting too large.

Has anyone seen this before?  There isn't anything in the logs to give
me a clue.  If anyone has pointers on how to further debug this, I would
really appreciate it.  

We are using CentOS, with kernels which at this time are
2.6.18-128.1.10.el5.  If I need to be asking on a CentOS or Redhat
specific list, please let me know.

Thanks,
Chris
