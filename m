From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: iptables and wifi access point
Date: Sun, 27 Jul 2003 23:10:38 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030727231038.55c31829.arnt@c2i.net>
References: <3F242F3C.9D1E2BEA@optonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F242F3C.9D1E2BEA@optonline.net>
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

On Sun, 27 Jul 2003 15:59:56 -0400, 
Jason <arnjuka@optonline.net> wrote in message 
<3F242F3C.9D1E2BEA@optonline.net>:

> Hi all, this is my first time writing here.  Here goes.
> 
> I'm setting up an accesspoint with a redhat9 box and a prism 2 netgear
> wifi card.  The box has the wifi adapter and two wired nic adapters.
> The wifi is for the access point and all the clients that will connect
> to it, one nic is for the dsl, and the other is for wired machines on
> the network.
> 
> I wanted to use iptables and cbq {i think} for routing/firewalling and
> bandwidth limiting and shaping.  If anyone has done this before and
> maybe has sample config files, or if you know any good docs to read
> please point me in the right direction.
> 
> I want to make the network as secure as possible and as accessable as
> possible.  Sorry for asking such a broad question, I'm just hoping
> that someone has done this already, or someone might have some ideas
> for me.

..http://shorewall.net/ ,  http://lartc.org/ ,  http://webmin.com/ ,
my http://fmb.no/ipcop/setup-cbq-0.0.4.tar.bz2 really needs a gui.

-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.


