From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: foward ing specific ports
Date: Fri, 28 Jun 2002 22:12:35 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020628211237.MOJ16050.mta01-svc.ntlworld.com@there>
References: <3BC9CB95BC7EE44587FFFEAB0499147001E2F80F@KMCLUSTER.abcdistributing.net> <20020628210718.IFV16050.mta01-svc.ntlworld.com@there>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020628210718.IFV16050.mta01-svc.ntlworld.com@there>
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
To: netfilter@lists.samba.org

On Friday 28 June 2002 10:07 pm, Antony Stone wrote:

> On Friday 28 June 2002 9:55 pm, Anthony Cesar wrote:
> > is it possible to tell iptables to allow forwarding of specific ports
> > that are staggered, in one entry?  for example, i know that you can do a
> > range of ports ( --sport 1024:65535) but what if i have only three ports
> > like 25,110, and 53?
> >
> > does the syntax allow for me to list these ports in just one chain
> > (hypothetical: --sport 25-53-110)?
>
> No :-(

Ooops :-)

I forgot about the multiport option.   I was thinking of multi-IP addresses I 
think.

> > or do i have to generate a chain for each one?  it would help my typing
> > fingers a lot if what i'm asking was possible....
>
> Best I can suggest is something like:
>
> for a in 25 53 110
> do
> iptables -A FORWARD -i eth0 -p tcp --dport $a -j ACCEPT
> done
>
>
>
> Antony.

