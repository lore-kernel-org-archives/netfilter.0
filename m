From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: Nat with a dynamic IP
Date: Fri, 5 Sep 2003 15:13:51 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030905191351.GB2100@cannon.eng.us.uu.net>
References: <7C9884991ADAE0479C14F10C858BCDF52E367E@alderaan.smgtec.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <7C9884991ADAE0479C14F10C858BCDF52E367E@alderaan.smgtec.com>
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
Cc: Peter Marshall <peter.marshall@caris.com>, Thorsten Scherf <tscherf@web.de>, netfilter@lists.netfilter.org

Here is an idea, It might cost you some vlanning efforts on both the
dhcp client and the dhcp server:

vconfig add eth2 10
vconfig add eth2 11
vconfig add eth2 12
vconfig add eth2 13

dhcpcd eth2.10
dhcpcd eth2.11
dhcpcd eth2.12
dhcpcd eth2.13

You can keep the NIC's :-)

Ramin


On Fri, Sep 05, 2003 at 10:16:41AM -0700, Daniel Chemko wrote:

> Damn, guys, if you could set me up with a fantastic script that can do
> multiple DHCP subscriptions on a single NIC, I could throw away my all
> 4-port NIC's. I'll hear offers for the cards 'after' I get this script
> :-)
> 
> 
> 
> -----Original Message-----
> From: Ramin Dousti [mailto:ramin@cannon.eng.us.uu.net] 
> Sent: Friday, September 05, 2003 10:11 AM
> To: Peter Marshall
> Cc: Thorsten Scherf; netfilter@lists.netfilter.org
> Subject: Re: Nat with a dynamic IP
> 
> On Fri, Sep 05, 2003 at 11:36:09AM -0300, Peter Marshall wrote:
> 
> > That is a pretty good solution for the SNAT.  I never thought about
> MASQ.
> > However .... I am not sure if the DNAT is the best solution ....  WHat
> if
> > you had multiple ip numbers on the external card ....
> 
> and they're all dynamic? Give us an example...
> 
> Ramin
> 
> > More importantly, what about trying to connect directly to the
> firewall from
> > an external address.
> 

