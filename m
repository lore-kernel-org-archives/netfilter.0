From: Jason Opperisano <opie@817west.com>
Subject: Re: remap local addresses
Date: Thu, 17 Feb 2005 11:07:39 -0500
Message-ID: <1108656459.4629.50.camel@hubcap.ljm.dom>
References: <4213B3F5.1010508@unp.edu.ar>
	<1108588628.3944.13.camel@anduril.intranet.cartel-securite.net>
	<4214B68A.7000301@unp.edu.ar>  <098001c51507$b43b0b90$6e69690a@RIMAS>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <098001c51507$b43b0b90$6e69690a@RIMAS>
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

On Thu, 2005-02-17 at 10:45, Remus wrote:
> Hi,
> 
> Does anybody know how to remap local addresses, if I want to connect two 
> networks via VNP with the same IP space in the private address range?

use the NETMAP target from POM.

-j

--
"Mmmm...free goo."
	--The Simpsons


