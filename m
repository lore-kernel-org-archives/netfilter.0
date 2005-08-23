From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: ROUTE  woes ?
Date: Tue, 23 Aug 2005 15:29:25 -0500
Message-ID: <200508231529.25465.rob0@gmx.co.uk>
References: <20050823201959.3AC9E49EE@sorry.no-ip-here.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050823201959.3AC9E49EE@sorry.no-ip-here.net>
Content-Disposition: inline
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

On Tuesday 2005-August-23 15:20, Ruben Cardenal wrote:
> http://www.netfilter.org/patch-o-matic/pom-extra.html#pom-extra-ROUTE
>
>   In order to be able to use it, you must download also iptables and
> patch-o-matic and compile all the needed stuff. The order is
>
>   a) Apply patch-o-matic against the iptables source
>   b) Compile and install iptables
>   c) Recompile your kernel to generate the ipt_ROUTE module (the
> prior iptables configuration will add it to your kernel tree).

If all netfilter drivers were built as modules, is an entire compile / 
reboot necessary? Can you just get away with a "make modules" (and 
"make modules_install") if the POM drivers are the only thing you're 
changing?

I'd like to play with POM sometime, but I don't reboot if I can avoid 
it. :)
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

