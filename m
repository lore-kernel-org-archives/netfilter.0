From: Tib <tib@tigerknight.org>
Subject: Re: Rules not taking effect - 2nd try
Date: Fri, 18 Oct 2002 02:35:55 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0210180231100.1174-100000@altaica.tigerknight.org>
References: <20021018082552.QOKH292.mta03-svc.ntlworld.com@there>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021018082552.QOKH292.mta03-svc.ntlworld.com@there>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: netfilter@lists.netfilter.org


Ok, apologies for self stupidity are owed. I fell prey to the biggest 
blunder of them all: "The Obvious Mistake(tm)". 


DSL connection
|
dsl router (routeable ip)
|
linux box (private ip)
|
internal network (more private ip's)



The dsl IP is the one I was attempting to route, but by the time the 
packet got to the linux box from the router, the routeable ip was already 
mangled to be the linux box ip. So as soon as I put the linux box ip into 
the rule, it worked great and just fine. Only problem is that since it 
goes through double mangling, by the time it gets sent back out to the 
router the dsl router doesn't know where it's supposed to go and loses the 
connection.

So either way, I'm screwed since I've only got one IP. I need a larger 
block in order for this to work right. masquerading just won't cut it. 
Sorry for the headaches everyone.

<EOL>
Tib


