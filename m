From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: HTTP Port forwarding issues
Date: Mon, 8 Jul 2002 21:07:35 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020708200737.CDNC4119.mta06-svc.ntlworld.com@there>
References: <001f01c226b6$eb0a4f60$6702a8c0@internal.monstersolutions.net> <20020708195715.CBTA19225.mta07-svc.ntlworld.com@there> <003501c226ba$93cc7da0$6702a8c0@internal.monstersolutions.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <003501c226ba$93cc7da0$6702a8c0@internal.monstersolutions.net>
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

On Monday 08 July 2002 9:03 pm, Big Daddy wrote:

> i have the following rule as well.
>
> iptables -A FORWARD -i eth0 -m state --state RELATED,ESTABLISHED -j ACCEPT

Okay, what about a rule allowing the reply packets back out of eth0 ?

Antony

> ----- Original Message -----
> From: "Antony Stone" <Antony@Soft-Solutions.co.uk>
> To: <netfilter@lists.samba.org>
> Sent: Monday, July 08, 2002 3:57 PM
> Subject: Re: HTTP Port forwarding issues
>
> > On Monday 08 July 2002 8:51 pm, Big Daddy wrote:
> > > It worked when I was using a Linksys router. However maybe they have
> > > changed it since then. Do my rules look fine?
> >
> > Well, I hope these are not your *only* rules ?   I mean, like Stewart
> > suggested, what about the ESTABLISHED packets as well as the NEW ones ?
> >
> >
> >
> > Antony.

