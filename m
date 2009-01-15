From: "Demetrios J. Tsillas" <jtsillas@appledor.net>
Subject: EBTABLES: init-table says kernel doesn't know about table
Date: Thu, 15 Jan 2009 10:56:32 -0500 (EST)
Message-ID: <be5b21bbb71de2072fd17ba3e02111cb.squirrel@www.appledor.net>
Reply-To: jtsillas@appledor.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

<sorry if this is a duplicate>

I am using the 2.0.8-2 version of ebtables with Linux 2.6.21.7 on a mips64
machine (big-endian).

Here is the sequence of commands:

I am using v2.0.8-2 with a 2.6.21.7 kernel running on a mips64 (big-endian):

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


