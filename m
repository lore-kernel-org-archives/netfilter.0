From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: problems with alias
Date: Fri, 16 Jul 2004 11:45:57 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407161145.57152.Antony@Soft-Solutions.co.uk>
References: <12a1fd421dcf7411b2acdd8a5da18f59@147.162.2.222>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <12a1fd421dcf7411b2acdd8a5da18f59@147.162.2.222>
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

On Friday 16 July 2004 11:00 am, Batstru wrote:

> Hi all!
> I changed my server running redhat9 (kernel 2.4.x) with a new one with
> fedora core 2 (kernel 2.6.x): each one has  2 ethernet interfaces, so I
> copy network configuration fron rh9 to fc2
>
> eth0 --> 192.168.1.254 / 255.255.255.0
> eth1 --> 82.186.92.90 / 255.255.255.254
> eth1:1 --> 82.186.92.91 / 255.255.255.254
> eth1:2 --> 82.186.92.92 / 255.255.255.254
> eth1:3 --> 82.186.92.93 / 255.255.255.254
> eth1:4 --> 82.186.92.93 / 255.255.255.254

These combinations of address/netmask make no sense to me.

The netmask 255.255.255.254 defines a 2-host subnet (basically, a 
point-to-point link, although those are normally specified using a full 
32-bit all-1's netmask).   Therefore if you have 82.186.92.90 on an interface 
with a 255.255.255.254 netmask, the only machine it will be capable of 
talking to at the other end of the cable is 82.186.92.91.

Putting that address (.91), as well as several others which fall in different 
address ranges, onto the same phyical interface makes no sense to me.

Regards,

Antony.

-- 
Anyone that's normal doesn't really achieve much.

 - Mark Blair, Australian rocket engineer

                                                     Please reply to the list;
                                                           please don't CC me.


