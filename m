From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: block internal to access external proxy server
Date: Thu, 8 Sep 2005 15:38:17 +0200 (CEST)
Message-ID: <50817.193.173.147.3.1126186697.squirrel@193.173.147.3>
References: <200509070738.j877ci8q020340@iris.com.my>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200509070738.j877ci8q020340@iris.com.my>
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
To: netfilter@lists.netfilter.org

> Hi,
>
>
>
> I just implement a center firewall (iptables) with transparent proxy
> (squid)
> in my company. I block the msn and yahoo chatting program in my iptable=
s
> rules. However, the users still can use external free proxy to use msn =
and
> yahoo messenger. May I know got any way for me to block the users for
> doing
> this and force all the traffic must go though my proxy?

MSN (and Yahoo ?) also connects via http and (both ?) use multiple IP
addresses.
That's why Squid will proxy for MSN clients and you be able to block it
using Squid. There have been posts on how to do this and you can easily
find them using Google :
http://www.google.nl/search?hl=3Dnl&q=3Dblock+msn+squid&meta=3D

These may be helpful :
http://nscsysop.hypermart.net/no_chat.html
http://www.experts-exchange.com/Security/Firewalls/Q_20610865.html



Gr,
Rob



