From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Help needed understanding what I am doing wrong.
Date: Tue, 4 Jun 2002 01:10:22 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206040010.g540ANA32170@Networker.rockstone.co.uk>
References: <004501c20b5a$31559650$6301a8c0@JJONES1>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <004501c20b5a$31559650$6301a8c0@JJONES1>
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
To: 'Iptables' <netfilter@lists.samba.org>

On Tuesday 04 June 2002 12:55 am, John Jones wrote:

> > If it fails, go the the DNS machine itself (10.0.0.10) and try
> >
> > dig samba.org
> >
> > and see if it can get a reply from some external nameserver.
>
> Yes, it works fine.  Remember, this DNS server has been serving our
> network for a year or two.  Through the current IPCHAINS rules (and the
> current, but outdated, .113 firewall) everything is fine.  It is the
> upgrade to IPTABLES that seems to be failing.

Okay - I think (!) I know the precise problem now.

I did not realise that you're already using the DNS server on 10.0.0.10 
through the old IPchains firewall.   I thought it was a new DNS server behind 
a new firewall....

So, here's the question:

What is the default route on machine 10.0.0.10 ?

I bet it points to the IPchains firewall.....

Therefore this is what happens:

client (anywhere) contacts DNS server on 66.38.133.120, gets translated to 
10.0.0.10, DNS server wants to reply to the client.   DNS server's default 
gateway points to old IPchains firewall, so reply packet goes through there, 
either gets dropped because that firewall didn't see the corresponding 
incoming packet, so it doesn't do the reverse translation, or else it does 
translate it (because it translates everything), but it source translates it 
to 66.38.133.113, and reply comes back to the client from an address it 
doesn't recognise :-)

Either way, no valid packet comes back to the client from 66.38.133.120

How'm I doing ?


Antony.

