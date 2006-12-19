From: Martijn Lievaart <m@rtij.nl>
Subject: Re: Interesting article about punching holes in firewalls...
Date: Tue, 19 Dec 2006 10:42:24 +0100
Message-ID: <4587B400.6080206@rtij.nl>
References: <45860240.2040102@riverviewtech.net>
	<1166426813.8007.10.camel@anduril.intranet.cartel-securite.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1166426813.8007.10.camel@anduril.intranet.cartel-securite.net>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Cedric Blancher <blancher@cartel-securite.fr>
Cc: Mail List - Netfilter <netfilter@lists.netfilter.org>, Grant Taylor <gtaylor@riverviewtech.net>

Cedric Blancher wrote:

>Le dimanche 17 d=E9cembre 2006 =E0 20:51 -0600, Grant Taylor a =E9crit =
:
>  
>
>>I personally have known that using "-m state --state 
>>ESTABLISHED,RELATED" was not the most secure thing to use for returnin=
g 
>>traffic.  Namely this will allow you to make a valid connection to a w=
eb 
>>server, say to retrieve a picture.  Then said web server could send 
>>malicious traffic back to your computer and pass through your firewall=
. 
>>  This is because the traffic coming from the web server to your 
>>computer is now deemed as RELATED.
>>    
>>
>
>How ? Afaik RELATED is used for two types of packets:
>
>=09. ICMP errors matching previously seen IP flow
>=09. First packet of expectations created through a helper
>  
>

One can think about spoofed ICMP errors, but there really is not a lot 
we can do about that. (And for tcp they SHOULD be ignored anyhow. OTOH 
an atacker can spoof a RST packet.)

I do assume in all this that the only ICMP traffic matching RELATED are 
true ICMP errors (afair host/net unreachable and fragmentation needed). 
If this also opens up say ICMP redirect[1] we may have a slight problem.=
 
It is possible netfilter does this to accomodate bridging setups. Anyone=
 
can comment on this? If this opens up the connection for any other ICMP 
traffic, I think that's a bug. But I cannot imagine netfilter does this,=
 
anyone know for sure?

M4

[1] redirect in Linux is also sanity checked, so the risk is not even 
that great, but still.

