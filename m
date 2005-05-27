From: Jason Opperisano <opie@817west.com>
Subject: Re: IPsec Passthru
Date: Fri, 27 May 2005 16:39:17 -0400
Message-ID: <20050527203917.GA25255@bender.817west.com>
References: <AGEKLHGIOHJGPMIOILOHAEJIHOAA.allen.miller@lymanrichey.com>
	<20050527125135.GA30156@torres.l21.ma.zugschlus.de>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20050527125135.GA30156@torres.l21.ma.zugschlus.de>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Fri, May 27, 2005 at 02:51:35PM +0200, Marc Haber wrote:
> What you need exactly depends on which IPSEC product you use. Most
> IPSEC NAT Traversal schemes depend on encapsulating the AH/ESP traffic
> into UDP, so you need to open certain UDP ports. You need to NAT
> traffic towards your VPN gateway's Port UDP/500 in any case to allow
> ISAKMP, and probably you need to open up some more UDP ports.
> Netscreen Products tunnel the ESP/AH traffic through UDP/500, so you
> should be fine, and Symantec uses UDP/768 for the payload. Other
> products might do things differently.

just to pad the list--the standard NAT-T port is UDP 4500.  the cisco
client can use UDP or TCP 10000, and the check point client uses UDP
2746.

-j

--
"Stewie: You. Fetch me my copy of the Wall Street Journal. You two,
 fight to the death."
        --Family Guy

