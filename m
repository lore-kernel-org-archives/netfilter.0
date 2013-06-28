From: Nick Khamis <symack@gmail.com>
Subject: Dabase BAcked IPTables
Date: Fri, 28 Jun 2013 11:01:10 -0400
Message-ID: <CAGWRaZYZnq3bneKNdisrRAfk=9PvKD=cXVWN_b0ySVRMaPw9Dw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=mQVn6XK6+1mFuWzwDUGj6dXZYmC1d1ENO9ZKG4rFSbM=;
        b=pU2Zyai9f1iMjg/fFEoTydAXpmhBcb5DaXfhr+61k6VNQbF4olRcIgy1QgKnECZ1Kf
         rsnMg3hh7kNfaGhKFDnCQUsImwRSC0B+IJlghuNUzAzygngJ7c+Lb+Coq86yk1VcXIGI
         uaGlIFu95fGn0v4zIz5X2FNLbSs9FuaXiXJKGDFuHih/NHDruRGPgFr1wDH2ip/TkTsd
         cZ11v2MSVYGwKJFITsQZDnaxp9Czdf4hpvKseaTafkDDz5i/h2Ba5difRnafm4KxQ7Vw
         36k7kAuOZC79zvhUlre6QUFty23LK1XaQcXI7wuaMXEq2C9fVZt00HaNZ4/hYeecSrD/
         MvMA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter <netfilter@vger.kernel.org>

Hello Everyone,

Is it possible to have a MySQL backed IPTables? What we are trying to
accomplish is having our clients supply us with a mac address (or ip),
and we would let them through our core network. This would be done
automatically on our website i.e.:

* User logs into the website, and provides mac address
* We insert the record in the database as an allow rule...
* Restart iptables?

Kind Regards,

Nick.
