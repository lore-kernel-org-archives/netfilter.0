From: George Alexandru Dragoi <waruiinu@gmail.com>
Subject: Re: (no subject)
Date: Tue, 21 Sep 2004 20:55:55 +0300
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <3063e50409211055b53fba6@mail.gmail.com>
References: <1095620074.3098.1.camel@jabbera-laptop> <41503CFC.5030107@pbl.ca>
	<3063e504092109437d76aedc@mail.gmail.com>
	<1095787664.1897.23.camel@wolfpack.ljm.dom>
Reply-To: George Alexandru Dragoi <waruiinu@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1095787664.1897.23.camel@wolfpack.ljm.dom>
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

I think he miss some -o $iface in his rule. Otherwise to much stuff
get SNAT-ed :)
And yea, i was thinking on NETMAP. If adding the correct -o wont work,
then the output of route -n and your nat rules might help.


On Tue, 21 Sep 2004 13:27:45 -0400, Jason Opperisano <opie@817west.com> wrote:
> On Tue, 2004-09-21 at 12:43, George Alexandru Dragoi wrote:
> > http://www.netfilter.org/patch-o-matic/pom-base.html#pom-base-SAME
> >
> >
> 
> did you mean:
> 
> http://www.netfilter.org/patch-o-matic/pom-base.html#pom-base-NETMAP
> 
> and the OP's problem was one of ARP--not NAT.
> 
> -j
> 
> --
> Jason Opperisano <opie@817west.com>
> 
> 



-- 
Bla bla

