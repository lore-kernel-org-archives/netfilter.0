From: Anders Fugmann <afu@fugmann.dhs.org>
Subject: Re: multiple external interfaces
Date: Thu, 31 Oct 2002 23:09:26 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DC1AA16.1050904@fugmann.dhs.org>
References: <001501be3d85$bf2b8e40$0200000a@workstation>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: James Stickland <jamesstickland@sympatico.ca>
Cc: netfilter@lists.netfilter.org

James Stickland wrote:

> however, i would like to run my client/workstation's internet connection 
> from the same router, but using different external interface and 
> internal ethernet.
> for example, i would like the pots dialup line interface masqueraded to 
> eth2, so that all computers connected to eth2 use the ip address of the 
> ppp device connected to dialup.
>  
> here is how i vision it:
>  
> internet--dial_up-->ppp1(/dev/ttyS3)-->router-->eth2-->crossover_cable-->client
>  
> could anyone help me in doing so?  is it just a matter of some 
> additional iptables entries, or does this run deeper? please help, and 
> cc reply directly to jamesstickland@sympatico.ca 
> <mailto:jamesstickland@sympatico.ca>
>  
Netfilter cannot change how packages are routed. For this you need the 
iproute2 package. See "Linux Advanced Routing & Traffic Control"[1] for 
more information. You may need to use netfilter to mark packages but 
this is all explained on [1].

[1] http://lartc.org

Regards
Anders Fugmann

--
Author of FIAIF
FIAIF is an intelligent firewall.
http://fiaif.fugmann.dhs.org



