From: Gavin Hamill <gdh@acentral.co.uk>
Subject: Re: (OT) Tunnel
Date: Mon, 25 Aug 2003 17:00:04 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200308251700.04267.gdh@acentral.co.uk>
References: <000601c36b20$038c7cd0$0200a8c0@basti79>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000601c36b20$038c7cd0$0200a8c0@basti79>
Content-Disposition: inline
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
To: "Netfilter (E-mail)" <netfilter@lists.netfilter.org>

On Monday 25 August 2003 16:46, Sebastian wrote:

> So, what i'm lookting for is a tunnel which
> - works with Windows Clients
> - provides full TCP/IP connectivity (unlike simple SSH tunnels)
> - dosen't use GRE (unlike PPTP and afaik IPsec)

IPsec doesn't use GRE, but AH/ESP... although if your router is blocking GRE, 
it'll likely block these two, too :(

Have a search for 'CIPE' on google - this has native NDIS drivers for 
NT/2000/XP and a Linux module/userspace control kit to enable you to create 
secure tunnels using normal UDP traffic.

Cheers,
Gavin


