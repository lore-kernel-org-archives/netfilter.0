From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: ICMP, SYN, ACK flooding
Date: Fri, 5 Dec 2003 22:21:01 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312052221.01576.Antony@Soft-Solutions.co.uk>
References: <3FD1027E.70007@bodybuildingdiscount.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3FD1027E.70007@bodybuildingdiscount.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Friday 05 December 2003 10:11 pm, Robert Gil wrote:

> In this script for iptables i cant seem to get the icmp flood protection
> to work. Im limiting the icmp to 1/s and a burst of 4... (under ping of
> death), same goes for syn flood allthough im not quite sure how to test
> syn/ack/fin/xmas flooding. And how can i go about closing all ports to
> syn packets except the ones listed so i dont have the responding.
> Perhaps i have some things in the wrong order. Any help would be great.

What is the machine which this script is running on supposed to do?

You have a strange mixture of mostly INPUT rules, with just a single FORWARD 
rule, so I wonder whether you are trying to use netfilter to protect the 
machine itself, or whether it is a Firewall protecting other machines on a 
network?

Antony.

-- 
Perfection in design is achieved not when there is nothing left to add, but 
rather when there is nothing left to take away.

 - Antoine de Saint-Exupery

                                                     Please reply to the list;
                                                           please don't CC me.


