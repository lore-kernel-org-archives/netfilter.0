From: "Stephan Higuti" <higuti.sam@gmail.com>
Subject: Problems with ImapS port.
Date: Wed, 20 Feb 2008 16:46:24 -0300
Message-ID: <3da957060802201146v60772ab2p4d9a3768488c3dad@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
        bh=0T6Vaa+mD9Ny0GHZ/EcJtDzkUX7Ehu6hv1HP3YnGvkE=;
        b=RRHYSBxhb6TyxdNKn889FcKBi6npvsepeDvnUnRD+4iUYLtj0Y2MP7wh3jfkwC+n/OHitrj7GJnn3SilRnqYRD7cqRhkSQotUS8/uMjFKSz8kFk6xM+kQAv18CqCXQ7xMLFDnA1N0hTMCHDmyU7QbJh0LwhQa9wnd0EyDG+z4lU=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello, I'm with a little problem using iptables, I'm trying to accept
the port 993 and 465 for use IMAP on Gmail.
But, when I pass the nmap, give me this:

465/tcp  closed smtps
993/tcp  closed imaps
995/tcp  closed pop3s

And the rulez:

iptables -A INPUT -p tcp --dport 993 -j ACCEPT
iptables -A INPUT -p udp --dport 993 -j ACCEPT
iptables -A INPUT -p tcp --dport 465 -j ACCEPT
iptables -A INPUT -p udp --dport 465 -j ACCEPT
iptables -A INPUT -p tcp --dport 995 -j ACCEPT
iptables -A INPUT -p udp --dport 995 -j ACCEPT

And when I list the rulex with IPTABLES -L

ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:imaps
ACCEPT     udp  --  anywhere             anywhere            udp dpt:imaps
ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:smtps
ACCEPT     udp  --  anywhere             anywhere            udp dpt:465
ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:pop3s
ACCEPT     udp  --  anywhere             anywhere            udp dpt:pop3s

Anybody can help me with this? =D

Best Regards,

Stephan

-- 
---------------------------------------------------------------------
Stephan Higuti
MSN: higutisam@hotmail.com
Email: higuti.sam@gmail.com
---------------------------------------------------------------------
