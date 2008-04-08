From: "Eric B." <ebenze@hotmail.com>
Subject: iptables -j ROUTE --gw xxxx not working?
Date: Tue, 8 Apr 2008 14:38:54 -0400
Message-ID: <ftge49$b4h$1@ger.gmane.org>
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I'm running RHEL4.2 with iptables iptables v1.2.11 from pkg 
iptables-1.2.11-3.1.RHEL4.

I've tried the following command but been told that --gw argument is 
unknown:

# iptables -t mangle -I POSTROUTING -j ROUTE --gw 192.168.104.251
iptables v1.2.11: Unknown arg `--gw'

Is this a syntax error (and error in the man pages), or just an option not 
available in this version of iptables?

Thanks,

Eric



