From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: firewall problem continued
Date: Mon, 9 Aug 2004 09:32:13 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200408090932.13099.Antony@Soft-Solutions.co.uk>
References: <20040809081216.GA12643@tranquility.scriptkitchen.com>
Reply-To: Netfilter ML <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040809081216.GA12643@tranquility.scriptkitchen.com>
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
To: Netfilter ML <netfilter@lists.netfilter.org>

On Monday 09 August 2004 9:12 am, Payal Rathod wrote:

> Hi,
> I am rephrasing my last question with better words and more information.
> My firewall config (simple) is kept at,
> http://payal.staticky.com/tables.txt

I think you should specify the output interface in your MASQUERADE rules, so 
that only packets going out of the Internet interface get SNATted - otherwise 
packets going between your internal LAN and the DMZ are going to get SNATted 
too, which is not really what you want.

> My problem is simple I have a DMZ machine where mail server is hosted.
> Its apache (needed for webmail) can be accessed from outside world by
> http://<ext IP>. But if I give http://<ext IP> from a LAN machine I cannot
> access it.

This may be because you say you have a Squid proxy running on the firewall 
itself.   If you were just doing standard HTTP, the ruleset you have posted 
looks like you should have access to TCP dport 80 on the DMZ from the LAN.

> Upon further investigation I found that port 25 and 110 can be
> accessed from LAN but not from the gateway (firewall) machine.

Why would you need to access 25/110 from the firewall?   Surely it isn't 
acting as a mail client?

> Therefore,
> since this machine is also a simple squid proxy to LAN, I cannot access
> webmail thru' LAN. Now, if someone can help me in access those services
> from the firewall machine itself, it will be great.
> I have blocked access to port 80 -d 0/0 from LAN and allow access
> only through squid.

What Squid access controls do you have?
What URL are you using to access the mail server from the LAN?
If it's a hostname, what IP does this resolve to when Squid tries to connect?

You seem to have a rather confused OUTPUT ruleset, by the way.

There is a default ACCEPT policy, there are also some ACCEPT rules (and no 
DROP rules), and the -m state rule is included twice....

You also have the -m state rule duplicated in your INPUT and FORWARD rulesets.

Regards,

Antony.

-- 
"Note: Windows 98, Windows 98SE and Windows 95 are not affected by [MS
Blaster].   However, these products are no longer supported.   Users of these
products are strongly encouraged to upgrade to later versions."

(which *are* affected by MS Blaster...)

http://www.microsoft.com/security/security_bulletins/ms03-026.asp

                                                     Please reply to the list;
                                                           please don't CC me.


