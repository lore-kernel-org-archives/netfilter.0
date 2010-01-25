From: paddy joesoap <paddyjoesoap@gmail.com>
Subject: Can iptables control what internal LAN clients can configure the 
	Firewall over UPnP?
Date: Mon, 25 Jan 2010 09:18:12 +0000
Message-ID: <ac5c74141001250118w153c23f6n3ff8bcdb18d16a77@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type;
        bh=HYsJZXK3MoLfq7cXmM+cXK278VZp2byLzly5CCuRYPw=;
        b=F8msxJhg5Ex+le95NBjXyDP6vR/P7oTMFDkcX/zdOy/Fku5n+OW7QJNwh1dSJzAR84
         h4Phh6yyD/Z0V1rhMJ8wmuVN69UPWTvMIvxRQbH0nfk9CzI3MrkZE98ruRnuYY7PmBig
         iiQWcMNfREHPHNKQix/QK00b/VyHqt20FXjAY=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Dear Experts,

Is it possible to control what LAN clients can administer the firewall by UPnP.

I have recently learned that client-to-client filtering will not come
into play for clients on the same LAN as those client packets don't
pass through the firewall.

However, I presume it is possible to filter client-2-firewall on the
LAN side. Presumably packets would traverse the firewall TCP/IP stack
thereby triggering iptables into action.

That is, clientA (IP address) is allowed to communicate directly with
the firewall for UPnP but clientB and clientC are not.

If UPnP is enabled then, iptables will provide some protection as to
what clients can talk to its UPnP ports.

Also, if client-2-firewall on the LAN side is possible, one could
further lock down the firewall to only allow clientA communicate to
port http, https and ssh that may also be open on the firewall. A
defence in depth strategy.

Firewall I am using is WRT54G running dd-wrt. But I guess the question
is open to all kinds of iptables-ready machines, be they standalone
PC's converted to a firewall.

All feedback welcomed.
