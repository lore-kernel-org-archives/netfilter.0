From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Trouble with --dport
Date: Mon, 21 Oct 2002 21:50:41 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021021205045.RJJP17202.mta01-svc.ntlworld.com@there>
References: <20021021201254.35389.qmail@web10908.mail.yahoo.com> <20021021202758.QVP28874.mta06-svc.ntlworld.com@there> <1035233288.2304.1.camel@parsifal>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1035233288.2304.1.camel@parsifal>
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
To: netfilter <netfilter@lists.netfilter.org>

On Monday 21 October 2002 9:48 pm, Ivan Rodriguez Aguilar wrote:

> On Mon, 2002-10-21 at 15:27, Antony Stone wrote:
> > On Monday 21 October 2002 9:12 pm, blah blah wrote:
> > > I am having trouble with the following lines:
> > >
> > > -A INPUT -i eth0 -p tcp -s 1.1.1.1 --dport 1234 -j
> > > ACCEPT
> > > -A INPUT -i eth0 -p tcp -s 1.1.1.2 --dport 1233 -j
> > > ACCEPT
>
> Yes the protocol what is tcp or udp ??
> example
>
> iptables -A INPUT -i eth0 -p tcp -s 1.1.1.1 -p tcp --dport 1234 -j
> ACCEPT

Why put "-p tcp" twice ?

The order of "-p tcp" and "-s 1.1.1.1" doesn't matter.

Antony.

-- 

In science, one tries to tell people
in such a way as to be understood by everyone
something that no-one ever knew before.

In poetry, it is the exact opposite.

 - Paul Dirac

