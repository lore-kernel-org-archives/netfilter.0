From: "Pito Breizh" <pito_breizh@hotmail.com>
Subject: Memory leak problem
Date: Thu, 07 Nov 2002 07:52:51 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <F162SYe4nhrKtzcbLDi0000031a@hotmail.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hello,

I've got a problem of memory leak with iptables. I'm using iptables
1.2.7a. I've linked libiptc.a and iptables.o with my application.

I'm setting up some NAT rules by using do_command and iptc_commit
functions.

I've seen a mail on netfilter-devel list (dated of 2 september) dealing
with this problems. Here is this mail :

>You expect the iptables source components to be more than a short->running 
>one-shot application; you expect them to be usable in a library in a 
>longer-running process. That expectation is wrong, the current userlevel 
>iptables source was not designed with that goal in mind.

>This is currently tackled by some developers (not me), who are working
>on an all-new userlevel and user/kernel interface that _is_ designed
>to support efficient use from many different userlevel applications.

>However, as far as I know, this reimplementation is currently not
>in a form that you may use.

>best regards
>  Patrick

First of all, I would want to know if the developers team in charge of
the developement of the new userlevel interface is on this list?

Secondly, are there news about this subject ? If developement's
resources are needed, perhaps I can help !

Best regards,
   Mickael





_________________________________________________________________
MSN Messenger : discutez en direct avec vos amis ! 
http://www.msn.fr/msger/default.asp


