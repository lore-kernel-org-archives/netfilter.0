From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: dhcrelay still responds dropped inbound offer packets from
 iptables
Date: Mon, 11 Jul 2005 13:14:40 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0507111312060.20556@yvahk01.tjqt.qr>
References: <673fb82305070814186036ce2f@mail.gmail.com>
	<20050711073247.GD15121@sunbeam.de.gnumonks.org>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050711073247.GD15121@sunbeam.de.gnumonks.org>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Harald Welte <laforge@netfilter.org>
Cc: netfilter@lists.netfilter.org


>My guess is that dhrelay uses PACKET sockets.

About everything with DHCP from ISC uses AF_PACKET, as far as I can see.

And I guess it's not only ISC. Simply because DHCP needs to play with 
"normally unroutable" addresses like 0.0.0.0 and 255.255.255.255. In the 
earlier days, one could poke on the kernel's routing tables, today this is not 
as easy anymore and we're all better off using PACKET sockets.

Er, this does not help the problem. Dang. Surprisingly however is, that 
despite PACKET bypasses the firewall, that I was able to drop incoming dhcp 
packets and dhcpd got nothin...


Jan Engelhardt                                                               
--                                                                            


