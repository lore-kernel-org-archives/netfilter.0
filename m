From: blah blah <filt5447@yahoo.com>
Subject: Re: Trouble with --dport
Date: Mon, 21 Oct 2002 14:07:32 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021021210732.50647.qmail@web10903.mail.yahoo.com>
References: <20021021202758.QVP28874.mta06-svc.ntlworld.com@there>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021021202758.QVP28874.mta06-svc.ntlworld.com@there>
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
To: Antony Stone <Antony@Soft-Solutions.co.uk>, netfilter@lists.netfilter.org

The exact error message is:
iptables-restore v1.2.5: Unknown arg `--dport`

--- Antony Stone <Antony@Soft-Solutions.co.uk> wrote:
> On Monday 21 October 2002 9:12 pm, blah blah wrote:
> 
> > I am having trouble with the following lines:
> >
> > -A INPUT -i eth0 -p tcp -s 1.1.1.1 --dport 1234 -j
> > ACCEPT
> > -A INPUT -i eth0 -p tcp -s 1.1.1.2 --dport 1233 -j
> > ACCEPT
> >
> > I get an error message about --dport being an
> unknown arg.
> 
> What actual error message do you get ?
> 
> If you can type in the commands and then cut & paste
> what you type and what 
> comes back that would be good.
> 
> > If I use either of the 2 lines without the other
> they work fine.
> 
> To me, that says there's no "unknown argument",
> otherwise it would still be 
> unknown when you haven't typed the other command....
> 
> > It always errors on the second line.   I can
> reverse the order and
> > whichever is the second line will be flagged.
> 
> Show us a cut & paste so we can see what you mean.
> 
> Antony.
> 
> -- 
> 
> How I want a drink, alcoholic of course, after the
> heavy chapters
> involving quantum mechanics.
> 
>  - 3.14159265358979
> 


__________________________________________________
Do you Yahoo!?
Y! Web Hosting - Let the expert host your web site
http://webhosting.yahoo.com/

