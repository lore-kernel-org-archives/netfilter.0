From: Jason Opperisano <opie@817west.com>
Subject: Re: Questions on VPNs
Date: Sun, 13 Mar 2005 20:48:39 -0500
Message-ID: <1110764882.19878.11.camel@hubcap.ljm.dom>
References: <200503131626.43314.jsimmons@goblin.punk.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <200503131626.43314.jsimmons@goblin.punk.net>
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

On Sun, 2005-03-13 at 19:26, Jeff Simmons wrote:
> Using the native IPSEC code in kernel 2.6, when a tunneled ESP packet is 
> passed by the INPUT chain and then decoded on a VPN gateway, is it then 
> processed by any other chain?

yes.  either INPUT or FORWARD depending on the destination of the
decrypted packet.  with 2.6 IPsec, all packets pass twice:  once as ESP,
once in decrypted form.

the accepted way to identify decrypted IPsec packets with the native 2.6
stack is to MARK the ESP packets and match the decrypted packets base on
that mark.

-j

--
"Let us all bask in television's warm glowing warming glow."
	--The Simpsons


