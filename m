From: "..." <betolourenco@ig.com.br>
Subject: Re: netfilter hangups
Date: Tue, 11 Mar 2003 19:15:15 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000801c2e81b$b33e70d0$32050a0a@rlourenco>
References: <3019863CF306D211BA4500A0CC30812DC6790D@exchange.cyberwolf.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

why are you doing it.

try
service iptables restart

...
----- Original Message -----
From: "Chip Upsal" <cupsal@cyberwolf.com>
To: <netfilter@lists.netfilter.org>
Sent: Tuesday, March 11, 2003 7:00 PM
Subject: netfilter hangups


> I am running nefilter 1.2.7a on a Redhat 7.3 box kernel v. 2.4.18-24.7.x.
>
> I have experienced the following problems. Sometimes after making many
> changes and reloading the firewall after each change...the firewall will
> refuse to reload with the following output:
>
> [root@iptables1 root]# /etc/sysconfig/iptables condrestart
> iptables: Chain already exists
> iptables: Chain already exists
> iptables: Chain already exists
> iptables: Chain already exists
> iptables: Chain already exists
>
> Or if i get no error the firewall will not recognize any of the changes i
> have made.
>
> In either case i am forced to reboot the firewall to get things going
again.
>
>
>
> Chip Upsal
> SysAdmin
>
>


