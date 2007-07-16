From: Thomas Jacob <jacob@internet24.de>
Subject: Re: Block LAN DHCP broadcast
Date: Mon, 16 Jul 2007 17:30:05 +0200
Message-ID: <1184599806.17688.105.camel@localhost>
References: <3130eec50707160652r7fe3285amfafc695b45ee4800@mail.gmail.com>
	<1184595437.17688.72.camel@localhost>
	<3130eec50707160738o418b7a9m43f68af0c6a9afe4@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <3130eec50707160738o418b7a9m43f68af0c6a9afe4@mail.gmail.com>
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
To: netfilter@lists.netfilter.org

On Mon, 2007-07-16 at 08:38 -0600, Gnarlodious wrote:
> Thanks for the quick response. Not sure I understand all of that...
> Yes, this LAN is all on one IP range. The routers are all connected
> with ethernet.
> 
> I don't want to block client computers, but I understand that if I
> drop DHCP ports 67 and 68 to and from other routers then DHCP will be
> handled by the router the computer is connected to. Is that right?

AFAIK, DHCP request aren't usually passed on by (Linux) routers
(Pseudo-UDP/IP-Packet to 255.255.255.255/FF:FF:FF:FF:FF:FF Port), and if
they were, you could probably simply stop them  by filtering everything
to udp
destination port 68. What makes you think that your router passes
on DHCP requests?

On the contrary, one usually does have to put in
a bit of effort to allow dhcp over routers (=> dhcp relay)...




