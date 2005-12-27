From: "Michael D. Berger" <m.d.berger@ieee.org>
Subject: RE: DROP TCP output to HTTP attackers?
Date: Tue, 27 Dec 2005 10:14:39 -0500
Message-ID: <000301c60af8$431f4dd0$2801a8c0@MBRC40>
References: <FAC4E024BF776842876169173CE2F01313B76B@mailbox.vikus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <FAC4E024BF776842876169173CE2F01313B76B@mailbox.vikus.com>
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
To: 'netfilter' <netfilter@lists.netfilter.org>

[...]
> > -----Original Message-----
> > From: netfilter-bounces@lists.netfilter.org 
> > [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of 
> > Michael D. Berger
> > Sent: Friday, December 23, 2005 3:50 PM
> > To: netfilter
> > Subject: DROP TCP output to HTTP attackers?
> > 
> > Using -j QUEUE, I DROP http packets that I don't like, and I 
> > DROP all subsequent packets from the offending ipAddress.  
> > Using ethereal, I note that when I DROP, I send tcp FIN 
> > packets.  Therefore, I added -j QUEUE to the OUTPUT filter, 
> > and I block all OUTPUT to the offending ipAddress, including 
> > the tcp FIN packets, as confirmed with ethereal.  I just 
> > deployed this in the last 30 minutes.  My preliminary 
> > observation, thanks to an obliging attacker, is that I get 
> > less follow-up junk with the OUTPUT filter blocked, although 
> > there did appear to be a few anomalies, that I assume are to 
> > to timing issues.
> > 
[...]
> 
> My only comment would be that for proxy users (AOL, for instance) you
> may end up dropping legitimate traffic. The risk/reward of that is
> something you'll have to determine for yourself.
> 
> Derick Anderson
> 

I must admit that I have little knowledge of these proxies.  I infer from
what you say that different users might present the same peer ip address.
Is this true?  If so, perhaps I should set a time limit on the block.

With regard to blocking output in response to attacks, thereby blocking
TCP FIN, are there any opinoins on this?

Thanks for your help.
Mike.

--
Michael D. Berger
m.d.berger@ieee.org 
 



