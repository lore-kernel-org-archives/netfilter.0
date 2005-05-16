From: Jason Opperisano <opie@817west.com>
Subject: Re: Natting IPs hanging
Date: Mon, 16 May 2005 17:53:07 -0400
Message-ID: <20050516215307.GA31192@bender.817west.com>
References: <4285084F.1020500@tlcdelivers.com>
	<20050514152613.GA24427@bender.817west.com>
	<4288BF01.50503@tlcdelivers.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <4288BF01.50503@tlcdelivers.com>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Mon, May 16, 2005 at 08:40:49AM -0700, Brian Atkins wrote:
> Jason,
> 
> Sorry for the delay in response.  Catting either of those files doesn't 
> return much.  The ip_tables_names only returns: "filter"; 
> ip_tables_targets is null. 

um--sounds like you don't have support for the mangle or nat tables
compiled into your kernel...eek.

> I did use genkernel to build the new kernel. I did have multiple issues 
> with the kernel config initially, but mostly related to disk drivers. I 
> can forward my .config if that might be helpful. 

i think a:

  grep _NF_ .config

may be of use.  my guess is that neither CONFIG_IP_NF_NAT nor
CONFIG_IP_NF_MANGLE are set.  this is probably a Bad Thing (tm).

-j

--
"Guy in Chicken Suit: Enjoy your chicken sandwich.
 Stewie: Enjoy your studio apartment."
        --Family Guy

