From: "Alexis" <alexis@tpys.com.ar>
Subject: Re: Rules for Blocking Proxies...
Date: Tue, 20 Apr 2004 11:23:48 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <00b901c426e3$a189f0a0$0c00a8c0@pepelui>
References: <000b01c426f6$cc216f10$36b4fea9@SABNANIS> <006f01c426dc$572c2cf0$0c00a8c0@pepelui> <200404201453.14678.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: Netfilter <netfilter@lists.netfilter.org>

beside this.
You could remove privileges from the clients, even with an active directory
implementation (ajjjj) or i think i saw cybercafe software that block any
settings change on the client box.



----- Original Message ----- 
From: "Antony Stone" <Antony@Soft-Solutions.co.uk>
To: "Netfilter" <netfilter@lists.netfilter.org>
Sent: Tuesday, April 20, 2004 10:53 AM
Subject: Re: Rules for Blocking Proxies...


> On Tuesday 20 April 2004 2:35 pm, Alexis wrote:
>
> > set up your own proxy server and only permit connections to this box :)
>
> I must admit I had assumed, when answering this previously, that Harry was
> already running his own proxy, but wanted to stop clients reconfiguring
their
> browsers to go direct instead.
>
> If the proxy server is instead on the outside of the network, then the
answer
> to the question "how do I stop people changing the browser settings to
bypass
> the proxy?" is to allow connections on TCP port 80 to the proxy server
only,
> and block all other destination addresses for that port.
>
> Remember of course that you can always do a DNAT rule to send people to
the
> proxy address anyway, even if they did decide to go direct - then instead
of
> getting a "connection timeout" message they find themselves using the
proxy
> even after reconfiguring their browser settings :)
>
> iptables -A PREROUTING -t nat -p tcp --dport 80 -j DNAT --to IP.of.pro.xy
>
> Regards,
>
> Antony.
>
> >   Hi All,
> >   I am running Fedora and Redhat 9 on two servers at my Cybercafe,
> > connected on two Hi speed Lines, I have a decent firewall script, but
these
> > days I am facing issues about people changing the Proxy settings in
order
> > to get thru porn sites, can anybody suggest some rules which I can
> > implement in the script that avoids connection to these servers?
> > Suggestions are welcome.
> >
> >   Regards
> >
> >   Harry
>
> -- 
> The difference between theory and practice is that in theory there is no
> difference, whereas in practice there is.
>
>                                                      Please reply to the
list;
>                                                            please don't CC
me.
>
>
>


