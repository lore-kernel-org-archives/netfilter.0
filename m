From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Re[2]: Invalid argument in -j SNAT
Date: Wed, 3 Dec 2003 15:16:32 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031203170322.1569A1B9B8@smtp.ttp.nl>
References: <19067494521.20031203164055@internetplustravel.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <19067494521.20031203164055@internetplustravel.ru>
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
To: 'Oleg Savostyanov' <savostyanov@internetplustravel.ru>, netfilter@lists.netfilter.org

> >> iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to-source 
> >> XXX.XXX.XXX.XXX with an error "iptables: Invalid argument" 
> I suspect, 
> >> that an argument is XXX.XXX.XXX.XXX
> 
> RS> Did you compile and load the module iptable_nat ?
> RS> Gr,
> RS> Rob
> Thank you for your answers
> 
> I compiled the kernel without modules
> 
> yes, NAT is on
> this is my kernel .config

Yes, but did you also load iptable_nat (modprobe iptable_nat) ?
What is the output of "lsmod | grep nat" ?


Gr,
Rob


