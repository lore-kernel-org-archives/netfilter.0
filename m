From: Saravanan Chanemouganandam <schane@osmozis.com>
Subject: modprobe ip_tables problem
Date: Thu, 27 Dec 2007 15:25:21 +0100
Message-ID: <200712271525.22491.schane@osmozis.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi all,

Can anybody tell me, why iptable tries to load ip_tables even though it is 
compilled and built statically into the kernel. I prefer not to build as 
modules to have very small size root filesystem on my flash memory and  
therefore, I built everything into kernel.

On perofrming the following rule setup, it throws modprobe error.

 cm-debian:~# iptables -t nat -A POSTROUTING -o br_wan
 -j MASQUERADE
 modprobe: module ip_tables not found.
 modprobe: failed to load module ip_tables
 modprobe: module ip_tables not found.
 modprobe: failed to load module ip_tables
 modprobe: module ip_tables not found.
 modprobe: failed to load module ip_tables
 modprobe: module ip_tables not found.
 modprobe: failed to load module ip_tables

All the supporting netfitler tables are built directly into the kernel. The 
mailing list discussion says no need to perform modprobe ip_tables, modprobe 
iptable_nat, modprobe ipt_MASQUERADE etc., if it is built into kernel. But, 
still I face the modprobe problem. 

can anybody precise why I keep getting this error?.

thanks
Sara
