From: Cloves Pereira Costa Jr <cloves.costa@m2sys.com.br>
Subject: Alias reference in iptables
Date: Fri, 01 Feb 2008 11:21:54 -0200
Message-ID: <1201872114.25131.14.camel@wtprcwbti01002>
Reply-To: cloves.costa@m2sys.com.br
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Netfilter ML <netfilter@vger.kernel.org>

Hi all...

I have a doubt...

I'm configuring a linux router and i will create some alias in the LAN
interface (eth1) for a network 10.1.1.0/27. For example:
eth1 --> 10.1.1.33
eth1:0 --> 10.1.1.65
eth1:1 --> 10.1.1.97
...

My question is: I can use in iptables rules the reference to the alias
interfaces (eth1:0, eth1:1, ...) or I can only refer to the main
interface (eth1)?

Example: iptables -A FORWARD -i eth1:0 -s 10.1.1.68 -o eth2 -d 10.1.2.5
-p tcp --dport 80 -j ACCEPT


[]s

-- 
Cloves Jr


