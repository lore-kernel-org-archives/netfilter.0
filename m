From: "Raj Wurttemberg" <rajw@c64.us>
Subject: RE: Upgrade Iptables...
Date: Mon, 16 Sep 2002 09:09:20 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000901c25d82$4b822ff0$d201a8c0@hornet>
References: <39778BFB9C25BA429794B15B50AEC781045434@server-dcms>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <39778BFB9C25BA429794B15B50AEC781045434@server-dcms>
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
To: 'Didier Hung Wan Luk' <DidierH@frci.net>, 'Netfilter Mailing List' <netfilter@lists.netfilter.org>

> I have redhat 7.3 with kernel linux-2.4.18-10 and I want to 
> use iptables 1.2.7a.
> 
> When I compile iptables do I need to recompile my kernel to 
> use the 1.2.7a version of iptables?

Hello Didier,

You will want to apply the patch-o-matic to your kernel and then
recompile your kernel prior to compiling and using the 1.2.7a version of
iptables. I could be wrong, but I do not think that the default RedHat
kernel has all of the necessary iptables modules.

/*Raj*/



