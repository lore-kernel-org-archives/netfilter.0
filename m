From: "dave beach" <drbeach@rogers.com>
Subject: RE: Iptables, nat, and IPSec
Date: Wed, 6 Apr 2005 18:42:38 -0400
Message-ID: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAAqrTb2LYes02Oflamihm4wwL6DwAQAAAAVBLYbI2cfke9S/ouKmqdpwEAAAAA@rogers.com>
References: <42541650.1080206@lopsch.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42541650.1080206@lopsch.com>
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
To: 'Daniel Lopes' <lopsch@lopsch.com>, netfilter@lists.netfilter.org

 

> So you have to activate on your clients the NAT-T "feature" and be sure
the other side supports it too.

Okay, so if I understand correctly it's a matter of configuring both sides
of the IPSec connection in accordance with their NAT-Traversal settings, and
any intermediate NATting device is blissfully oblivious.

So, clearly, my next step is to figure out if Nortel's Contivity server and
client software support NAT-Traversal, and I can stop looking at my iptables
box and router.


