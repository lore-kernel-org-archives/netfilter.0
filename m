From: Richard Andrews <randrews@pelmorex.com>
Subject: Stopping ip_conntrack_max from resetting
Date: Mon, 24 Mar 2008 10:09:04 -0400
Message-ID: <496A9F867C284A47A25BF0FB1A1EF819126005CFB9@exchange-mb-01.office.pelmorex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hello,

We have a system running iptables, of which due to the incoming traffic we've had to increase ip_conntrack_max via sysctl.  However, when restarting the service during any maintenance the value we pass during sysctl.conf is reset to the default 65536.  Which then we are forced to run "sysctl -p" to reload our custom value.  Is there a way to stop the iptables service from rewriting ip_conntrack_max when issued a restart/reload?

Richard Andrews
