From: Henry Ritzlmayr <h.ritzlmayr@gmx.at>
Subject: Re: Masquerading on local ports
Date: 21 Mar 2003 18:17:43 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1048267063.1493.162.camel@localhost.localdomain>
References: <1048169013.1491.107.camel@localhost.localdomain>
	 <200303210222.47189.netfilter@newkirk.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200303210222.47189.netfilter@newkirk.us>
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
To: netfilter@newkirk.us, Netfilter Mailing List <netfilter@lists.netfilter.org>

Am Fre, 2003-03-21 um 08.22 schrieb Joel Newkirk:
> On Thursday 20 March 2003 09:03 am, Henry Ritzlmayr wrote:
> > Hi everyone - this is my first post to this list - so if anything is
> > wrong with my way of posting please tell.
> >
> > And here is the question. How is it possible to nat a lokal port?
> >
> > IPTABLES -t nat -A PREROUTING -p tcp -d 127.0.0.1 --destination-port
> > 81 -j DNAT --to-destination 127.0.0.1:80
> >
> > telnet localhost 80  <<< works
> > telnet localhost 81  <<< Connection refused
> >
> > Henry
> 
> Packets originating on the local box never go through the PREROUTING 
> chains.  This is why there is an OUTPUT chain in the nat table.  (and 
> the mangle table)
> 
> iptables -t nat -A OUTPUT -o lo -p tcp --dport 81 -j DNAT --to 
> 127.0.0.1:80
> 
> should do it.  I'm not sure if the REDIRECT target would work properly 
> for this use (localhost->localhost), but you can try easily enough.
> 
> j

That was it. I overlooked that local packets do not go trough the
PREROUTING.

thanks for the help
Henry


