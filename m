From: Damjan <gdamjan@mail.net.mk>
Subject: Re: UDP nat question
Date: Thu, 21 Apr 2005 14:17:08 +0200
Message-ID: <20050421121708.GA16591@legolas.on.net.mk>
References: <42667F45.5000502@inescporto.pt>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <42667F45.5000502@inescporto.pt>
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
Content-Type: text/plain; charset="utf-8"
To: netfilter@lists.netfilter.org

> Imagine a host behind NAT with IP 192.168.22.33 which has an application 
> on port 5060 ( a sip client) and opens a connection to a server outside 
> the NAT (the sip registrar with IP 130.11.22.33 on port 5060), and 
> consider that the NAT box translates the SIP client src_ip to 
> 129.11.22.33 and src_prt to 5054, for this communication.
> 
> The SIP registrar is able to reach the SIP client running on 
> 192.168.22.33:5060 by using 129.11.22.33:5054, but what about other 
> hosts on the Internet? Will they also be able to reach the SIP client 
> using the pair 129.11.22.33:5054, 

They can't

> or only packets coming from the SIP registrar be accepted?

yes.

Sip clients behind NAT must use a Proxy.


-- 
damjan | дамјан
This is my jabber ID --> damjan@bagra.net.mk <-- not my mail address!!!

