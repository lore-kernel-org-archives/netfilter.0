From: Matthias Kattanek <mattes@mykmk.com>
Subject: Re: Redhat 7.2 Kernel
Date: Tue, 9 Jul 2002 10:20:39 -0700 (PDT)
Sender: netfilter-admin@lists.samba.org
Message-ID: <Pine.LNX.4.44.0207091015020.4405-100000@e33.eng.roonetworks.com>
References: <000701c22756$425ac1b0$153fa8c0@hslbrabantzuid.nl>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <000701c22756$425ac1b0$153fa8c0@hslbrabantzuid.nl>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "R. Sterenborg" <rsterenborg@xs4all.nl>, "Mike G. Hammonds" <mhammonds@knowledgeinenergy.com>
Cc: "Iptables-User-list (E-mail)" <netfilter@lists.samba.org>


On Tue, 9 Jul 2002, R. Sterenborg wrote:

> ----- Original Message ----- 
> From: "Mike G. Hammonds" <mhammonds@knowledgeinenergy.com>
> Subject: Redhat 7.2 Kernel
> 
> 
> > Does the default install kernel of RH7.2 have iptable support already
> > compiled in it?
> > 
> Yes it does.

Nope, that is not exactly true.
All RedHat 7.x distribution with a 2.4.x kernel offer iptables as a 
module. (same as ipchains)

By default RH distries have ipchains activated. So in case you attempt
e.g. 'iptables -L' you will encounter an error message.

no worries. easiest way around is to rename /etc/sysconfig/ipchains
to /etc/sysconfig/ipchains.notinuse. Then reboot the box and run 
'iptables' and it will autoload the respective module.

mattes



