From: Jim Miller <jimm=2zrVkTMJS9g5UWNf+nJyDw@public.gmane.org>
Subject: [quagga-users 368] Re: FW: Antefacto and 2.4.21
Date: Tue, 02 Sep 2003 21:29:05 -0500
Sender: quagga-users-bounces=UOy77sIEA+cAd7ICUelF/Q@public.gmane.org
Message-ID: <3F5551F1.5040505@simutronics.com>
References: <Pine.LNX.4.44.0309011948200.5869-100000@l>
Reply-To: jimm=2zrVkTMJS9g5UWNf+nJyDw@public.gmane.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <quagga-users-bounces@lists.quagga.net>
In-Reply-To: <Pine.LNX.4.44.0309011948200.5869-100000@l>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.quagga.net/mailman/listinfo/quagga-users>,
	<mailto:quagga-users-request@lists.quagga.net?subject=unsubscribe>
List-Archive: <http://lists.quagga.net/pipermail/quagga-users>
List-Post: <mailto:quagga-users@lists.quagga.net>
List-Help: <mailto:quagga-users-request@lists.quagga.net?subject=help>
List-Subscribe: <http://lists.quagga.net/mailman/listinfo/quagga-users>,
	<mailto:quagga-users-request@lists.quagga.net?subject=subscribe>
Errors-To: quagga-users-bounces@lists.quagga.net
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "LinuxVirtualServer.org users mailing list." <lvs-users=9NwHyUdJu3J9kDVj6ABq+kzrnptfnCPw@public.gmane.org>, quagga-users=UOy77sIEA+cAd7ICUelF/Q@public.gmane.org, netfilter=wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org, =?ISO-8859-1?Q?=22Elizabeth_Stokely_=3Clizabeth=40simutronics=2Ecom=3E?= =?ISO-8859-1?Q?=2E_Jo=E3o_Nuno_Mendes=22?= <Joao.Mendes=IMkFEHXYkuU@public.gmane.org>

Julian Anastasov wrote:

>	Hello,
>
>On Mon, 1 Sep 2003, Jim Miller wrote:
>
>  
>
>>My use for LVS and the Antefacto patch is with non-NATed ip space (we
>>use IPs assiged to us from ARIN).  I _do_ hope the patch will still
>>function.
>>    
>>
>
>	You rely on antefacto patch for non-NAT? What is the usage?:
>
>- DR/TUN real server uses director as default gateway?
>
>- NEW/EST states for incoming packets?
>
>	BTW, I'm not sure what will happen if tcp-window-tracking.patch
>is used for DR/TUN, may be it expects bidirectional streams?
>
>  
>
>>Jim
>>    
>>
>
>Regards
>
>--
>Julian Anastasov <ja=FgGsKACvmQM@public.gmane.org>
>
>  
>
Hi Julian and everyone on the list(s)  =)

Well, I'm in the middle stages of setting up two linux server firewalls 
(iptables/netfilter - doing stateful firewalling) with keepalived (vrrp) 
and the LVS framework kernel patch, in a Master/Backup configuration 
(keepalive seems to like having the lvs framework to build on).  The 
boxes are doing dynamic routing with ospf to our Cisco routers using 
Quagga 0.96.2 -- and except for having to remember how to implement 
route maps (bgp is injecting about 1500 routes into ospf ;), I'm very, 
very happy with Quagga's improvements/fixes to ospfd.

I was able to successfully apply the antefacto patch to 2.4.21 kernel 
source thanks to great advice from the authors (removing the ftp 
contrack part from the patch).  And I was hoping the antefacto patch 
would help fix conn_track issues between the two firewalls (should the 
master go down, how will the backup know what's related/established vs 
new?); but, I've since learned that a mechanism doesn't yet exist for 
sharing connection tracking information between n+1 iptables/netfilter 
firewalls running keepalived (vrrp).  Any established/related 
connections will be lost if the master goes down, but that's better than 
not being able to reconnect at all!  So, to be honest, I'm not sure if 
the antefacto (or LVS) patch(s) really buy me anything at all.  I was 
hoping some other folks have successfully set up something similar to 
this and might have some advice they'd like to share.

So far I've found vrrp does a great job in dealing with with fail over 
(if down).. but I've found some strangeness with pulling the cable (or 
just resetting) the backup -- the clients (win98 test/junk machines) on 
the internal lan (at times) seem to cache the MAC of the backup and they 
stop talking to the rest of the world.  I'm sure it's just something 
goofy that I have mis-configured.

Anyway, that's what I'm trying to setup.



--Jim
