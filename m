From: paddy joesoap <paddyjoesoap@gmail.com>
Subject: Re: In practice how are firewalls used to protect IM traffic?
Date: Thu, 17 Jun 2010 13:19:22 +0100
Message-ID: <AANLkTimghAviOcPx9YKNb3IZ2hajHtu7-mpi_HOepcI5@mail.gmail.com>
References: <AANLkTiknNHF-vDIDN0L3eho8KXP2w3sjzE-n3O6swrw0@mail.gmail.com>
	<alpine.LSU.2.01.1006161035470.8031@obet.zrqbmnf.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:content-type;
        bh=HI5VJGFeHCTF1nJ4u2W4qic8YejP8rvfAXjHrmF6jUo=;
        b=BeTDWTehDs2PQUhopZ1Uep5/olvuEbKHVJ/Bve5ADrkk0O7MAcV5KgZz/uKDl5Sgt2
         AF4bD0livUvBPY6E+DbuKwz/0fmdgUp6LVbCIBLDSY//mxKkBt5Go2iR6kS0XKclDvHW
         guc6fWueCmqp5TaIHguaL1Ex2aDtzbIvlrt6A=
In-Reply-To: <alpine.LSU.2.01.1006161035470.8031@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi all,

I have taken on board the XMPP administrators views that TLS should
always be used and thus eliminates (or at least minimises) the ability
to perform layer-7 filtering. However, from reading the various XMPP
RFC's called XEP's, I think the there are situations that allow for
DPI and defense in-depth situations using an iptables firewall. Its
not just as simple as opening XMPP service ports and leaving the XMPP
server handle security on its own.

The following discussion is very centric to XMPP and the possible
iptables role beyond port openings. I will try to refrain from asking
such specific protocol questions (in this case XMPP) in the future
that are not core to this forums objectives. However, if anyone has
experience with configuring both XMPP servers and building iptables
configurations that support their protection, I'd like to
hear your comments regarding below.

Serverless IM:
In this scenario we have c2c interactions. My understanding of
XEP-0174 is that communication is unencrypted. Consider a laptop user
(in this case running iptbales on a Linux OS) that wants to interact
with some other client on the local LAN ( i understand it can also
apply to WAN, but not used in practice). The user may have identified
the threat of Web URL phishing and have configured the firewall to
filter our certain URLS or even certain keywords. In this case, the
firewall would help protect the user from other p2p clients from
receiving packets with malicious URL's. This is only a simple example,
but one that demonstrates possibilities. In practice, it would be much
better to have a locally hosted Snort IDS perform content filtering
then dynamically create iptables rules to prevent certain kinds of
traffic.

Server-2-Server Federation:
From reading the XEP-0220, I understand that certificate based TLS
interaction and SASL authentication using the same certificate is not
currently widespread. Thus, the less secure Dialback protocol is used.
Leaving aside the threat of DNS poisoning, am I write in saying that
communications between two servers that do not support TLS are
unencrypted? If this is the case and is fairly common in the wild then
perhaps a firewall in conjunction with an XMPP content filter plugin
could provide a defense in-depth strategy (NIST, PCI-DSS compliance)
to filter out malicious traffic such as SPIM, accidental information
disclosure and so forth. Note, I have seen on the Openfire GUI that
Dialback can be done over TLS. I am not sure why, one would do
dialback over TLS as if they support TLS then perhaps one would best
opt for TLS and SASL External.

External Components:
My understanding is that these components are similar to plugins
except they provide services that interact with the XMPP server over a
TCP communication channel, over port 5275 in the case of Openfire. My
understanding is that currently such external components communicate
over the Jabber Component Protocol defined by XEP-0114. This protocol
as I understand it sends messages in the clear. Consider a locally
hosted firewall on the XMPP server. The firewall, in conjunction with
various XMPP-based filters, could be used to inspect traffic at the
application layer to ensure that malicious traffic is not forwarded to
the external component and/or received on the XMPP server from the
external component.

BOSH over HTTP:
My understanding is that communication can be over HTTP and does not
have to be encrypted.  I presume then that a firewall, Web proxies
such as SQUID and IDS could play a role in adding extra protection.
Also, if a client is embeded with a browser they would require the
http-bind protocol and like BOSH, traffic can be unencrypted.

SASL ANONYMOUS:
I see from XEP-0175 that anonymous SASL provides interaction with
unregistered clients. I see that authentication happens but is the
communication channel afterwards encrypted? If not, a firewall (and/or
IDS) could be used to filter various messages being sent to and from
the XMPP server. This would help compliance with the XEP-0175 best
practice requirement: "Because an anonymous user is unknown to the
server, the server SHOULD appropriately restrict the user's access
...".

The above discussion has been focused on filtering at Layer-7 in cases
were TLS is not used.

DoS:
The XEP-0205 DoS standard requires that traffic connections be
controlled. From the standard, it appears that a firewall is the best
option here regarding IP addresses. Firewalls can filter based on the
number of simultaneous connections and connection attempts within a
given time frame. I haven't seen this kind of functionality at least
in Openfire anyhow. Would XMPP servers take this role in practice? I'd
imagine firewalls are the best option here.

Whitelist/Blacklist IP addresses:
XMPP servers and firewalls can work together to provide defense
in-depth in this scenario. In my opinion this is useful. Consider a
XMPP server that is hosted on a machine that also hosts other servers.
It maybe possible that that machine becomes compromised by a Trojan
that modifies the XMPP server's IP address whitelist. The network
firewall (provided it is not also compromised) would then ensure that
certain IP addresses can and cannot reach the XMPP server. Thus,
defense in-depth is borne out.

Looking forwards to your comments.
regards,
Paddy.

On Wed, Jun 16, 2010 at 9:37 AM, Jan Engelhardt <jengelh@medozas.de> wrote:
>
> On Tuesday 2010-06-15 13:00, paddy joesoap wrote:
>>
>>I'd imagine that some enterprises want to inspect at the firewall (or
>>even by IDS) layer-7 packet payloads.
>
> And I imagine that I prefer my piece of privacy. (Not so much
> certificate indentity.)

ASIDE:
Even if firewalls cannot inspect XMPP traffic at layer-7, the XMPP
server can be configured to log all conversations.
So i'd imagine that some enterprises would log this, perhaps for
regulatory compliance reasons. No privacy :-(

>
>>For example, ensure a user with
>>a JID of xyz@jabber.org cannot send packets through the firewall or a
>>particular malware signature or malicious Web URL that is embedded
>>with IM conversations is blocked.
>
> The complexity usually warrants a userspace inspection program -
> such as the jabber server itself. After all this is an authentication
> issue.

I agree. However, in unencrypted channels their might be a reason to
add defense in-depth to also filter JID's sending messages to the
outside world. From my limited understanding there is a packet filter
plugin for Openfire that can control what JID can contact other JID's.
From what I can tell there is no sense of internal or external groups.
A firewall may provide a way to block certain user JID's from external
access (in total or to certain XMPP servers).

Thanks guy's for your comments to date.
