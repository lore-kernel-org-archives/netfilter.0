From: "Gilad Benjamini" <gilad.benjamini@gmail.com>
Subject: INVALID state
Date: Wed, 12 Nov 2008 14:08:31 -0800
Message-ID: <491b53e3.2a528c0a.1c10.385b@mx.google.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:subject:date
         :mime-version:content-type:content-transfer-encoding:x-mailer
         :thread-index:content-language:message-id;
        bh=l/pMVA1PwgdIRxLiAP8OsvpWHJXc68wBmQeXCAb4aSw=;
        b=ZUPNDZzUJb2Mum8dq0zN+Zn2WVupuxPCkRRwkHz6Vsbo80vUq4wreMuKtqy1I5Am5g
         E4CPDxlhx+hInqjMvcW6hjR7QAJqhqfZPoyeuKKFMxTVXKGgGumsFygP3kVz6jRn+STM
         wGK21S2pnxrUZ6UbeG/lIOC6y+wofFvQrNaaQ=
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

iptables allows querying for 4 states: NEW, ESTABLISHED, RELATED, INVALID
The first three are pretty obvious.
What exactly are the semantics of the INVALID state ?

My setup involves a firewall on a bridge and a dual-NIC protected machine

Network A -- Protected machine -- Network B -- Firewall

The protected machine has asymmetric routing. A ping arriving via network A
is replied via network B. The reply packet is seen as part of an INVALID
connection.
Same thing happens for a SYN packet from network A, which leads to a SYN-ACK
on network B.

I read somewhere that an ACK packet belonging to a non-existing connection,
for example, will be in NEW state. I was assuming that SYN-ACK will behave
the same.

So when is a connection considered INVALID ?

P.S: By now this is a theoretical question, as the asymmetric routing was a
misconfiguration. Nevertheless, I am trying to understand what happened.

