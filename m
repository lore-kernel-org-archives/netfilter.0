From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: ICMP, SYN, ACK flooding
Date: Fri, 5 Dec 2003 22:29:16 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312052229.16622.Antony@Soft-Solutions.co.uk>
References: <3FD1027E.70007@bodybuildingdiscount.com> <200312052221.01576.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200312052221.01576.Antony@Soft-Solutions.co.uk>
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

On Friday 05 December 2003 10:21 pm, Antony Stone wrote:

> On Friday 05 December 2003 10:11 pm, Robert Gil wrote:
> > In this script for iptables i cant seem to get the icmp flood protection
> > to work. Im limiting the icmp to 1/s and a burst of 4... (under ping of
> > death), same goes for syn flood allthough im not quite sure how to test
> > syn/ack/fin/xmas flooding. And how can i go about closing all ports to
> > syn packets except the ones listed so i dont have the responding.
> > Perhaps i have some things in the wrong order. Any help would be great.
>
> What is the machine which this script is running on supposed to do?
>
> You have a strange mixture of mostly INPUT rules, with just a single
> FORWARD rule, so I wonder whether you are trying to use netfilter to
> protect the machine itself, or whether it is a Firewall protecting other
> machines on a network?

Sorry, that was inaccurate - you have more than one FORWARD rule, but it's 
still a strange mixture all the same....

Antony

-- 
In science, one tries to tell people
in such a way as to be understood by everyone
something that no-one ever knew before.

In poetry, it is the exact opposite.

 - Paul Dirac

                                                     Please reply to the list;
                                                           please don't CC me.


