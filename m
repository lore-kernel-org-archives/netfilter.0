From: Bosse Klykken <bosse+netfilter@klykken.com>
Subject: Re: no nat please
Date: Thu, 4 Nov 2004 19:53:47 +0100
Message-ID: <20041104185347.GJ24014@klykken.com>
References: <20041104170731.GA10260@tranquility.scriptkitchen.com>
	<1099591013.14542.19.camel@moola.futuresource.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1099591013.14542.19.camel@moola.futuresource.com>
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

On Thu, Nov 04, 2004 at 11:56:54AM -0600, Les Mikesell wrote:
> However there is a new standard
> for NAT traversal for IPsec and a recent Windows update adds
> it for win2k and XP.   I don't know if it needs additional support
> at the NAT gateway or if you need matching versions at both
> ends, though.

Yes, IPSEC borks when one of the endpoints goes through NAT. I agree
with Les, you seem to need NAT-T, and both the server and client need
to support this, so check your VPN documentation.

I don't think that there's any need in configuring anything specific
on the NAT gateway, as long as the firewall allows UDP port 4500
(NAT-T) to flow.

.../Bosse
-- 
Bosse Klykken - http://www.klykken.com/~bosse
Keep staring. I might do a trick.

