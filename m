From: Payal Rathod <payal-netfilter@scriptkitchen.com>
Subject: Re: AW: a NAT question
Date: Fri, 16 Jul 2004 14:50:22 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040716185022.GA20595@tranquility.scriptkitchen.com>
References: <7C9884991ADAE0479C14F10C858BCDF591E342@alderaan.smgtec.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <7C9884991ADAE0479C14F10C858BCDF591E342@alderaan.smgtec.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel Chemko <dchemko@smgtec.com>
Cc: Netfilter ML <netfilter@lists.netfilter.org>

On Fri, Jul 16, 2004 at 11:43:05AM -0700, Daniel Chemko wrote:

> The setup of a Script-only setup isn't too hard. You have to abandon the
> concept of ip aliases since netfilter dropped support for the concept.
> You only deal with the root interface and ip addresses.

You mean the something like eth0:1 isn't supported? Do I have to
learn the ip thing instead of ifconfig?
For a while I would prefer ifconfig.

With warm regards,
-Payal

