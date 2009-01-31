From: "J.O. Aho" <trizt@iname.com>
Subject: kernel 2.6.28/iptables <=1.4.2 not working together?
Date: Sat, 31 Jan 2009 18:17:22 +0100 (CET)
Message-ID: <alpine.LNX.2.00.0901311807001.24298@kennis.local.lan>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; format="flowed"; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org
Cc: trizt@iname.com


I have a iptables script that I have been using for quite many years and 
from time to time I have been updating as iptables changes.

If I run the script on a machine running kernel 2.6.23 everything works 
fine together with iptables 1.4.0.

Running the same script on a 2.6.28 kernel (the latest one I have tried is 
2.6.28.2) with iptables 1.4.0/1.4.2 will not manage to run all the rules

The one of the lines (the others are similar, different port numbers) 
looks like this:
iptables -t mangle -A OUTPUT -p tcp --dport 20:21 -j TOS --set-tos 16

Running it with verbose output, I get the following result:
TOS  tcp opt -f in * out *  0.0.0.0/0  -> 0.0.0.0/0  tcp dpts:20:21 TOS 
set 0x10
iptables: No chain/target/match by that name

I think I have loaded all the modules that kernel 2.6.28.2 offers and 
trying to run that line, but every time I get the same result.

Modules that I always have loaded are:
xt_dscp, x_tables, ip_tables and iptable_mangle

Keep in mind that ipt_TOS has been merge into xt_dscp and modinfo on 
xt_dscp gives an alias list with ipt_tos.

I'm quite lost how to fix this and would need some help.

Keep in mind I'm not a member of the maillist, so keep the cc: when 
replying the thread.

-- 
      //Aho

  ------------------------------------------------------------------------
   E-Mail: trizt@iname.com            URL: http://www.kotiaho.net/~trizt/
      ICQ: 13696780                                         Skype: jo_aho
   System: Linux System                        (PPC7447/1000 AMD K8/2500)
  ------------------------------------------------------------------------
             EU forbids you to send spam without my permission
  ------------------------------------------------------------------------
