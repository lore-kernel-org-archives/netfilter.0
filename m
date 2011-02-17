From: Steven Kath <steven.kath@vyatta.com>
Subject: Re: How to use DNAT
Date: Thu, 17 Feb 2011 14:57:25 -0800 (PST)
Message-ID: <1507403965.4030.1297983445466.JavaMail.root@tahiti.vyatta.com>
References: <184364666.3998.1297982398411.JavaMail.root@tahiti.vyatta.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <184364666.3998.1297982398411.JavaMail.root@tahiti.vyatta.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Italo Valcy <italo@dcc.ufba.br>
Cc: netfilter@vger.kernel.org, Pascal Hambourg <pascal.mail@plouf.fr.eu.org>

----- "Italo Valcy" <italo@dcc.ufba.br> wrote: -----
> > Please provide some details about the rule, packets...
> > Note that iptables' NAT ignores packets in the INVALID state.
> 
> Well... so could be this: INVALID state... The packets are about a
> netflow traffic (9996/UDP) comming to the firewall, which should be
> redirected to a internal host (through the DNAT). How can I debug
> these possible INVALID packets?

iptables -I FORWARD -p udp -m udp --dport 9996 -m state --state INVALID -j LOG --log-prefix "INVALID-FWD: " 
iptables -I INPUT -p udp -m udp --dport 9996 -m state --state INVALID -j LOG --log-prefix "INVALID-IN: " 

This will allow you to see matching traffic through the filter 
table's FORWARD and INPUT chains with the invalid state in dmesg. 

Also, bear in mind that the nat table is only consulted for 
packets with state NEW. If your UDP flow state transitions to 
ESTABLISHED before your NAT rule is created, the new rule will 
not be applied to that flow.  

You'd need to clear that connection from the table with 
conntrack-tools, flush the entire table, or let the connection 
expire from the table for it to be considered NEW again and 
compared against the nat rules. 

