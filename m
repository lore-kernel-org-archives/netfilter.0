From: "Deepak Seshadri" <dseshadri@broadbandmaritime.com>
Subject: DMZ Question
Date: Mon, 4 Oct 2004 13:41:10 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <200410041736.i94Haduj073687@jkcpub.iserver.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org
Cc: 'Imran Bashir' <ibashir@broadbandmaritime.com>, 'Veena Rao' <vrao@broadbandmaritime.com>, 'Syed Amjad Ali' <sali@broadbandmaritime.com>, 'Zia Ullah' <szia@broadbandmaritime.com>

Hello everybody,

 

 

                             --------------------------

                             |                               |     WAN
(x.x.x.58/28, default gateway - x.x.x.49)

                             |       FC2           e0
|-------------------------- ISP

             LAN         |                               |

-----------------------|  e1                         |     DMZ

    10.0.1.x            |                        e2
|--------------------------

                             |                               |

                             |-------------------------|

I have 3 computers that need to have public addresses and their IP addresses
are:

A - x.x.x.50/28, DG - x.x.x.49

B - x.x.x.51/28, DG - x.x.x.49

C - x.x.x.55/28, DG - x.x.x.49

Now the problem is I do not understand how I will give access to these PCs
from public without putting these PCs on a different subnet. Some firewalls
such as sonicwall do not require an IP for the DMZ port. You can add any
number of IPs behind the DMZ and it works. How is that done? Is it possible
with Linux?

If I connect them on the DMZ interface, should they all be put in a
different subnet, probably with /29 bit mask? If I do it this way, should I
use iptables & DNAT or should/can I use just the "routing" in linux?

If you have a better way to do it, please let me know. Any help will be
greatly appreciated.

Thank you,

Deepak Seshadri

 

