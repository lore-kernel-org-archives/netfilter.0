From: =?iso-8859-1?q?Luis=20GUSTAVO?= <lgpcf@yahoo.com.br>
Subject: Re: range of =?unknown-8bit?q?ip=B4s?=
Date: Mon, 14 Jun 2004 18:15:15 -0300 (ART)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040614211515.28299.qmail@web50202.mail.yahoo.com>
References: <200406142205.05626.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200406142205.05626.Antony@Soft-Solutions.co.uk>
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

I read, but i don't found solution for my problem.


I have masquerade my conection, using.

iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

and i want put a ip address valid, in my internal
machine.

only this.




 --- Antony Stone <Antony@Soft-Solutions.co.uk>
escreveu: > On Monday 14 June 2004 9:46 pm, Luis
GUSTAVO wrote:
> 
> > for example:
> >
> > I have a range of ip's 200.255.50.130 -
> 200.255.50.164
> >
> > and i want put 200.255.50.131 in my internal
> server,
> > for my external clients connect on this server
> using
> > this address 200.255.50.131.
> 
> I understand what you want to do.
> 
> Have you read the Nat Howto document which I
> suggested earlier?
> 
> What rules from it have you tried, which are not
> working properly?
> 
> We will help if you have problems with the rules you
> are trying to use, but 
> please read the documentation first (which has been
> provided in several 
> different languages), before just asking someone
> else to build your firewall 
> for you.
> 
> Regards,
> 
> Antony.
> 
> -- 
> A: Because it messes up the order in which people
> normally read text.
> Q: Why is top-posting such a bad thing?
> A: Top-posting.
> Q: What is the most annoying thing on usenet and in
> e-mail?
> 
>                                                     
> Please reply to the list;
>                                                     
>       please don't CC me.
> 
> 
>  

=====

Luis GUSTAVO         lgpcf(arroba)yahoo(ponto)com(ponto)br
+55 (21) 9891-3560    
---------------------------------------------------------------------------------
 










______________________________________________________________________

Yahoo! Messenger - Fale com seus amigos online. Instale agora! 
http://br.download.yahoo.com/messenger/

