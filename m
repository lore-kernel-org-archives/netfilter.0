From: Payal Rathod <payal-netfilter@scriptkitchen.com>
Subject: Re: firewall problem continued
Date: Mon, 9 Aug 2004 07:19:59 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040809111959.GA16482@tranquility.scriptkitchen.com>
References: <20040809081216.GA12643@tranquility.scriptkitchen.com> <200408090932.13099.Antony@Soft-Solutions.co.uk> <20040809103942.GA15462@tranquility.scriptkitchen.com> <200408091155.10375.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200408091155.10375.Antony@Soft-Solutions.co.uk>
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
To: Netfilter ML <netfilter@lists.netfilter.org>

On Mon, Aug 09, 2004 at 11:55:10AM +0100, Antony Stone wrote:
> > -A POSTROUTING -s 192.168.0.0/255.255.0.0 -o eth2 -j MASQUERADE
> > -A POSTROUTING -s 10.0.0.0/255.0.0.0 -o eth2 -j MASQUERADE
> 
> Yes (so long as eth2 is your external interace :)

Yes.

> DNAT in PREROUTING only works for packets being routed through the machine.   
> Squid is a local process sending packets out through OUTPUT, therefore you 
> need to DNAT in the OUTPUT nat table to let Squid connect to this address.

Ok. I never knew that. Can you please give an small example on how to
DNAT my scene in OUTPUT nat table ?

Eagerly watiing for inputs on this.
With warm regards,
-Payal

