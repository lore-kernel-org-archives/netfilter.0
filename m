From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: rules for mail server
Date: Mon, 19 Sep 2005 15:54:18 +0200 (CEST)
Message-ID: <54005.193.173.147.3.1127138058.squirrel@193.173.147.3>
References: <432EC0A2.9090606@rediffmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <432EC0A2.9090606@rediffmail.com>
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

> Hello,
>          My mailserver is Mandriva2005.
> eth0 is wan with static IP
> eth1 is lan - 192.168.1.0/24
>
> I am settings up mailserver using Postfix.
>
> Domain - saice.edu
>
> Clients will connect to this server for their
> mails on the network.
>
> What kind of iptables rules are required ?

Well, are your clients connecting to this server to get their email or to
send email ?

Anyway, to be able to reach Postfix you need to open port 25.

There is this great tutorial from Oskar Andreasson :
http://iptables-tutorial.frozentux.net/iptables-tutorial.html
which can learn you how to create such a rule..


Gr,
Rob



