From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: [IP ?] what ip must be filtered ?
Date: Thu, 11 Dec 2003 11:23:27 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312111123.27777.Antony@Soft-Solutions.co.uk>
References: <00d701c3bfc4$eabdac20$02fea8c0@ALESK>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <00d701c3bfc4$eabdac20$02fea8c0@ALESK>
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

On Thursday 11 December 2003 8:58 am, Tanen wrote:

> Hello,
>
> I'm confused, i try to set up my Firewall, with iptables sure :)
> The problem, an easy problem to solve for you, but a big for me, it's the
> next :
> I have an Dedicated server, Linux, on an internal local network, who have
> as ip 192.168.0.1, and other puters have 192.168.0.2 *.3 *.4 etc ... BUT
> the dedicated box, use the reuters of my connection to be connected to
> internet. This reuters have as ip 192.168.0.100, and my external ip have as
> ip 63.*.*.*, my problem is to know, WHAT ip i must filter, to prevent of
> any attack or hack, the reuters is forwarding the needed port (http,
> pop/imap/smpt) to the dedicated box. All work fine sure. But what IP i must
> filtered, and authorised for have my firewall working fine ? actualy when
> i'm filtering my local ip, or my external ip, my mail server, isn't getting
> any mail from www, someone can help me please ?

The simplest way to do what you want is not to think about IP addresses so 
much as which interface they're connected to.

Let's assume that your firewall has 192.168.0.100 on eth0 (private, internal) 
and 63.x.y.z on eth1 (public, external)

Then a good start to your ruleset would be:

iptables -P FORWARD DROP
iptables -A FORWARD -i eth0 -o eth1 -j ACCEPT
iptables -A FORWARD -i eth1 -o eth0 -m state --state ESTABLISHED,RELATED -j 
ACCEPT
iptables -A POSTROUTING -t nat -o eth1 -j SNAT --to 63.x.y.z

An improvement on the above rules would be to be more restrictive about what 
traffic you allow from internal clients to the Internet, however this is a 
start.

If you don't understand anything about the above rules feel free to ask again.

Antony.

-- 
It is also possible that putting the birds in a laboratory setting 
inadvertently renders them relatively incompetent.

 - Daniel C Dennet

                                                     Please reply to the list;
                                                           please don't CC me.


