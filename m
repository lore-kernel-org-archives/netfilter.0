From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: FORWARD RULE -- please help
Date: Tue, 9 Mar 2004 09:20:04 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403090920.04308.Antony@Soft-Solutions.co.uk>
References: <20040309075404.92394.qmail@web13206.mail.yahoo.com> <200403090846.46608.Antony@Soft-Solutions.co.uk> <20040309091051.GH24806@samad.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040309091051.GH24806@samad.com.au>
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

On Tuesday 09 March 2004 9:10 am, Alexander Samad wrote:

> On Tue, Mar 09, 2004 at 08:46:46AM +0000, Antony Stone wrote:
> > On Tuesday 09 March 2004 7:54 am, Nilesh wrote:
> > > 203.129.224.149 is my firewall machine running
> > > IPTABLES and 192.168.0.22 is my local machine on 2090
> > > port service is running
> > >
> > > 202.129.227.3 is his firewall IP and 192.168.1.25 is
> > > his local machine where on 2090 port services is
> > > running
> > >
> > > I want to communicate this both internal
> > > machines(192.168.0.22 and 192.168.1.25) through
> > > firewall
> >
> > If you want his 192.168.1.0/24 network to be able to communicate with
> > your 192.168.0.0/24 network then you should investigate IP in IP
> > tunnelling / encapsulation (see the Linux Advanced Routing Guide at
> > http://lartc.org for a simple guide to how to do this), or else set up a
> > VPN (eg : FreeS/WAN, or the IPsec implementation built into the 2.6
> > kernel).
>
> Or he could use MASQ on both sides with 2 dnat rules

True, however this is not a scalable solution (won't work for more than one 
client or server at each end of the link for example), and it means that the 
client and server see the public addresses of the other end, not the private 
ones (although you could probably overcome this with another couple of SNAT 
rules loaded on top).

It would probably work okay in a restricted situation such as Nilesh 
specified, however.

Regards,

Antony.

-- 
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing on usenet and in e-mail?


