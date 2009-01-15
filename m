From: "Demetrios J. Tsillas" <jtsillas@appledor.net>
Subject: ebtalbes: --init-table returns "kernel doesn't support..."
Date: Thu, 15 Jan 2009 10:29:01 -0500 (EST)
Message-ID: <a4571743e2a49619b3e3106b2e49f6d7.squirrel@www.appledor.net>
Reply-To: jtsillas@appledor.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I am using ebtables v2.0.8-2 with a 2.6.21.7 kernel running on a mips64
(big-endian):

vmalfcvm40:/home/jtsillas/ebtables-v2.0.8-2# ./static --init-table
The kernel doesn't support the ebtables 'filter' table.
vmalfcvm40:/home/jtsillas/ebtables-v2.0.8-2# lsmod
Module                  Size  Used by
ebtable_broute          4992  0
ebt_pkttype             4480  0
ebt_ip                  5376  0
ebtable_filter          5248  0
ebt_snat                5760  0
ebtable_nat             5376  0
ebtables               29952  6
ebtable_broute,ebt_pkttype,ebt_ip,ebtable_filter,ebt_snat,ebtable_nat
xt_MARK                 5760  2
iptable_mangle          5760  1
ip_tables              27600  1 iptable_mangle
x_tables               25488  2 xt_MARK,ip_tables
tun                    15104  0
ipv6                  433712  24
cavium_ethernet        51536  0


