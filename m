From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: ip_nat_pptp & ip_conntrack_pptp help appreciated.
Date: Mon, 30 Sep 2002 22:22:03 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020930212206.BGUF28874.mta06-svc.ntlworld.com@there>
References: <0EB90DD25728C04CBD401CDCD72D2A655A8A@homer.no.laasby.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <0EB90DD25728C04CBD401CDCD72D2A655A8A@homer.no.laasby.com>
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

On Monday 30 September 2002 10:10 pm, Kjetil Laasby wrote:

> Hello !
>
> I've got a little problem thats disrupting my nightsleep - and I
>  hope someone could point me into where I'm doing wrong.
>
> My configuration is like this :
> ---------------------------------------------
> 80.x.x.x  (Valid IP)
> Cisco DSL router
> (one rule - NAT all to 10.0.2.1)
>
> 10.0.2.1 - RedHat 7.3 - kernel-2.4.20-pre8   (this Iface will receive
> 							     all data
> from valid-IP)
> 	(Routing enabled, Netfilter 1.2.7a)
> 10.0.0.1 - RedHat 7.3 - kernel-2.4.20-pre8
>
> 10.0.0.2 - Windows box (Client)
>
> My goal is to have a PPTP server (with PoPToP).

If you need to build NAT support for PPTP into the Linux box, then you would 
need to do the same thing on the Cisco box if you're going to do NAT there as 
well.

The whole point of netfilter support for PPTP through NAT is that PPTP 
doesn't work through NAT without it - therefore it won't work through NAT on 
the Cisco box either.

Your best bet might actually be to perform the opposite NAT on the Linux box 
that you're doing on the Cisco, put the same 80.x.x.x valid IP on the Windows 
client as you have on the outside of the Cisco router, and see whether PPTP 
will work, thinking there's no NAT going on at all (because the two cancel 
each other out).

Antony.

-- 

The difference between theory and practice is that
in theory there is no difference, whereas in practice there is.

