From: "R. Sterenborg" <rsterenborg@xs4all.nl>
Subject: RE: Yahoo Messenger
Date: Sun, 6 Oct 2002 14:30:49 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000001c26d34$339a6a80$0401000a@madmac.org>
References: <20021006091131.LDNX459.mta02-svc.ntlworld.com@there>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021006091131.LDNX459.mta02-svc.ntlworld.com@there>
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
To: 'Netfilter' <netfilter@lists.netfilter.org>

> blocking yahoo messenger on iptables is not enough,
> becoze users will still be able to connect through a
> proxy, u have to block it on the proxy as well.
>

Maybe I'm thing too simple here, but...
From : http://help.yahoo.com/help/us/mesg/use/use-17.html

<snip>
If you are trying to connect from behind a firewall that doesn't use
proxy servers, Yahoo! Messenger will automatically search the firewall
for an open port, and, if it finds one, use that to connect. If
Messenger is unable to find an open port, ask your System
Administrator to open port 5050 to our Messenger servers,
cs1.yahoo.com, cs2.yahoo.com, and cs3.yahoo.com
<---->
If your Internet connection involves an HTTP proxy, follow these steps
to configure the Messenger to work through your connection:
</snip>

So, if you *don't* want users to connect to Yahoo Messenger, can't you
do :

# If users are NAT-ed
iptables -A FORWARD -d cs1.yahoo.com -j DROP
iptables -A FORWARD -d cs2.yahoo.com -j DROP
iptables -A FORWARD -d cs3.yahoo.com -j DROP


# Via (any ?) proxy
iptables -A OUTPUT -d cs1.yahoo.com -j DROP
iptables -A OUTPUT -d cs2.yahoo.com -j DROP
iptables -A OUTPUT -d cs3.yahoo.com -j DROP


Rob


