From: =?iso-8859-1?q?Luis=20GUSTAVO?= <lgpcf@yahoo.com.br>
Subject: Re: VPN PPTP
Date: Wed, 16 Jun 2004 17:43:27 -0300 (ART)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040616204327.9622.qmail@web50206.mail.yahoo.com>
References: <200406162139.09672.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200406162139.09672.Antony@Soft-Solutions.co.uk>
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

ok thank you..



--- Antony Stone <Antony@Soft-Solutions.co.uk>
escreveu: > On Wednesday 16 June 2004 9:19 pm, Antony
Stone
> wrote:
> 
> > On Wednesday 16 June 2004 8:57 pm, Luis GUSTAVO
> wrote:
> > > yes.. i use NAT.
> > >
> > > but i download patch-o-matic, and apply
> pptp-nat.
> > >
> > > which rules i use now ?
> >
> > The ones I suggested earlier (with the addition,
> of course, of the
> > appropriate NAT rules, which presumably need to go
> in your PREROUTING chain
> > (if you're doing destination NAT?).
> 
> Just in case your next posting was going to be
> something like "I have those 
> rules, but it doesn't work", here is a suggestion
> for how to find out what's 
> not working.
> 
> Add two LOGging rules to the end of your FORWARD
> chain, one specifying at 
> least one of (a) the source address of the remote
> client, and/or (b) the 
> destination address of the server on your network,
> and the other specifying 
> at least one of (a) the source address of your local
> server, and/or (b) the 
> destination address of the remote client.
> 
> Then the LOG output will show you any packets going
> between the two machines 
> which are not being properly processed by the ACCEPT
> rules I suggested 
> earlier, and you can see what sort of packets they
> are, and add appropriate 
> rules to let them through.
> 
> Regards,
> 
> Antony.
> 
> -- 
> The lottery is a tax for people who can't do maths.
> 
>                                                     
> Please reply to the list;
>                                                     
>       please don't CC me.
> 
> 
>  

=====

SlackWare Simply  the Best

 

Luis GUSTAVO         
+55 (21) 9891-3560    
---------------------------------------------------------------------------------
 











______________________________________________________________________

Yahoo! Messenger - Fale com seus amigos online. Instale agora! 
http://br.download.yahoo.com/messenger/

