From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: IPTables & Squid
Date: Sat, 2 Aug 2003 01:00:25 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030802010025.65d71b55.arnt@c2i.net>
References: <5.1.0.14.2.20030801094250.02f127f0@mail.saipan.com>
	<3F2A2093.8020200@snapgear.com>
	<1102.202.128.1.252.1059773144.squirrel@mail.saipan.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1102.202.128.1.252.1059773144.squirrel@mail.saipan.com>
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
To: Daniel Camacho <dcamacho@saipan.com>
Cc: netfilter@lists.netfilter.org

On Sat, 2 Aug 2003 07:25:44 +1000 (ChST), 
"Daniel Camacho" <dcamacho@saipan.com> wrote in message 
<1102.202.128.1.252.1059773144.squirrel@mail.saipan.com>:

..Daniel, kindly _lose_ the html, as you can see, 
there _is_ a reason people drop out of threads.

> <BR>Hi Philip,<BR><BR>Thanks for the reply. I want to pass the
> connection through and not go through the Squid server. Basically, my
> intention is to filter certain customers from accessing the Squid
> server but still have full connectivity.
> Thanks.<BR><BR>Daniel<BR><BR><BR>-----<BR>Philip Craig said:<BR>&gt;
> Daniel Camacho wrote:<BR>&gt; &gt; I'm new to this list and to
> IPtables. I recently installed a<BR>&gt; transparent<BR>&gt; &gt;
> proxy using Squid and IPtables. On one computer, I installed
> IPtables<BR>&gt; and<BR>&gt; &gt; forward all port 80 requests to the
> Squid server, which is running on a<BR>&gt; &gt; separate server. On
> that same computer I want to be able to filter<BR>&gt; certain<BR>&gt;
> &gt; connections from using the Squid. I know I can do this with
> Squid, but<BR>&gt; I<BR>&gt; &gt; want to know how to do it with
> IPtables. Does anyone know how may I go<BR>&gt; &gt; about doing this?
> Thanks.<BR>&gt; <BR>&gt; Do you want to just pass these connections
> through directly instead of<BR>&gt; forwarding them to the Squid
> server, or do you want to drop them<BR>&gt; completely?<BR>&gt;
> <BR>&gt; If you just want to pass them through, you need to stop them
> reaching the<BR>&gt; DNAT rule. You have already done this for the
> squid server itself, but<BR>&gt; that method only allows you to pass
> through one IP address. A more<BR>&gt; general<BR>&gt; method is to
> add ACCEPT rules for each address (just repeat the first<BR>&gt; rule
> for each address to pass through):<BR>&gt; <BR>&gt; # start up filter
> rules for traffic redirection to Squid<BR>&gt; iptables -t nat -A
> PREROUTING -i eth0 -s 192.168.0.1 -p tcp --dport 80 -j<BR>&gt;
> ACCEPT<BR>&gt; iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80
> -j DNAT --to<BR>&gt; 192.168.0.1:3128<BR>&gt; <BR>&gt; If you want to
> drop the connections, then you need to put DROP or REJECT<BR>&gt;
> rules in the FORWARD chain of the filter table. Make sure you put
> them<BR>&gt; before the rules ACCEPTing traffic from each
> subnet.<BR>&gt; <BR>&gt; --<BR>&gt; Philip Craig -
> philipc@snapgear.com - http://www.SnapGear.com<BR>&gt; SnapGear -
> Custom Embedded Solutions and Security Appliances<BR>&gt; <BR>&gt;
> <BR>&gt; <BR>

-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.


