From: George Alexandru Dragoi <waruiinu@gmail.com>
Subject: Re: (no subject)
Date: Tue, 21 Sep 2004 19:43:18 +0300
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <3063e504092109437d76aedc@mail.gmail.com>
References: <1095620074.3098.1.camel@jabbera-laptop> <41503CFC.5030107@pbl.ca>
Reply-To: George Alexandru Dragoi <waruiinu@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41503CFC.5030107@pbl.ca>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

http://www.netfilter.org/patch-o-matic/pom-base.html#pom-base-SAME


On Tue, 21 Sep 2004 09:38:52 -0500, Aleksandar Milivojevic
<amilivojevic@pbl.ca> wrote:
> Michael Barry wrote:
> > I have a bunch of public IP addresses, for example, in the range
> > 192.168.1.100-192.168.1.104.
> >
> > I have a 5 computers on my internal network statically defined from
> > 192.168.0.100-192.168.0.104.
> >
> > I am trying to create a rule where each computer will always map to the
> > same public ip address. For example I did: iptables -t nat -s
> > 192.168.0.100 -j SNAT --to-source 192.168.1.100.
> 
> I'd guess there was also "-A POSTROUTING" in above command?
> 
> > The problem is if I try to do a ping from 192.168.0.100 it correctly
> > gets translated to 192.168.1.100 and the ping goes out, but when the
> > reply comes back there is an ARP request for WHO-HAS 192.168.1.100, and
> > since no-one technically holds this address no reply is ever sent, and
> > the ping reply gets dropped. Does anyone know a solution to this
> > problem?
> 
> This part is strange.  The reply should have been translated
> automatically back to your private range.  I'm not sure if connection
> tracking module is required for SNAT.  It might be.  Try doing "lsmod |
> grep ip" and see if it shows up (you might also send output to mailing
> list, might help somebody to help you).  It is usually automatically
> loaded (even when you don't expect it), but if it isn't, try loading it
> with "modprobe ip_conntrack".
> 
> --
> Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
> Systems Administrator                           1499 Buffalo Place
> Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7
> 
> 



-- 
Bla bla

