From: Payal <payal@scriptkitchen.com>
Subject: passing data transparently
Date: Sun, 26 Feb 2012 10:03:56 -0800
Message-ID: <20120226180356.GA25431@scriptkitchen.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi all,
I am helping a friend with this setup. They have a device which has a
fixed ip (say 1.2.3.4) which talks with its software running on
MS-Windows which must be physically connected to it and must have a
specific IP (say 1.2.3.5) only. Now it happens that the laptop running
that software is in a branch office so physical connection is not
possible. So, we have thought of,

Device(1.2.3.4)<-->(1.2.3.5)Linux(ext add.)<-->INTERNET<-->(ext.
add.)Linux2(1.2.3.4)<-->(1.2.3.5)MS-Win Laptop

The idea is that the laptop thinks it is dealing with device and the
device thinks that it is dealing with laptop, while both of them are
dealing with a black box (Linux) which is transparently passing the
data.

Is this model right or can we make it better? I am unable to figure out
the exact routing (and iptables) part. Can someone help in this? Do we
need ip or route will be sufficent? Or is there any software which will
pass data transparently like nc or xinetd does for a specific port?

Thanks in advance.
With warm regards,
Payal
