From: Ingo Oeser <netdev@axxeo.de>
Subject: Re: Netfilter and IPSec
Date: Tue, 15 Apr 2008 18:54:43 +0200
Message-ID: <200804151854.44347.netdev@axxeo.de>
References: <480423CD.3060707@lasige.di.fc.ul.pt> <alpine.LNX.1.10.0804151322470.13202@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.1.10.0804151322470.13202@fbirervta.pbzchgretzou.qr>
Content-Disposition: inline
Sender: netdev-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Engelhardt <jengelh@computergmbh.de>
Cc: =?utf-8?q?F=C3=A1bio_Souto?= <fsouto@lasige.di.fc.ul.pt>, netfilter@vger.kernel.org, netdev@vger.kernel.org

Jan Engelhardt schrieb:
> It kinda brings me the question why the ipsec transformation is
> not done with an xtables target instead; that would also give
> handy access to connection tracking if needed.

And simplify firewalling A LOT :-)

BTW: Anybody has a working ipsec match these days or is this known broken?


Best regards

Ingo Oeser
