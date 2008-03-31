From: Noino <mg8c1zu02@sneakemail.com>
Subject: local NAT; reconfigured kernel, problems still
Date: Mon, 31 Mar 2008 23:06:08 +0200
Message-ID: <20080331210609.019AF78C7A@gam.mel.teaser.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Dear List, 

I recompiled my Linux 2.6.5 kernel, adding the option required for local NAT 
. 

Am still encountering problems nonetheless. I wonder whether I shouldn't 
compile the iptables program itself from source, too. 

Else why do I get "invalid argument" here ? (same without "-o lo") :
___________________________________________________________________________
# iptables -t nat -A OUTPUT -o lo -p udp --dport 53 -j DNAT --to-destination 
:10053
iptables: Invalid argument
#
____________________________________________________________________________ 

-- 
Noino

