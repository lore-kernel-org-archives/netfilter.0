From: Askar Ali Khan <askarali@gmail.com>
Subject: Re: redirecting
Date: Thu, 1 Jul 2004 21:36:11 +0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <a0f69e50407010836467d308a@mail.gmail.com>
References: <a0f69e50407010452713ae264@mail.gmail.com> <200407011305.17055.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407011305.17055.Antony@Soft-Solutions.co.uk>
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

On Thu, 1 Jul 2004 13:05:17 +0100, Antony Stone
<antony@soft-solutions.co.uk> wrote:
> 
> 
> On Thursday 01 July 2004 12:52 pm, Askar Ali Khan wrote:
> 
> > hi,
> > here im again with my simple question :), actually im learning netfilter
> > thingy. I want if i or someone else type www.microsoft.com on my box
> > (linux, netfilter) which is part of LAN instead of microsoft.com browrse
> > give him www.linuxiso.org
> > im practicing on my box and I will apply rule on this box. My boxes
> > use another system running (win) as router/gateway
> >
> > I do know if i want to block microsoft.com or some other sites this
> > rule is working for me
> > #iptables -A OUTPUT -d www.microsoft.com -j DROP
> > but i duno how to redirect the request with iptables thingy,
> >
> > antony i hope I will hear from you fast :)
> > im learning lot of things from you :D
> 
> I would *really* recommend that you do this sort of thing with Squid instead
> of netfilter, espcially since you have selected www.microsoft.com as the
> address to be redirected.
> 
> Here's why:
> 
> $ dig www.microsoft.com
> 
> ; <<>> DiG 9.2.3 <<>> www.microsoft.com
> ;; global options:  printcmd
> ;; Got answer:
> ;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 40318
> ;; flags: qr rd ra; QUERY: 1, ANSWER: 9, AUTHORITY: 4, ADDITIONAL: 2
> 
> ;; QUESTION SECTION:
> ;www.microsoft.com.             IN      A
> 
> ;; ANSWER SECTION:
> www.microsoft.com.      3600    IN      CNAME   www.microsoft.com.nsatc.net.
> www.microsoft.com.nsatc.net. 300 IN     A       207.46.156.156
> www.microsoft.com.nsatc.net. 300 IN     A       207.46.156.220
> www.microsoft.com.nsatc.net. 300 IN     A       207.46.244.188
> www.microsoft.com.nsatc.net. 300 IN     A       207.46.245.92
> www.microsoft.com.nsatc.net. 300 IN     A       207.46.245.156
> www.microsoft.com.nsatc.net. 300 IN     A       207.46.250.252
> www.microsoft.com.nsatc.net. 300 IN     A       207.46.144.188
> www.microsoft.com.nsatc.net. 300 IN     A       207.46.144.222
> 
> See all those different IP addresses?   Those are what you would need to tell
> netfilter about for it to do the redirection (and there's no guarantee
> they'll be the same ones tomorrow, next week, next month....).
> 
> If you put a redirect rule into Squid, it will use www.microsoft.com instead
> of an IP address, and you will get the result you want.
> 
> Also, Squid will help when you want to change things after the first / in the

Thanks Antony for y0ou fast reply, actaully im practing on my own box
not on company cache server "squid"
Regards
Askar


> URL too - netfilter cannot possibly do that for you.
> 
> Regards,
> 
> Antony.
> 
> --
> The lottery is a tax for people who can't do maths.
> 
>                                                      Please reply to the list;
>                                                            please don't CC me.
> 
>

