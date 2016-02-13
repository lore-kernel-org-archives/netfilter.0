From: Pavel Volkov <sailor@lists.xtsubasa.org>
Subject: nftables: limit connections per IP address
Date: Sat, 13 Feb 2016 20:48:42 +0300
Message-ID: <380c5e23-17ef-47f8-8fd3-33032d2d66a6@lists.xtsubasa.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,
I'd like to set limits on active inbound TCP connection per IPv4 address 
and IPv6 /64 subnet with nftables.
Can this be done?
