From: "bino_oetomo" <bino@indoakses-online.com>
Subject: Re: iptables + MRTG
Date: Tue, 31 Aug 2004 20:17:06 +0700
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <00c301c48f5e$69b53e80$0300a8c0@indoaksesbno>
References: <a0f69e5040828042815b5e61e@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@lists.netfilter.org>


----- Original Message ----- 
From: "Askar" <askarali@gmail.com>
To: "netfilter" <netfilter@lists.netfilter.org>
Sent: Saturday, August 28, 2004 6:28 PM
Subject: iptables + MRTG


> hi,
> 
> Anyone here using MRTG with iptables? for example to check iptables -L
> -nvx things graphical using mrtg... or any other statistics
> any possibility ?
> 

Take a look at "Passtrough" methode of extending netsnmp.
all you need is just a simple bash script
and you can "call" your snmp via MRTG and other snmp-manager.

Sincerely
-bino-


