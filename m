From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: NAT not working on one of 3 firewalls
Date: Mon, 24 Jun 2002 20:25:28 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020624192531.RSTF295.mta03-svc.ntlworld.com@there>
References: <20020624113121.B868@inxservices.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020624113121.B868@inxservices.com>
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

On Monday 24 June 2002 7:31 pm, George Garvey wrote:

> The DSL I'm having problems with is connected through a router that
> translates a single IP to 5 IPs, only one of which I'm using. I'm told
> by the ISP that I can use any 2 of the 5 on the internet. At least,
> that's my understanding.

Um, what are the other three for, then ?   If you can only use 2 IPs, why has 
the ISP given you any more ?

> This system also has a GRE tunnel. I've turned of IPSEC until I get the
> nat worked out.

Good idea :-)

> If I ping an internet IP from the LAN, I'm pretty sure it goes out to
> the internet with the source IP still the LAN IP, without translation.

I'm not so sure about that (why do you think that's what's happening ?).

If you look at your log entry for the nat POSTROUTING table:

> Chain POSTROUTING (policy ACCEPT 16 packets, 1439 bytes)
>  pkts bytes target     prot opt in     out     source              
> destination 16  1184 SNAT       all  --  *      eth1    0.0.0.0/0          
>  0.0.0.0/0          to:XX.XXX.XXX.XXX

(Sorry about the way my email client has re-wrapped it...)

You can see that 16 packets / 1184 bytes have matched this rule, which means 
that they've been SNATted to XX.XXX.XXX.XXX

Also, I see that your FORWARD rules are logging no packets through them.   
What does your routing table look like ?

 

Antony.

