From: "riffraff" <riffraff@mail.ev1.net>
Subject: Re: trying to get one blessed thing to work
Date: Mon,  8 Jul 2002 11:48:28 -0500
Sender: netfilter-admin@lists.samba.org
Message-ID: <200207081148.AA469041392@mail.ev1.net>
Reply-To: <riffraff@mail.ev1.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Netfilter Mailing List <netfilter@lists.samba.org>

---------- Original Message ----------------------------------
From: Mark Tessier <mt@open2web.com>
Date: Mon, 8 Jul 2002 12:32:23 -0400

>The first thing I did was to set the policy to drop for the forward chain as in:
>
>iptables --policy FORWARD DROP
>
>Next, I tried to open one door on the forward chain, allowing icmp packets of the echo request type to ping any other machine as in:
>
>iptables -A FORWARD -o eth0 -p icmp --icmp-type echo-request -s 192.168.0.0/24 -m state --state NEW -j ACCEPT
>
>The result is, it doesn't work.
>
No, it won't  You aren't letting the return packet of echo-reply back through.  I would do it with this:

iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

You could add the interface and protocol if you'd like.

 
>Thanks,
>
>Mark
>
>
lance


