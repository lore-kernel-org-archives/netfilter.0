From: cbaker@bbbscentralohio.org
Subject: Re: To REDIRECT, DNAT or something else
Date: Tue, 26 Nov 2002 09:40:35 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DE34193.8401.55E2B99@localhost>
References: <F168SlVviFluZw0VclX000110a1@hotmail.com>
Reply-To: cbaker@bbbscolumbus.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <F168SlVviFluZw0VclX000110a1@hotmail.com>
Content-description: Mail message body
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

I know that this doesn't really answer the question. But the best 
strategy is to have a firewall all by itself. If you have an old 486 
around, you could try Coyote Linux <coyotelinux.com>. It boots and 
runs off a floppy.

On 25 Nov 2002 at 18:43, Joel Linuxdude wrote:

> I just had a small question (maybe dumb, I dont care).
> 
> My firewall PC is also my DNS server (caching), gateway to
> the internet via cable modem, web server, ftp server and
> later my proxy server.
> 
> Do I need to REDIRECT packets coming into eth0 (from the
> cable modem) to the firewall itself?? I know, the packets
> are suppose to go right to INPUT chain but people over
> the internet can no longer access my WWW, FTP or TELNET
> daemon. I fear A) The cable modem company are blocking
> the use of servers or B) I screwed up somewhere in my
> firewall script.
> 
> HOW CAN I MAKE SURE ALL TCP/UDP PORT 20,21,22,23,80,443
> GO FROM CABLE MODEM ON ETH0 TO MY FIREWALL AND NOT GET
> FORWARDED OVER ETH1 TO MY LAN?
> 
> Thank you!
> 
> _________________________________________________________________ Add
> photos to your messages with MSN 8. Get 2 months FREE*.
> http://join.msn.com/?page=features/featuredemail
> 
> 
> 

Chris Baker -- technical specialist
614-839-2447x108
cbaker@bbbscolumbus.org
Big Brothers Big Sisters of Central Ohio
www.bbbscolumbus.org


