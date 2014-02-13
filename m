From: Eric Leblond <eric@regit.org>
Subject: Re: iptaccount vs nfacct
Date: Thu, 13 Feb 2014 09:55:38 +0100
Message-ID: <1392281738.17306.91.camel@ice-age2.regit.org>
References: <1392252442.30958.596.camel@worklian>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1392252442.30958.596.camel@worklian>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: bob@computerisms.ca
Cc: netfilter@vger.kernel.org

Hello,

On Wed, 2014-02-12 at 16:47 -0800, Bob Miller wrote:
> Hello,
> 
> to present day I have been using the ACCOUNT function in xtables-addons
> to do bandwidth accounting.
> 
> I have spent some time poking around on the net trying to figure out
> exactly what nfacct does, and it seems this tool could also be used for
> bandwidth accounting.

Yes, it is the objective of this tool.

> But I am having trouble finding anything regarding the wisdom of such a
> migration.  Are there documents, or would someone be willing to offer
> some opinions, pertaining to the benefits or detriments of switching
> over? 

I wrote this some time ago to explain how you can connect nfacct and
ulogd2:
https://home.regit.org/2012/07/flow-accounting-with-netfilter-and-ulogd2/
One advantage of nfacct combined to ulogd is that you can use ulogd2
connector to graphite:
https://home.regit.org/2012/12/visualize-netfilter-accounting-in-graphite/

One advantage of nfacct is that it is maintained by the Netfilter
project so it works in vanilla kernel and you thus don't need to build
anything if your distro provide the nfacct tool.

BR,
-- 
Eric Leblond <eric@regit.org>

