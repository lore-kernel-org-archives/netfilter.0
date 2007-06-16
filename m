From: Marcos Granero Vaz - Informatica/MTZ <MarcosGranero@granero.com.br>
Subject: Re: ""how can i allow IP protocol 47 "" on iptables to connet
 a	pptpVPN server.
Date: Sat, 16 Jun 2007 12:12:38 -0300
Message-ID: <4673FDE6.9040605@granero.com.br>
References: <000e01c7b01a$0c8305a0$dededede@neilhp>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------080007050000090509090307"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <000e01c7b01a$0c8305a0$dededede@neilhp>
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
To: Neil Aggarwal <neil@JAMMConsulting.com>
Cc: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.
--------------080007050000090509090307
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

I had this kind of problem too. And i figured out that only one  GRE
protocol VPN connection works at a time. I think this problem is in the
kernel or in iptables conntrack (maybe the way they control the flow),
but there is a way, you have to use a PPTP proxy. I use a pptpproxy from
http://www.mgix.com/pptpproxy/ and works fine! Now i have 6 GRE VPN
connection simultaneously.

Regards

Neil Aggarwal escreveu:
> Rajiv:
>  
>   
>> Is it possible to put vpn server befind firewall?
>> Is anybody did this before?
>>     
>
> I tried it.  I was able to get things working for the
> most part, but had intermittent problems.
>
> I eventualy moved my VPN server outside the firewall.
>
> I hope this reference point helps.
>
> 	Neil
>
> --
> Neil Aggarwal, (832)245-7314, www.JAMMConsulting.com
> FREE! Eliminate junk email and reclaim your inbox.
> Visit http://www.spammilter.com for details.
>
>
>   

--------------080007050000090509090307--

