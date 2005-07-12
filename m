From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: mport or multiport?
Date: Tue, 12 Jul 2005 14:48:12 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0507121446010.5529@yvahk01.tjqt.qr>
References: <3115d56e05071203266e32e178@mail.gmail.com>
	<1121165249.5328.34.camel@anduril.intranet.cartel-securite.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1121165249.5328.34.camel@anduril.intranet.cartel-securite.net>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Cedric Blancher <blancher@cartel-securite.fr>
Cc: netfilter@lists.netfilter.org


>       --ports port[,port[,port...]]
>              Match if the both the source and destination ports are
>              equal to each other and to one of the given ports.

There are few daemons which bind to the portnumber they are listening on.
BIND could be configured to use a fixed port (e.g. 53) as the source port, and 
thus would be a possible use for --ports, because most destination ports for 
dns are 53, _too_.


