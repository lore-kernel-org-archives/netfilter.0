From: Tugrul Erdogan <h.tugrul.erdogan@gmail.com>
Subject: Steer packages to namespace interfaces inside bridge flow
Date: Mon, 15 Aug 2016 11:11:51 +0300
Message-ID: <CA+whn7S3FPr_fseS2r6Q_jP_xTP55tRXcSxYHt0NiV7Bf4n6rA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:from:date:message-id:subject:to;
        bh=IPN9ZCChyaUWAXEaPQ9OXB3MM2sjgWvqktyDddkr3Sg=;
        b=AbrsOw9qv34BCu0a9Z6MiT7jgdbN3BmhjvKhaM+hP5H2P6+nxipcRuwzp5HAGV4Xtn
         0ZTxVoD8Hp4HBwg5gyLE7shjW42S6Izd+37ST0imUFDg08i17eASy6vMyz5bN1/bJS0n
         O6KLMTiznxtwxPu4nBupsQ/oJLXwWAlKLRSBNKRsylVM1a/93nmqRzewXcrpIiUa6YEr
         BnEXtErsPtKCt7t9tLIHVoeT8FBFjH2N4zSDVHD8Yp0+w4BpD4vWQrODoDsINtDBmEq2
         xv5WyJBhHNvkar+APHMCQyXZsb9Mnh5bFSt4XTa0F5a3UpzL/oFicGR7VrNpTo56ydHq
         vl2A==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi all;

I have been trying to efficiently separate incoming traffic by
destination ip address to unique network namespaces.  Each namespaces
contain separated v-eth peer so I am trying to steer packages to the
v-eth nics on root namespace by destination ip address.

The problem is that I must use bridged interfaces because of I have no
attached ip at the interfaces so I can not use routing table mechanism
to steer packages.

I want to take your opinions about my solution. I am figuring out to
make a patch inside
br_handle_frame_finish( ) function before  br_forward( ) call. With
this modification I will change skb's net_bridge_port struct to
pointed interface so the packages will be steered to desired interface
inside bridge path.

At the same time; I want to get your alternative suggestions which
will be steer packages to network namespaces by their destination ip.

Thanks for your helps.
Kind regards,
Tugrul
