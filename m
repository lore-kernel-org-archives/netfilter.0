From: Richard Horton <arimus.uk@googlemail.com>
Subject: Re: Can iptables control what internal LAN clients can configure the 
	Firewall over UPnP?
Date: Mon, 25 Jan 2010 09:23:26 +0000
Message-ID: <56378e321001250123h311223e4o7d53f3e48cfc6f78@mail.gmail.com>
References: <ac5c74141001250118w153c23f6n3ff8bcdb18d16a77@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type;
        bh=A82c7kUtCGlg2vnSsG+6+Txt5WiewI1nvKADpTA9wyQ=;
        b=xJoUbXn6Edf9YjXBaG6LX5ssDN+VIHPRDQnwadlCGewpfzJdEaCOidZadgREr6/DZA
         Tx2EV/qZcgHvyU/j0qEAHPU6cT+wMWt0Y8tVIRfyrQkAqUB8sF6Z45pKoWh6YpNXTeKg
         9IcihWcteKFCj940nvdAhRrkHX4TMhh3ORxdA=
In-Reply-To: <ac5c74141001250118w153c23f6n3ff8bcdb18d16a77@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: paddy joesoap <paddyjoesoap@gmail.com>
Cc: netfilter@vger.kernel.org

2010/1/25 paddy joesoap <paddyjoesoap@gmail.com>:
> Dear Experts,
>
> Is it possible to control what LAN clients can administer the firewall by UPnP.

Yes, just add the appropriate rule into the input chain (the traffic
target is the firewall itself...)


-- 
Richard Horton
Users are like a virus: Each causing a thousand tiny crises until the
host finally dies.
http://www.solstans.co.uk - Solstans Japanese Bobtails and Norwegian Forest Cats
http://www.pbase.com/arimus - My online photogallery
