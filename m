From: Martin Josefsson <gandalf@wlug.westbo.se>
Subject: Re: iptables -m owner target problem kernel 2.4.20
Date: 02 Apr 2003 13:27:26 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1049282846.25148.14.camel@tux.rsn.bth.se>
References: <200304020014.32757.cirrus@the-penguin.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200304020014.32757.cirrus@the-penguin.org.uk>
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
To: cirrus <cirrus@the-penguin.org.uk>
Cc: Netfilter <netfilter@lists.netfilter.org>

On Wed, 2003-04-02 at 01:14, cirrus wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Hello there
> I've just upgraded my main server to 2.4.20 using iptables v1.2.6a
> With 2.4.19 I used to be able to do a:
> iptables -t nat -I POSTROUTING -m owner --uid-owner 501 -o ppp0 -j SNAT 
> - --to-source xxx.xxx.xxx.xxx.xxx
> just fine.
> With the 2.4.20 I get:
> iptables: Target problem

Recompile iptables against your new kernel and it'll work.

-- 
/Martin

