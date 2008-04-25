From: "Bradley Kite" <bradley.kite@gmail.com>
Subject: DNAT, and finding out original destination IP?
Date: Fri, 25 Apr 2008 12:06:23 +0100
Message-ID: <e97f32c10804250406ve0f4b5dx2d1ca01f5dae9f84@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
        bh=6HTGSeoh4VtUdYVVhNk97fRrykpcSPYqw1xzzV2I698=;
        b=F4HYH6jW914+7DHS8E0oiQXr1cylCgDhReXqAFVoAFnMMr94uccc1lPFGHJ/psVptr463EMj9wMZRzQLgANtW56aNShC4RGCJFoAywltSly/wt+ZptKUWe8sCtrO37f7GZqNaSxgD9AtFBjJHOffVpTeCfrvFvj4DhXu0eO9eQc=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi everybody.

I'm using DNAT to transparently redirect TCP connections to a local
application which is listening on a port for new connections.

From within my application, I'd like to be able to find out the
original destination IP address of the packet/connection, before it
got DNAT'ed.

I've read about the API's within libnetfilter_queue and
libnetfilter_conntrack, but cannot find any thing about looking up
this information directly within the kernel NAT tables.

The best way I can think of at the moment is to use libnetfilter_queue
so that the application gets a copy of the SYN packets before they get
DNAT'ed and stores the source IP/port in its own lookup tables so that
once it accept()'s the connection it can then reference the lookup
table to find the original destination IP.

Is there a better way that I should be doing this? Is there a way I
can get access to the NAT/DNAT tables within the kernel so that the
application can query this information directly without having to
maintain its own copy?

Any help/ideas or pointers to further reading would be very much appreciated.

Regards
--
Brad.
