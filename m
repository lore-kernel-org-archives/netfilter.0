From: Ramin Alidousti <ramin@cannon.eng.us.uu.net>
Subject: Re: Do I need a firewall rule for RST ?
Date: Tue, 9 Jul 2002 13:35:35 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020709173535.GX25368@cannon.eng.us.uu.net>
References: <02070918501400.02824@Lms>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <02070918501400.02824@Lms>
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
Content-Transfer-Encoding: 7bit
To: Jan Humme <jan.humme@xs4all.nl>
Cc: netfilter@lists.samba.org

On Tue, Jul 09, 2002 at 06:50:13PM +0200, Jan Humme wrote:

> Questions:
> 
> 1) AFAIK these packets are harmless, correct? Or could some of them be used 
> in attacks?

Someone can send you these packets to tear down your established
tcp sessions. Not that it's easy to do but feasible.

> 
> 2) (Assuming they are harmless:) is it safe then to add a rule:
> 
> $IPTABLES -A FORWARD -m multiport -p tcp -i ppp0 --sports $TCPOUT\
> 	-j ACCEPT --tcp-flags RST RST
>  
> 3) Is there perhaps a better way to deal with these kinds of packets? 
> Perhaps i should better use "state" and forget about the flags?

Yes. I'd do this. However it doesn't protect you from the case mentioned
above. The only solution for that is using IPsec. But then again you
cannot run IPsec for all your traffic...

Ramin

> Jan Humme.

