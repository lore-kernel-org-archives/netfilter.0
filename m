From: Stephen Satchell <list@satchell.net>
Subject: Systemd, nftables, and iptables
Date: Mon, 18 May 2020 07:13:21 -0700
Message-ID: <db383c6d-952e-1df3-4abb-a03d46d63959@satchell.net>
Reply-To: list@satchell.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

I'm building a CentOS 8.1 system on a Protectly four-port appliance, to 
be my new firewall.  To avoid problems, I'm trying to remove IPTABLES 
completely from the system so there is no chance of interference between 
the two firewalls.

Problem:  systemd requires iptables-lib.

1.  Why?
2.  How to keep systemd from requiring iptables-lib?
