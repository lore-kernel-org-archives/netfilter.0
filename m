From: Sven-Haegar Koch <haegar@sdinet.de>
Subject: Re: dazed and confused about building
Date: Sun, 13 Jul 2003 06:46:41 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.56.0307130643500.28644@space.comunit.de>
References: <87u19rp5sb.fsf@tapsellferrier.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <87u19rp5sb.fsf@tapsellferrier.co.uk>
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
To: Nic <nferrier@tapsellferrier.co.uk>
Cc: netfilter@lists.netfilter.org

On Sun, 13 Jul 2003, Nic wrote:

> I have a debian box with a 2.4.21 kernel on it. I was hoping to setup
> source NAT. debian comes with iptables 1.6. I realize that's out of
> date but I thought it would do "for now".
>
> >From reading the various bits of documentation on netfilter I _think_
> that I have to set some the netfilter options in .config. I'm not sure
> about that because menuconfig doesn't offer an interface and I found
> this in Documentation/Changes:

menuconfig DOES offer an interface

- make menuconfig
- go to "Networking Options"
- select "Network packet filtering (replaces ipchains)"
- go down to "IP: Netfilter Configuration"
- select the netfilter/iptables parts you want

c'ya
sven

-- 

The Internet treats censorship as a routing problem, and routes around it.
(John Gilmore on http://www.cygnus.com/~gnu/)

