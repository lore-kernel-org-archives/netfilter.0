From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: In practice how are firewalls used to protect IM traffic?
Date: Wed, 16 Jun 2010 10:37:43 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1006161035470.8031@obet.zrqbmnf.qr>
References: <AANLkTiknNHF-vDIDN0L3eho8KXP2w3sjzE-n3O6swrw0@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTiknNHF-vDIDN0L3eho8KXP2w3sjzE-n3O6swrw0@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: paddy joesoap <paddyjoesoap@gmail.com>
Cc: netfilter@vger.kernel.org


On Tuesday 2010-06-15 13:00, paddy joesoap wrote:
>
>I'd imagine that some enterprises want to inspect at the firewall (or
>even by IDS) layer-7 packet payloads.

And I imagine that I prefer my piece of privacy. (Not so much
certificate indentity.)

>For example, ensure a user with
>a JID of xyz@jabber.org cannot send packets through the firewall or a
>particular malware signature or malicious Web URL that is embedded
>with IM conversations is blocked.

The complexity usually warrants a userspace inspection program -
such as the jabber server itself. After all this is an authentication
issue.

