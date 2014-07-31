From: Paul Greenberg <paul@greenberg.pro>
Subject: firewalld and iptables
Date: Thu, 31 Jul 2014 13:37:50 +0000
Message-ID: <1406813861186.50144@greenberg.pro>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi,

I installed CentOS 7 a few days ago. It seems that iptables commands are still working.  For example, I can still execute:
$ iptables-restore iptables.rules
However, I am unable to permanently store the rules. 

CentOS has a new deamon, called firewalld, with firewalld.conf file. Does any one know how how to force the rules in iptables-save to be permanently saved by firewalld daemon?

Regards,
Paul
