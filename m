From: George Alexandru Dragoi <waruiinu@gmail.com>
Subject: Re: 2 NICs on same subnet
Date: Sat, 6 Nov 2004 02:05:40 +0200
Message-ID: <3063e50411051605371fc202@mail.gmail.com>
References: <7C9884991ADAE0479C14F10C858BCDF591E38F@alderaan.smgtec.com>
	<20041105191621.GA17889@zion.homelinux.com>
	<30df48470411051537e561da9@mail.gmail.com>
Reply-To: George Alexandru Dragoi <waruiinu@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <30df48470411051537e561da9@mail.gmail.com>
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

     I think the best solution is to use bonding, if the switch
supports it (Yea, the switch MUST have this). This way you-ll have a
single mac, and the balance for inbound will be made by the switch. I
think everybody knows you can't control what is comming, but the sitch
will be able to controll the outgoing. If the switch knows bonding,
then a single ip should be enough.

