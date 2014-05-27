From: "vivek.reddykadaru@freescale.com" <vivek.reddykadaru@freescale.com>
Subject: Netlink Events for iptables
Date: Tue, 27 May 2014 08:52:47 +0000
Message-ID: <3f8093c4086d408c962d352879ff3c43@BLUPR03MB407.namprd03.prod.outlook.com>
References: <20140527083359.GA4342@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20140527083359.GA4342@localhost>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter <netfilter@vger.kernel.org>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>


Hello,

Is there any kernel patch available to generate netlink messages for events like add/modify/delete from iptables.

If there is none , will it at least be possible to try create one ?? . As I know there is no specific NETLINK family for iptables as such .

With all the generic nature that iptables provides is it a good approach to start from ground up by defining new NETLINK family and then creating a netlink event system .

If so could you give me some pointers regarding it .

Thanks for you replies 

Thanks ,
K.Vivek
