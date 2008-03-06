From: Stephen Hemminger <stephen.hemminger@vyatta.com>
Subject: NAT packets leaking out with source address
Date: Wed, 5 Mar 2008 16:52:31 -0800
Message-ID: <20080305165231.505bdd44@speedy>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Patrick McHardy <kaber@trash.net>, netfilter@vger.kernel.org

QA is seeing some (not all packets) going through a NAT router with the
original source address.  Is this a known problem? or a configuration issue?

The packets are ICMP echo requests coming in at almost line rate, so some
table could be getting overloaded?
