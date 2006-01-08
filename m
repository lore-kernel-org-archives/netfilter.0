From: "Michael D. Berger" <m.d.berger@ieee.org>
Subject: FW: block + kill connections
Date: Sun, 8 Jan 2006 18:01:20 -0500
Message-ID: <000101c614a7$70964cb0$2801a8c0@MBRC40>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@lists.netfilter.org>

Now thw wrong list.  Damm!
Mike
--
Michael D. Berger
m.d.berger@ieee.org 

> -----Original Message-----
> From: Michael D. Berger [mailto:m.d.berger@ieee.org] 
> Sent: Sunday, January 08, 2006 5:59 PM
> To: Redhat-List
> Subject: FW: block + kill connections
> 
> 
> My apology.  Inadvertantly send to the individual rather than 
> the list.
> Some list managers think that this is good.  I do not.
> Mike.
> --
> Michael D. Berger
> m.d.berger@ieee.org 
> 
> > -----Original Message-----
> > From: Michael D. Berger [mailto:m.d.berger@ieee.org] 
> > Sent: Sunday, January 08, 2006 5:47 PM
> > To: '/dev/rob0'
> > Subject: RE: block + kill connections
> > 
> > 
> > [...]
> > > On Sunday 2006-January-08 16:04, Robert Nichols wrote:
> > > > > iptables -I INPUT -s 1.2.3.4 -j DROP
> > > 
> > > > That will prevent communication by blocking any further incoming
> > > > packets, but won't do anything to tear down the connection.  See
> > > 
> > > Actually it would drop anything with a source address of 
> > > 1.2.3.4 which 
> > > happens to hit the filter INPUT chain, regardless of protocol 
> > > or state. 
> > > Perhaps the issue is as I suggested, the packets are 
> > hitting FORWARD, 
> > > or simply that a blocked connection has not yet timed out of 
> > > conntrack 
> > > or netstat listings.
> > > -- 
> > >     mail to this address is discarded unless "/dev/rob0"
> > >     or "not-spam" is in Subject: header
> > > 
> > > 
> > 
> > I have the same problem.  I DROP in the INPUT chain, but the 
> > connection
> > stays up and receives more junk.
> > 
> > There is no confusion with the FORWARD chain.  I have 
> > :FORWARD DROP [0:0],
> > and that is it.  I do not forward anything.
> > 
> > I like the suggestion in a previous post:
> > 
> >    iptables -I INPUT -s 1.2.3.4 -p tcp --tcp-flags ! FIN,RST 
> > NONE -j REJECT 
> >    --reject-with tcp-reset
> > 
> > however, I DROP from a libipq daemon, and REJECT  does not 
> > appear to be an
> > option. I could accomplish it if I could set the MARK from 
> > the daemon, but
> > this is not possible in the version I have, although it is 
> > possible in later
> > versions.
> > 
> > I await admonition by those more knowledgeable than I.
> > 
> > Mike.
> > --
> > Michael D. Berger
> > m.d.berger@ieee.org 
> > 
> > 
> 



