From: Lore <skizzo82@yahoo.com>
Subject: Re: Destination_IP Field in packets coming from QUEUE
Date: Sun, 2 Oct 2005 20:58:30 +0200 (CEST)
Message-ID: <20051002185830.61776.qmail@web52811.mail.yahoo.com>
References: <Pine.LNX.4.61.0510021448040.7084@filer.marasystems.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0510021448040.7084@filer.marasystems.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

-- Henrik Nordstrom <hno@marasystems.com> ha scritto: 

> May I ask yhat subject are you writing about?
> 
> Regards
> Henrik
> 

For shure :)
I'm writing (tonight/tomorrow it will be finally
tested on different networks) a daemon for linux that
keeps tcp connections alive on multihoming devices.
It works as follows: when a linux box with multiple
network interfaces creates a tcp connection with
another host (both running the daemon), for instance
via an ethernet adapter, it can leave the current
media and keep up the tcp connection using one of the
others adapters available (fiber, wireless, gprs) or
(in the case of simple ip reconfiguration) it can
simply move from an access point with a particular
subnet to another (with a completely different
subnet), without interrupting the connection.

I hope to move the code (that at the moment uses
LibIPQ) to kernel to increase performances.
When I will degree the project will be released under
the GPL 2 License

What do you thing about it? I just wanted to do
something that wasn't destined to end on shelf
collecting dust... Hope it will be helpfull.

Lore


	

	
		
___________________________________ 
Yahoo! Mail: gratis 1GB per i messaggi e allegati da 10MB 
http://mail.yahoo.it

