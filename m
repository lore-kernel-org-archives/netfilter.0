From: paddy joesoap <paddyjoesoap@gmail.com>
Subject: In practice how are firewalls used to protect IM traffic?
Date: Tue, 15 Jun 2010 12:00:39 +0100
Message-ID: <AANLkTiknNHF-vDIDN0L3eho8KXP2w3sjzE-n3O6swrw0@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=UeBGlJ4rpF1JKjAOTsJ+xr0DOaDVWMVQGhC+khUa9Xw=;
        b=inRrB8cGkxG50AfE1tjUdklkPyJRxlhSgcMgLqRUKydbl2/8Yo8zBjHpTdHeEFKOaZ
         9PhYAUEN8ExESmMrmoypeXD0l4BL8uzasAdUbWwcc0Qui8OInS22QMgZeE3RS6pXFP/H
         0O7bzeHAiBnciz7h+IfBvNPvnARPQcYQPrARM=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi all,

In securing XMPP (Jabber, IM) servers, what role does an iptables
firewall play in practice.

The XMPP community tend to think of TLS communication channels only
and thus iptables becomes somewhat redundant. That is, the XMPP server
should handle authentication, deep packet inspection, IP address
filtering and so forth. (Of course this is a simplistic view given a
firewall helps prevent unprotected services hosted by the XMPP server
from being exploited and it helps control DoS etc)

However, are XMPP servers deployed in practice like this, where all
that is required of the firewall is opening port 5222 for
client-to-server communication and port 5269 for server-to-server
communication where all traffic is over TLS.

I'd imagine that some enterprises want to inspect at the firewall (or
even by IDS) layer-7 packet payloads. For example, ensure a user with
a JID of xyz@jabber.org cannot send packets through the firewall or a
particular malware signature or malicious Web URL that is embedded
with IM conversations is blocked. In such scenarios, is it best
practice to remove the TLS option and thereby loosing some proof of
identify (certificates) in favour of deep packet inspection?

Are there scenarios where an enterprise that is geographically spread
who use VPN's such that they do not require TLS encryption on the XMPP
servers? Rather, they are content that their VPN tunnel is providing
adequate security coupled with DPI (Deep Packet Inspection) of the
XMPP packets and layer 3 and 4 filter also at the firewall?

While XMPP servers such as Openfire have TLS functionality end-to-end,
are these used in practice by security administrators or is some of
the communication desired in the clear for DPI.

Presumably two XMPP servers that belong to two different enterprises
would not share a VPN channel but use TLS enabled on the XMPP servers
instead.

Would there be scenarios where xmpp clients are not allowed to connect
to the XMPP server except through a HTTP proxy (Perhaps the XMPP
server ports are not externally accessible). In that case I presume
one could use iptables to inspect the XMPP traffic not just at layers
3 and 4 but some rudimentary l-7 filtering.

While I understand that layer 7 filtering should really be left to
application specific filters, iptables has some functionality with its
"String Match", "U32 Module" and its "L-7 Filter", so in theory at
least, its a sensible thing to do, provided there wasn't many iptbales
rules requiring layer 7 filtering.

Any feedback on personal experiences/scenarios, is greatly welcomed.
regards,
Paddy.
