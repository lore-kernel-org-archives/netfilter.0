From: Stefan Certic <stefan@cs-networks.net>
Subject: dst nat failover only while port is closed
Date: Fri, 13 Mar 2015 04:15:55 +0100
Message-ID: <CAPhFQCvTHxvx+aExK1DkxutqONq-67ypApKUowQdFyj6fvbvfA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs-networks.net; s=csnetworks;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=wEr4m49xQv3nc99IDLg0mVGzj3jJvBw4ZrIhiDZLslw=;
        b=e6TC8U+m1iMVuLp4axkIrchg58xdcymNSLF0Bd6HjvrDNn1GawCc2tlifylPGAgQ+c
         8H9RKKcZYz99sAznaGf1yTWGe7VVdfysr+OyJ1lwdj7bvObgJBKMiN8vhxR+K6uySdU+
         CAcTb2qwGn7ddkxWTzLPEhkKRdrswAhXiIYd8=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello World :)

I am interested in following scenario with iptables (if such is possible).

Setup:

1. Ext Firewall nats port Z to server A.
2. Application X listens on port Z of server A
3. It happens that application X crashes for a couple of seconds and
get's restarted by a monit.

Question:

Is it possible to perform Nat on server A itself, to server B, that
will took place only until application is restarted (only while no one
is listening on port Z) otherwise expose port Z to back to
application.

Reason:

The idea is to provide a failover, uninterrupted service even when app
crash occurs.

P.S. Please without "why you are this and that..." questions instead
suggestions. I need it the way i need it, questions are if it is
possible, and, if yes, how :)

P.P.S. It's tcp traffic, non persistant connections.

Thanks for help in advance!

Best Regards,

-- 
Stefan Certic
Chief Technology Officer

stefan@cs-networks.net
--------------------------
CS Network Solutions Limited

84 High Street, Southall, Middlesex, UB1 3DB. United Kingdom


London Switchboard: +442071933539
Belgrade Operations: +38112448755

Web: www.cs-networks.net
