From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: RE: Blocking Google Earth
Date: Mon, 15 Aug 2005 08:22:01 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0508150817130.24339@yvahk01.tjqt.qr>
References: <B9833546B2643B43A56C4E962E13174602A996@nehemiah.joris2k.local>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <B9833546B2643B43A56C4E962E13174602A996@nehemiah.joris2k.local>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joris Dobbelsteen <joris.dobbelsteen@mail.com>
Cc: netfilter@lists.netfilter.org


>* Request the user not to use the application.
>* Install a HTTP proxy server that catches all port 80 traffic. Squid might be a good candidate. Here you can easily make a policy to deny access to the kh.google.com servers (it was I believe).

Transparently intercept the traffic, mark outgoing squid packets with a value 
and reroute them via IMQ / standard Qos ;-) Combines both Hostname-granularity 
and speed limit.



Jan Engelhardt
-- 
| Alphagate Systems, http://alphagate.hopto.org/

