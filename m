From: George Roussos <g.roussos@dcs.bbk.ac.uk>
Subject: libnetfilter_queue hardware checksum
Date: Wed, 21 Jul 2010 20:34:06 +0100
Message-ID: <8313E6BB-BF58-46EE-86B1-9073CC79E1C9@dcs.bbk.ac.uk>
Mime-Version: 1.0 (Apple Message framework v1081)
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,

I wonder if it is possible to use hardware checksuming (with a network card that supports it of course) with a user-space packet modification program using libnetfilter queue. I can see some references on how to do this from inside the kernel but have not been able to figure out if this is possible from user space, and how.

I am interested in both UDP and IP checksuming by the way.

Many thanks,

George