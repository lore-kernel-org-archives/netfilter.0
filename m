From: =?iso-8859-1?q?durga=20prasad?= <linuxindguy@yahoo.com>
Subject: help
Date: Fri, 25 Jul 2003 15:33:06 +0100 (BST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030725143306.11900.qmail@web13902.mail.yahoo.com>
References: <20030725061502.30342.8650.Mailman@kashyyyk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030725061502.30342.8650.Mailman@kashyyyk>
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
To: netfilter@lists.netfilter.org

 --- netfilter-request@lists.netfilter.org wrote: >
Send netfilter mailing list submissions to
> 	netfilter@lists.netfilter.org
> 
> To subscribe or unsubscribe via the World Wide Web,
> visit
> 
>
https://lists.netfilter.org/mailman/listinfo/netfilter
> or, via email, send a message with subject or body
> 'help' to
> 	netfilter-request@lists.netfilter.org
> 
> You can reach the person managing the list at
> 	netfilter-admin@lists.netfilter.org
> 
> When replying, please edit your Subject line so it
> is more specific
> than "Re: Contents of netfilter digest..."
> 
> 
> Today's Topics:
> 
>    1. MARK - set with mask or read, add, set???
> (Bill Chappell)
>    2. VLANs and DNAT (Damien Mason)
>    3. ssl forward / proxy question (jen@saturn5.com)
>    4. Re: Not quite understanding DNAT (Philip
> Craig)
>    5. RE: ssl forward / proxy question (George
> Vieira)
>    6. (no subject) (Bryan Schmidt)
>    7. Re: -m limit --limt 1/s from "Bryan Schmidt"
> <absolut_bryan@hotmail.com> (Bill Chappell)
>    8. Re: DNAT question.. (Rio Martin.)
>    9. Re: Installing IPtables-1.2.8 (Jerry M. Howell
> II)
>   10. Re: Keeping Log (Jerry M. Howell II)
>   11. source quench packets (cc)
>   12. VLANS + intervlan forwarding + SNAT (Damien
> Mason)
>   13. RE: port-based filtering of IPsec packets?
> (Rick Kennell)
> 
> --__--__--
> 
> Message: 1
> Date: Thu, 24 Jul 2003 18:52:37 -0400
> From: Bill Chappell <chappell@borg.com>
> To: netfilter@lists.netfilter.org
> Subject: MARK - set with mask or read, add, set???
> 
> 
> --------------CC055BE056B322A30C53E8B1
> Content-Type: text/plain; charset=us-ascii
> Content-Transfer-Encoding: 7bit
> 
> > Condensed version - I need to share the nfmark
> with
> > another developer on the same packet, where I use
> the
> > high-order 8 bits and she can have the low-order
> 24 bits.
> > Problem is that -j MARK --set-mark writes one
> unsigned
> > integer so I would wipe out her nfmark and vice
> versa.
> >
> > I have successfully used a mask in a mark match:
> > iptables -t nat -A mychain -m mark --mark
> $mymark/0xFF000000
> > and had the packets flow as desired.
> >
> > It was not documented that a mask would work with
> > -j MARK --set-mark <number>/<mask>, but I tried
> > anyway.
> > I used <number> = 0xFF000000 (which does work by
> itself)
> > with <mask> = 0xFF000000 and <number> = 0xFFFFFFFF
> > with <mask> = 0xFF000000 and got the error
> message:
> > "Bad MARK value `<number>/<mask>'
> >
> > I could read the existing nfmark, add the second
> one, and set
> > the summed nfmark, but I do not see any way to
> read an nfmark
> > in iptables.
> >
> > I do see a solution using the mark match to
> identify the current
> > nfmark/mask (one rule for each possible nfmark)
> with the new nfmark
> > equal to the sum of the matching nfmark/mask and
> the nfmark
> > of the second use, but that gets clunky very
> quickly as the number
> > of possible nfmarks increases and it forces each
> use to know
> > which nfmarks the other is using (== reduced
> modularity).
> >
> > Any help would be greatly appreciated and
> attributed in the project.
> >
> > Thank you.
> >
> > Bill Chappell
> >
> >
> >
> >
> > --
> > William Chappell,     Software Engineer,    
> Critical Technologies, Inc.
> > Suite 400 Technology Center, 4th Floor 1001 Broad
> Street, Utica, NY 13501
> > 315-793-0248  x148  < bill.chappell@critical.com >
>  www.critical.com
> >
> 
> --------------CC055BE056B322A30C53E8B1
> Content-Type: text/html; charset=us-ascii
> Content-Transfer-Encoding: 7bit
> 
> <!doctype html public "-//w3c//dtd html 4.0
> transitional//en">
> <html>
> 
> <blockquote TYPE=CITE>Condensed version - I need to
> share the nfmark with
> <br>another developer on the same packet, where I
> use the
> <br>high-order 8 bits and she can have the low-order
> 24 bits.
> <br>Problem is that -j MARK --set-mark writes one
> unsigned
> <br>integer so I would wipe out her nfmark and vice
> versa.
> <p>I have successfully used a mask in a mark match:
> <br>iptables -t nat -A mychain -m mark --mark
> $mymark/0xFF000000
> <br>and had the packets flow as desired.
> <p>It was not documented that a mask would work with
> <br>-j MARK --set-mark &lt;number>/&lt;mask>, but I
> tried
> <br>anyway.
> <br>I used &lt;number> = 0xFF000000 (which does work
> by itself)
> <br>with &lt;mask> = 0xFF000000 and &lt;number> =
> 0xFFFFFFFF
> <br>with &lt;mask> = 0xFF000000 and got the error
> message:
> <br>"Bad MARK value `&lt;number>/&lt;mask>'
> <p>I could read the existing nfmark, add the second
> one, and set
> <br>the summed nfmark, but I do not see any way to
> read an nfmark
> <br>in iptables.
> <p>I do see a solution using the mark match to
> identify the current
> <br>nfmark/mask (one rule for each possible nfmark)
> with the new nfmark
> <br>equal to the sum of the matching nfmark/mask and
> the nfmark
> <br>of the second use, but that gets clunky very
> quickly as the number
> <br>of possible nfmarks increases and it forces each
> use to know
> <br>which nfmarks the other is using (== reduced
> modularity).
> <p>Any help would be greatly appreciated and
> attributed in the project.
> <p>Thank you.
> <p>Bill Chappell
> <br>&nbsp;
> <br>&nbsp;
> <br>&nbsp;
> <pre>--&nbsp;
> William Chappell,&nbsp;&nbsp;&nbsp;&nbsp; Software
> Engineer,&nbsp;&nbsp;&nbsp;&nbsp; Critical
> Technologies, Inc.
> Suite 400 Technology Center, 4th Floor 1001 Broad
> Street, Utica, NY 13501
> 315-793-0248&nbsp; x148&nbsp; &lt;
> bill.chappell@critical.com >&nbsp;
> www.critical.com</pre>
> </blockquote>
> </html>
> 
> --------------CC055BE056B322A30C53E8B1--
> 
> 
> 
> --__--__--
> 
> Message: 2
> Date: Fri, 25 Jul 2003 09:40:02 +1000
> From: Damien Mason <kinetic@suse.net.au>
> To: netfilter@lists.netfilter.org
> Subject: VLANs and DNAT
> 
> Hi Everyone,
> 
=== message truncated === 

=====
DURGAPRASAD
--
http://www.linuxindguy.com
UNDERSTANDING  ARISES THROUGH MAKING !!!!!!!

________________________________________________________________________
Want to chat instantly with your online friends?  Get the FREE Yahoo!
Messenger http://uk.messenger.yahoo.com/

