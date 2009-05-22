From: Ivan Petrushev <ivanatora@gmail.com>
Subject: Re: hfsc guide
Date: Fri, 22 May 2009 18:49:53 +0300
Message-ID: <d39744a20905220849y2bd741b9v6ffae0b5c3d59f66@mail.gmail.com>
References: <4A16B5B6.6040902@duet.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :from:date:message-id:subject:to:cc:content-type
         :content-transfer-encoding;
        bh=V+jX935zWSMODqFWEyLlSTRJAIDlSwtU25GW167gJq0=;
        b=Nl0OL99vcJtwaf2dmeaRBi7S0vCkxNgAh62/hT+ro3zNUuqRrqle+chDvQCTyISloW
         6sCmyJDpOd/F8r0urU1IYbISnqVN6xWpaZQ9HuE6KxWAaCN0DwNGeSX7ndRyO6N7XO9c
         7T6mSi9n2lkOW9bKJ3h8oqpC6vhKqRM+5FhWI=
In-Reply-To: <4A16B5B6.6040902@duet.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Fabio Marcone <fabio.marcone@duet.it>
Cc: netfilter@vger.kernel.org

There is lot of HFSQ info around the net, just use google.
Some fine examples:
http://www.cs.cmu.edu/~hzhang/papers/SIGCOM97.pdf - A Hierarchical
Fair Service Curve Algorithm for LinkSharing, RealTime and Priority
Services
https://calomel.org/pf_hfsc.html - Hierarchical Fair Service Curve
(HFSC) of OpenBSD
http://www.openbsd.org/faq/pf/queueing.html - PF: Packet Queueing and
Prioritization
The last two are not linux implementations, but may put some light
into the qdisc itself.

Greets, Ivan
