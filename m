From: "Alexis" <alexis@tpys.com.ar>
Subject: Re: Multiple PPTP clients behind iptables.
Date: Fri, 9 Apr 2004 12:55:45 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001501c41e4b$1f079e70$51a2fea9@heretic>
References: <GHEILNONPACCGBGKBEKKMEBICFAA.mani@manikandan.org>
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
Content-Type: text/plain; charset="us-ascii"
To: manikandan@manikandan.org
Cc: netfilter <netfilter@lists.netfilter.org>

yes, you need the pptp patch

ive been in the same situation, and applying the patch made it work just
fine.-

see
http://www.netfilter.org/documentation/HOWTO//netfilter-extensions-HOWTO-5.html#ss5.6

----- Original Message ----- 
From: "Manikandan" <mani@manikandan.org>
To: "Netfilter" <netfilter@lists.netfilter.org>
Sent: Friday, April 09, 2004 12:08 PM
Subject: Multiple PPTP clients behind iptables.


> Dear friends,
>
> As I am getting more confused about VPN masq., request your help on
> this.
>
> My local LAN is 10.35.0.0/24
> My Linux box running red hat linux 9.0 with kernel 2.4.20-8. acting as the
> gateway for my LAN to Internet.
>
> I need to allow my LAN clients to access Microsoft windows VPN (Windows
2000
> Adv. Server) using PPTP over Internet.
> I am not able to make more than one connection to the VPN server as my LAN
> outgoing traffic to Internet is getting SNAT to single public IP.
>
>
> I read few guides and howtos to configure my firewall to allow multiple
PPTP
> sessions. But still I couldn't get through.
>
> Do I need to patch my kernel? What support do I need to enable this
multiple
> PPTP traffic.
>
> Request your views and help on this.
>
>
> Have a nice day
>
> Regards,
> Manikandan.
>
>
>
>
>
>
>
>


