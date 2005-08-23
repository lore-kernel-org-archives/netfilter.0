From: "Ruben Cardenal" <ruben@ruben.cn>
Subject: RE: ROUTE  woes ?
Date: Tue, 23 Aug 2005 22:34:08 +0200
Message-ID: <7257.99594442851$1124829450@news.gmane.org>
References: <200508231529.25465.rob0@gmx.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200508231529.25465.rob0@gmx.co.uk>
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
To: 'iptables' <netfilter@lists.netfilter.org>

> >   a) Apply patch-o-matic against the iptables source
> >   b) Compile and install iptables
> >   c) Recompile your kernel to generate the ipt_ROUTE module (the
> > prior iptables configuration will add it to your kernel tree).
> 
> If all netfilter drivers were built as modules, is an entire compile /
> reboot necessary? Can you just get away with a "make modules" (and
> "make modules_install") if the POM drivers are the only thing you're
> changing?

  Where did I say reboot, dude? :) When you say "recompile your kernel" you
know you are refering to "make the needed changes, issue the needed actions"
:) If we needed a reboot for everything, we would be called windows :P

  Regards,

- Ruben



