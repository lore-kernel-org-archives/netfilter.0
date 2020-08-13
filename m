From: Reindl Harald <h.reindl@thelounge.net>
Subject: Re: Is it possible to change a chains default policy when rules are
 already present?
Date: Thu, 13 Aug 2020 14:48:14 +0200
Message-ID: <27311b7d-1192-3c01-3398-bcaa34856ffe@thelounge.net>
References: <AM0PR06MB4628C196EBABF0FD53AA8006C5430@AM0PR06MB4628.eurprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AM0PR06MB4628C196EBABF0FD53AA8006C5430@AM0PR06MB4628.eurprd06.prod.outlook.com>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andreas Hoefler <andreas.hoefler@hitachi-powergrids.com>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>



Am 13.08.20 um 14:28 schrieb Andreas Hoefler:
> I have a chain with default policy drop. 
> I would like to first have the default policy set to accept, then add rules and later change it to drop. 
> Is this possible?

iptables -t <table> -P <CHAIN> ACCEPT
iptables -t <table> -P <CHAIN> DROP
