From: "Barry A Rich" <barich@trisectrix.com>
Subject: RE: UDP stream load balancing across multiple uplinks
Date: Sat, 26 Jul 2008 17:36:36 -0400
Message-ID: <003201c8ef67$aed713e0$0c853ba0$@com>
References: <000501c8edf5$19903230$4cb09690$@com> <a43edf1b0807241837n7e6dceb4id5a16dd56c6344a9@mail.gmail.com> <000001c8ee61$67e4b7a0$37ae26e0$@com> <4889ECB9.3090206@riverviewtech.net>
Reply-To: <barich@trisectrix.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4889ECB9.3090206@riverviewtech.net>
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Grant Taylor' <gtaylor@riverviewtech.net>, 'Mail List - Netfilter' <netfilter@vger.kernel.org>

> -----Original Message-----
> From: netfilter-owner@vger.kernel.org
[mailto:netfilter-owner@vger.kernel.org]
> On Behalf Of Grant Taylor
> Sent: Friday, July 25, 2008 11:10 AM
> 
> Given that the source IP of your packets can change mid stream, you
> could use the "nth" match extension.  Using "nth" you would match
> packets to decide how to mark them and then use the mark to determine
> what routing table to use which would ultimately decide which outbound
> path to use.

The nth match looks promising. Given that I want to avoid connection
tracking, I tried the following commands:

iptables -t raw -A PREROUTING -i eth0 -p udp --sport $SPORT -m statistic
--mode nth --every 3 --packet 0 -j SNAT --to-source $UPLINK1IP
iptables -t raw -A PREROUTING -i eth0 -p udp --sport $SPORT -m statistic
--mode nth --every 3 --packet 1 -j SNAT --to-source $UPLINK2IP
iptables -t raw -A PREROUTING -i eth0 -p udp --sport $SPORT -m statistic
--mode nth --every 3 --packet 2 -j SNAT --to-source $UPLINK3IP

Each of these produce the following error:

	iptables: Invalid argument

Any suggestions on what is wrong? Is this the correct way to bypass
connection tracking?

Thanks.


