From: Benjamin Kingston <list@nexusnebula.net>
Subject: IPTables physdev and bond0
Date: Wed, 21 Jul 2010 07:32:38 -0700
Message-ID: <AANLkTikwcBaQpSsedZBLFWfsGK6Gsj-KJ7u46dAZ2G8_@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I have a bond0 interface with eth0 and eth1, which is then bridged under br0.

Packets will not forward to a br0 connected VM with

-A FORWARD  -m physdev --physdev-is-bridged -j ACCEPT

Right now I have it working properly with

-A FORWARD ! -d 10.0.0.2 -j ACCEPT

I hope there is a more ideal solution, and would appreciate any suggestions.
