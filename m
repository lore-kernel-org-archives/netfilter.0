From: Jason Opperisano <opie@817west.com>
Subject: Re: Question regarding the interaction of iptables and IPsec
Date: Fri, 18 Mar 2005 15:03:26 -0500
Message-ID: <1111176206.4598.30.camel@hubcap.ljm.dom>
References: <200503162127.BCY40584@mira-sjc5-b.cisco.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <200503162127.BCY40584@mira-sjc5-b.cisco.com>
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

On Wed, 2005-03-16 at 16:27, Mark Hendrickson wrote:
> All,
>  
> This is my first time posting to this list, so if the question has already
> been answered. Please point me to the information.
>  
> Question:  After an ESP packet has been unencrypted and restored to its
> original form by IPsec, racoon for our installation, is the restored packet
> ran back through iptable again for filtering??

if you're asking about 2.6 built-in IPSec, yes.

funny enough--someone else did just ask the same question:

  http://marc.theaimsgroup.com/?l=netfilter&m=111076493609536&w=2

-j

--
"Be careful when we capture him! We cannot claim the reward unless
 we have 51% of the carcass"
	--The Simpsons


