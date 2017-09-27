From: Will Sewell <me@willsewell.com>
Subject: Why are two hash tuples stored for each connection in the connection
 tracking system?
Date: Wed, 27 Sep 2017 08:52:45 +0100
Message-ID: <CAKMCqEL=UCUUn2=Ke7-4uJo-fij80k7u13zEOsHNh_AP_p2EKQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=willsewell-name.20150623.gappssmtp.com; s=20150623;
        h=mime-version:sender:from:date:message-id:subject:to;
        bh=4/HTKB0CKqOBtKXgp0tqC26HJCCtDb+2RBTPAK4o+vU=;
        b=1PS3lF14OyRmBNaHB/nhm2QN/vcQIzHVx0gTXqN1qFcEsETmmLWi1YTxl0Bgl7E4eq
         EhlAHDU6cIzAnIGu12ERKbTxWYhbpMSAbv6W7dmi8mv4SMbOuUsMzLflwANrDZmuTqEB
         SAOilehcEGKR6SGCS8ePn/l1bD8TS45sHR+gS5yY95SUV8+yHslXLEsmJAcM6PJvMkKy
         NynoqyADz0hk7g6891HSdkZsM9wRXMRaLdORDPjmPIXH4j4ibqhVuMgIoBQx1Qy2OtBI
         nOoZ3vCxpT8K2/RMZmscrtFEFVyyDDVGTdIRZV3O1NQovpkP8sPJD69tFhgGrYFC0L9n
         uObg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

The connection tracking system stores one hash tuple of layer 3/4
information for each packet's original direction, and one for the
reply direction. The are embedded in the conntrack struct which stores
the actual connection state.

I'm curious why this is. Is it so connection state can be looked up
with only partial information, e.g. only the reply direction
information? If that's true, then in which cases do we only have
partial information? My assumption would be that information on both
direction would be available in the packet.

I'm also curious why these hash tuples are stored in a doubly linked
list, rather than a singly linked list. Is it just for more efficient
deletion?

Thank you,
Will
