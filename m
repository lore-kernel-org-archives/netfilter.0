From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Problems with Portforwarding -- Loopback problems---
Date: Tue, 16 Mar 2004 17:11:45 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403161711.45869.Antony@Soft-Solutions.co.uk>
References: <405624A2.60906@imperium-noctem.de> <200403161637.39934.Antony@Soft-Solutions.co.uk> <40573025.9050009@imperium-noctem.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40573025.9050009@imperium-noctem.de>
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
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

On Tuesday 16 March 2004 4:49 pm, Ronny Fauth wrote:

> Antony Stone wrote:
> >>Test --> Router/Gateway ---> Inet --> Router/Gateway --> Test2
>
>        192.168.0.2 ---> 192.168.0.1 ---> dynamicIP, the IP i'm using at
> the Internet ---> 192.168.0.1 ---> 192.168.0.3
>
> i want to forward some ports, port 192.168.0.1:4711 should be forwarded
> to 192.168.0.2:4711, well this works, but i want to try it..... so i'm
> typing on a browser on 192.168.0.3 "http://xxx.dyndns.org:4711/" and this
> doesn't work, if i'm typing "http://192.168.0.2:4711" it works, this is the
> major problem i have.

Think about the replies.

192.168.0.3 sends a packet to xxx.dyndns.org, that gets translated by 
192.168.0.1 into 192.168.0.2

192.168.0.2 receives the packet, sees that the sender is 192.168.0.3, and 
replies.

Therefore 192.168.0.3 sent a packet to xxx.dyndns.org and got a reply from 
192.168.0.2.   It can't handle this, so fails.

(I'm assuming in all the above that xxx.dyndns.org does not resolve to 
192.168.0.2, of course).

Also see http://www.netfilter.org/documentation/HOWTO/NAT-HOWTO-10.html

Regards,

Antony.

-- 
If the human brain were so simple that we could understand it,
we'd be so simple that we couldn't.


