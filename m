From: Jason Opperisano <opie@817west.com>
Subject: Re: NAT issues on a VPN tunnel
Date: Tue, 02 Nov 2004 19:24:06 -0500
Message-ID: <1099441441.3181.1.camel@hubcap.ljm.dom>
References: <CARBON45GHEer27k2Ht000021de@carbon.netsvcs.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <CARBON45GHEer27k2Ht000021de@carbon.netsvcs.com>
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

On Tue, 2004-11-02 at 10:40, Chris Lyon wrote:
> So, I am trying to use NAT to solve the problem below because of an IP
> addressing conflict issue but I am not having much luck. Basically all of
> the Site A needs to get to only a few devices at each site B&C so I am
> trying to do PREROUTING NAT on the far end systems. 

try doing it with POSTROUTING on the local system (site a).

-j

--
"I bent my wookie."
	--The Simpsons


