From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: sendto: Operation not permitted
Date: Thu, 30 May 2002 20:55:17 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200205301955.g4UJtIA17159@Networker.rockstone.co.uk>
References: <Pine.LNX.4.44.0205301011270.31451-100000@paix.pilosoft.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <Pine.LNX.4.44.0205301011270.31451-100000@paix.pilosoft.com>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

On Thursday 30 May 2002 3:13 pm, alex@pilosoft.com wrote:

> > This type of ICMP message will be RELATED to an existing TCP connection,
> > therefore it will be allowed through the firewall by the sort of rulset
> > Claudio was using - if you recall, this was:
>
> Ah, I didn't know iptables are smart enough to realize that!

Yes, this is one of the beautiful things about netfilter / iptables - ICMP 
packets are automatically recognised as being RELATED to the TCP packets 
which they're, well, related to.

That's almost a definition of the difference between ESTABLISHED and RELATED 
- ESTABLISHED packets are part of the ongoing TCP communication, whereas 
RELATED ones are things like ICMP messages which say something about the TCP 
link.

Great, isn't it !?


Antony.

