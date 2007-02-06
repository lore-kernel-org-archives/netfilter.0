From: Petr Pisar <xpisar@fi.muni.cz>
Subject: Re: How to filter packets resulting from hosts with dynamic
	IP-address
Date: Tue, 6 Feb 2007 15:31:43 +0000 (UTC)
Message-ID: <slrnesh7qv.82c.xpisar@album.ics.muni.cz>
References: <200702061042.21497.frank.petran@inpho.de>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On 2007-02-06, Frank Petran <frank.petran@inpho.de> wrote:
> I want to allow incoming traffic from hosts that run on changing IP-addresses 
> supplied by the ISP. These hosts have their current IP-address registered 
> with dyndns.org as soon as they connect to the internet.
>
As you can see, relaing on IP address is not secure. You should consider
using some type of authentication (e.g. IPsec).

-- Petr


