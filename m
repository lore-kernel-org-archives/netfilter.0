From: Ramin Alidousti <ramin@cannon.eng.us.uu.net>
Subject: Re: Unable to apply pptp patch
Date: Wed, 3 Jul 2002 08:29:33 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020703122933.GA32116@cannon.eng.us.uu.net>
References: <200FAA488DE0D41194F10010B597610D2BA1F6@JUPITER>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <200FAA488DE0D41194F10010B597610D2BA1F6@JUPITER>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: George Vieira <GeorgeV@citadelcomputer.com.au>
Cc: "'R. Sterenborg'" <rsterenborg@xs4all.nl>, netfilter@lists.samba.org

On Wed, Jul 03, 2002 at 07:18:29PM +1000, George Vieira wrote:

> Yes limitation is to all versions and it's not a netfilter problem.. it's
> the design of PPTP which was microsoft big stuff up from memory. The design
> didn't allow multiple connections from the same source..

And it wasn't supposed to. Not being an M$ lover, but:

pptp is a standard based on Cisco's L2F and Microsoft's L2TP. Its
design is meant as an extention of ppp where the remote end of the
ppp session is not the NAS/RAS (at the edge) but on the LNS (somewhere
within the IP cloud). pptp has some very nice applications, and in a
sense it can be considered as a VPN solution like any other tunneling
solution ipip/gre/... but one has never claimed that it's a secure VPN
solution like IPsec.

So, in short, don't blame something when using the wrong technology
as a wrong solution.

Ramin

> Use a Linux to Linux VPN and you can route the whole network back and
> forth....
> 
> Also PPTP isn't the best VPN but is widely used due to the Micro$oft support
> for it..
> 
> I'd rather use IPSEC if I can only just compile my damn kernel right for
> once.. (it's been a while)..

