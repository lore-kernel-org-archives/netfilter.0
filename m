From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Universal Address Translation
Date: Sat, 24 Jul 2004 15:29:33 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407241529.33464.Antony@Soft-Solutions.co.uk>
References: <200407242032.35573.rio@martin.mu> <1090676859.2228.62.camel@anduril.intranet.cartel-securite.net> <200407242055.51714.rio@martin.mu>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407242055.51714.rio@martin.mu>
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
To: netfilter@lists.netfilter.org

On Saturday 24 July 2004 2:55 pm, Rio Martin. wrote:

> [isp-wireless] RE: How do Hotels, Starbucks, Hot Spots do this? ...
> ... Better yet most of the vendors below support Universal Address
> Translation,
> which allows a user to connect no matter what the ip or static vs. dhcp.
> ... isp-lists.isp-planet.com/ isp-wireless/0404/msg01168.html - 21k -
> Cached - Similar pages
>
> Actually the idea is the same as link above. UAT (Universal Address
> Translation) works to handle Address Translation for Hotspot Client Access,
> which clients no need to change anything for their PCs or Notebooks to
> access to Internet. Eventhough they put wrong TCP/IP Configuration, they
> still able to surf to Internet.

This sounds to me like it has to work at the MAC / ethernet / 802.11 layer, 
below IP.

If you intercept all traffic at the MAC layer, and make sure to put whatever 
IP address the client thinks it has in the IP headers of reply packets, then 
you'd be able to communicate with any machine no matter how it's configured 
(so long as it *has* an IP address, and expects to find a gateway router 
somewhere).

I'd suggest ebtables might be a good direction to investigate, since it does 
things at the next layer down, below IP, much more than iptables does.

Other than that, a little fiddling around with point-to-point routing, 
iproute2, and arp cache manipulation may do what you want.   (eg: capture all 
packets, discover source IP address, insert p-t-p route for that IP address, 
masquerade everything going out of your upstream link, hope nobody comes 
along with a laptop configured with an IP address belonging to Google, or 
your upstream ISP etc)

Regards,

Antony.

-- 
"There is no reason for any individual to have a computer in their home."

 - Ken Olsen, President of Digital Equipment Corporation (DEC, later consumed 
by Compaq, later merged with HP)

                                                     Please reply to the list;
                                                           please don't CC me.


