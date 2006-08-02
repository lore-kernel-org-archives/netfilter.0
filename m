From: Tolga Onbay <tolgaonbay@yahoo.com>
Subject: How to configure iptables for a group of IPs
Date: Wed, 2 Aug 2006 04:00:31 -0700 (PDT)
Message-ID: <20060802110031.49705.qmail@web56603.mail.re3.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi,

I read the documents in netfilter.org. But I think i
missed something. My problem is,

In my network there is 2 group of people. These are
administrators, and limited users. All IPs in the
network are in the same block(192.168.1.0/24). I want
to block p2p and messenger programs to limited users.
But administrators should use the programs whenever
they want. For example the limited users' IP addresses
are
192.168.1.10
192.168.1.15
192.168.1.17
and administrators' IP adresses are
192.168.1.12
192.168.1.20
192.168.1.22
I want to block the p2p and messenger programs to .10,
.15 and .17 IPs. If there are 10 rules to block these
programs for one IP, there must be 30 rules to block
all these IPs. But there are so many IPs like 60 for
limited users and 30 for administrators. Also in the
future some groups can be added.

If there is something like defining a range of IP
addresses in iptables like 192.168.1.10-192.168.1.20,
I can configure the IP addresses of workers to match
this feature.

Thanks for your help

__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 

