From: Billy Crook <billycrook@gmail.com>
Subject: Re: In practice how are firewalls used to protect IM traffic?
Date: Tue, 15 Jun 2010 06:22:05 -0500
Message-ID: <AANLkTinSfIfpy-irvVxsCChipmnroPogtCuYXXQ4dGEe@mail.gmail.com>
References: <AANLkTiknNHF-vDIDN0L3eho8KXP2w3sjzE-n3O6swrw0@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:mime-version:received:in-reply-to
         :references:from:date:message-id:subject:to:cc:content-type;
        bh=AWhYALyCg7bmLTDJJwkfH4MyfUnSrwVPlgE1Uz/J08w=;
        b=DGtnCCjQL/pRWjFNnkRmPIk8Xqc3Yt7tjme/A31o4XqK+jEB6+/YekFUcx7qH/0oLv
         gzDC+qEqFNd7MtnJilwvIJXxBymaXxswo9Zc9wIu/oxVVmtuZI5sekfHC8bjyFY9JotE
         L0nknIVhBiNXOT4bWzcjGAtI4MaU8hvz5TBn8=
In-Reply-To: <AANLkTiknNHF-vDIDN0L3eho8KXP2w3sjzE-n3O6swrw0@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: paddy joesoap <paddyjoesoap@gmail.com>
Cc: netfilter@vger.kernel.org

On Tue, Jun 15, 2010 at 06:00, paddy joesoap <paddyjoesoap@gmail.com> wrote:
> In securing XMPP (Jabber, IM) servers, what role does an iptables
> firewall play in practice.

Not a big role in and of itself if by server you mean the process that
accepts connections from clients.

> The XMPP community tend to think of TLS communication channels only

That's an overstatement

> I'd imagine that some enterprises want to inspect at the firewall (or
> ...
> with IM conversations is blocked. In such scenarios, is it best
> practice to remove the TLS option and thereby loosing some proof of
> identify (certificates) in favour of deep packet inspection?

Another option is for that enterprise to maintain a malicious root
certificate internally with which to generate spoofed domain certs on
the fly.  This has been done for https already in several products.
Whether this practice, or outright banning of encrypted outbound
connections is 'best practice' is a matter of opinion.  I would say
no.

> Are there scenarios where an enterprise that is geographically spread
> who use VPN's such that they do not require TLS encryption on the XMPP

How large does an enterprise need to be before the risk of malicious
interception within its own network is as reasonable as on the public
internet?  I don't take for granted that my physical lan is inherently
secure.  End to end encryption will only become more popular.  I was
hoping for it to be managed by the kernels of the endpoints and happen
in the form of automatic IPSec, but running TLS in the client/server
software has proven more attractive to most people.

> While XMPP servers such as Openfire have TLS functionality end-to-end,
> are these used in practice by security administrators or is some of
> the communication desired in the clear for DPI.

My vote goes to end to end, untainted TLS.  Run selinux/apparmor/grsec
on the server if you understand essential server daemons can have
bugs.

> While I understand that layer 7 filtering should really be left to
> application specific filters, iptables has some functionality with its

I'd still leave the filtering to an IDS, and let the IDS att rules to
the firewall in real time.
