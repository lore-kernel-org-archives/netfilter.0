From: Bernhard Bock <mailinglists@bock.nu>
Subject: Re: conntrackd failover works partially
Date: Wed, 23 Jul 2008 10:51:48 +0200
Message-ID: <4886F124.2090501@bock.nu>
References: <488064DD.5080509@bock.nu> <alpine.LNX.1.10.0807181212331.12734@fbirervta.pbzchgretzou.qr> <488075F1.80901@bock.nu> <4880891C.4090004@netfilter.org> <4880A6BA.6030007@bock.nu> <4883DA4D.4080906@netfilter.org> <48849BBE.5060403@bock.nu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48849BBE.5060403@bock.nu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

Hi,

sorry that I repost this topic, but I'm really stuck and I don't find 
anything helpful in the net.

Bernhard Bock wrote:
> Now I get a lot of the following entries in syslog in addition to the 
> INVALID packets:
> conntrack-tools[21319]: cache_wt crt-upd: Invalid argument
> conntrack-tools[21319]: cache_wt update:Invalid argument

Can somebody help me interpreting this messages? What does go wrong here?

This happens after I do a graceful failover between two connection 
tracking firewalls synchronized by conntrackd 0.9.7.

best regards
Bernhard


