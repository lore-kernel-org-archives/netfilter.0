From: Les Mikesell <les@futuresource.com>
Subject: Re: no nat please
Date: Thu, 04 Nov 2004 11:56:54 -0600
Message-ID: <1099591013.14542.19.camel@moola.futuresource.com>
References: <20041104170731.GA10260@tranquility.scriptkitchen.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20041104170731.GA10260@tranquility.scriptkitchen.com>
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
To: Payal Rathod <payal-netfilter@scriptkitchen.com>
Cc: Netfilter ML <netfilter@lists.netfilter.org>

On Thu, 2004-11-04 at 11:07, Payal Rathod wrote:

> I use simple masquerading to allow my windows clients to browse the
> net. But for one particular machine I need to connect it to VPN of
> my client abroad. Now, the tech people at their end told me not
> to nat that machine as nating would destroy the VPN part. How do I do that?
> The machine IP address is 192.168.10.15.

If they are using IPsec for the VPN you generally can't use it
behind NAT and you have to set it up to work from the device
that has the public address.   However there is a new standard
for NAT traversal for IPsec and a recent Windows update adds
it for win2k and XP.   I don't know if it needs additional support
at the NAT gateway or if you need matching versions at both
ends, though.

---
  Les Mikesell
   les@futuresource.com



