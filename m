From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Rule question
Date: Sat, 22 Jun 2002 08:38:37 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020622073839.JXYQ19225.mta07-svc.ntlworld.com@there>
References: <200206220935.12908.captain.nuke@gmx.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <200206220935.12908.captain.nuke@gmx.at>
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

On Saturday 22 June 2002 8:35 am, Patrick Petermair wrote:

> Hi!
>
> I've read the following example script for a linux box with masquerading
> and some firewall rules:
> http://www.ecst.csuchico.edu/~dranch/LINUX/ipmasq/examples/rc.firewall-2.4-
>stronger
>
> So far I think I understand everything except this line:
> $IPTABLES -A OUTPUT -o $INTIF -s $EXTIP -d $INTNET -j ACCEPT
>
> How can an OUTPUT of the internal interface have the external IP address as
> source IP ?? And why would it be accepted?
> As far as I understand it, the masquerading and stuff is all done in the
> FORWARD chain. I can't think of an example where a packet originating from
> the internal interface of my firewall can have the external IP as source.

Masquerading is done in the POSTROUTING chain - pretty much immediately 
before the packet goes out on the wire.

In a wayt that makes it even worse, because POSTROUTING comes *after* all the 
other chains - FORWARD, OUTPUT etc.

I don't understand the above rule either.

 

Antony.

