From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: hi guys passive firewall
Date: Sun, 7 Jul 2002 16:21:33 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020707152135.EBFS16050.mta01-svc.ntlworld.com@there>
References: <3D27B365.2050705@remo.ws> <20020707080609.TFPL23840.mta03-svc.ntlworld.com@there> <3D285DAB.9010908@remo.ws>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <3D285DAB.9010908@remo.ws>
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
To: netfilter <netfilter@lists.samba.org>

On Sunday 07 July 2002 4:26 pm, Remo Mattei wrote:

> Antony Stone wrote:

> > Depends whether you're talking about putting netfilter onto the server
> > itself (in which case you filter the INPUT chain), or whether netfilter
> > is on a router between the servers and the Internet (in which case you
> > filter the FORWARD chain).
>
> So I guess since the anwser is above I just will use the forward and let
> everything pass in the input.

It sounds to me as though you are uncertain about how packets pass through a 
netfilter firewall.

Packets addressed to the firewall itself go through the INPUT chain.

Packets being routed from a machine on one side of the firewall to a machine 
on the other go through the FORWARD chain.

Packets originating on the firewall itself go through the OUTPUT chain.

No single packet will ever go through both the INPUT and the FORWARD chains, 
or the FORWARD and the OUTPUT chains.

 

Antony.

