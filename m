From: leolistas@solucoesip.net
Subject: RE: TCM MSS control over OUTPUT chain
Date: Sat,  3 May 2003 09:07:16 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1051963636.3eb3b0f4a3a96@www.solucoesip.net>
References: <000001c31165$b8cfc8a0$100aa8c0@bwhwangnotepc>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000001c31165$b8cfc8a0$100aa8c0@bwhwangnotepc>
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
To: netfilter@lists.netfilter.org, bwh@net-safe.co.kr



   Houston, we have a problem !! Forwarded packets will NEVER reach OUTPUT 
chain. OUTPUT is only reached by locally generated packets and INPUT will 
only be reached by locally destinated packets. If the machine is 'routing' 
that packet, no matter if it will be NATed or not, it will never reach 
OUTPUT.

   Why cant you do this in FORWARD chain ? You should notice that MSS is 
not a final rule, I mean, you can use this as the very first rule in 
FORWARD chain. MSS will be mangled and other rules WILL be parsed. TCPMSS 
is different from ACCEPT/DROP/REJECT which are final rules, that means, no 
further rule processing will occur.

   I've this kind of configuration running in SEVERAL machines which act 
as gateways for their networks and it works just fine !

iptables -A FORWARD -i eth0 -o eth1 -p tcp --tcp-flags SYN,RST SYN -j 
TCPMSS --set-mss 1400


   Sincerily,
   Leonardo Rodrigues


Citando "Hwang, Byoung Woo" <bwh@net-safe.co.kr>:

> Hi,
> The machine where I want to try to control the size of TCP MSS
> is a gateway. eth0 is connected to the internal lan which use
> virtual IPs and eth1 is connected to ADSL modem and uses PPPOE.
> After the command "iptables -A OUTPUT -p tcp --tcp-flags SYN,RST SYN -j
> TCPMSS --set-mss 1400"
> packets from gateway itself to outside are controlled on TCP MSS size
> but
> packets from Internal LAN to Internet which are NATed by Masquerading
> are
> not controlled on TCP MSS size.
> I have a reason why I cannot control on FORWARD chain.
> 
> Please, help
> 
> Reguards,



