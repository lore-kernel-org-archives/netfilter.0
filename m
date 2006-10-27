From: netdev@sc-software.com
Subject: ethernet mac filter configuration (fwd)
Date: Fri, 27 Oct 2006 04:27:44 -0700 (PDT)
Message-ID: <Pine.LNX.4.63.0610270426570.14561@sc-software.com>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org



What, if any, user space command is available/recommended
for adding/deleting MAC addresses and masks to hardware
based ARC/CAM/MAC address filter memory on chip.

I've done a driver for a new 10/100 MAC/PHY combo (currently
running on ARM) that has on chip memory and logic for
this kind of filtration.

I'm aware of the kernel multicast support and I've tied
my set_multicast_list() function to needed chip interface
but can't find a standard user space command to instantiate
the list with MAC addresses/masks.


Thnx v much,
johnh


.
===========================================================
John Heil
South Coast Software
Custom firmware, device drivers and board bring up services
Ph: 1-714-774-6952
Fx: 1-714-774-7053
www.sc-software.com
email: johnhscs@sc-software.com
===========================================================


