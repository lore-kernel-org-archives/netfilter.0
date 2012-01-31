From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Concurrent netfilters
Date: Tue, 31 Jan 2012 01:28:21 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1201310127330.20597@frira.zrqbmnf.qr>
References: <CAN9nwp7_EorcWaCuyHg64iuZf5_8EWYQ+kYFMkui3CK2k4rJRg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAN9nwp7_EorcWaCuyHg64iuZf5_8EWYQ+kYFMkui3CK2k4rJRg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Zage <djzage@gmail.com>
Cc: netfilter@vger.kernel.org

On Tuesday 2012-01-31 00:46, David Zage wrote:

>Has there been work on netfilter to take advantage of multiple cores
>(e.g., concurrent packet processing)?

Filtering runs on the same core as networking gives us. Therefore, 
consult with General Networking for RPS and RFS.
