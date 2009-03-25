From: "Mihamina Rakotomandimby (R12y)" <mihamina@lab.vectoris.fr>
Subject: not ip address
Date: Wed, 25 Mar 2009 08:55:00 +0300
Message-ID: <49C9C734.3020601@lab.vectoris.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi all
I would like to write this sentence in iptables rule:
  "REJECT everything having port #443 (httpS) as destination except
   if the IP address that query it are one of 192.168.0.18 or 192.168.0.50"

I'd like to forbid httpS/443 traffic except for those two IP addresses.

I made:

$IPT -t nat -A PREROUTING  ! --source 192.168.0.50  \
      -p tcp --dport 443 -j REJECT

and

$IPT -t nat -A PREROUTING  --source ! 192.168.0.50  \
      -p tcp --dport 443 -j REJECT

But they are all bad syntax.

Would you please help me to find my mistake?
I'm running iptables v1.4.0

-- 
                              Chef de projet chez Vectoris
                                  Phone: +261 33 11 207 36
System: xUbuntu 8.10 with almost all from package install
    http://www.google.com/search?q=mihamina+rakotomandimby
