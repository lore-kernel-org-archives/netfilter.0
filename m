From: Feizhou <feizhou@linuxmail.org>
Subject: Re: IPTABLES routine help.
Date: Thu, 24 Jun 2004 11:32:09 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40DA4B39.7070503@linuxmail.org>
References: <20040624030837.99693.qmail@web60404.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040624030837.99693.qmail@web60404.mail.yahoo.com>
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
To: ads nat <adsnat@yahoo.com>
Cc: netfilter@lists.netfilter.org


> 
> I am DNATing LAN user by "iptables -t nat -A
> PREROUTING -s 192.168.0.0/24 -i eth1 -p tcp -m tcp
> --dport 80 -j DNAT --to-destination 10.0.0.2:80".
> 
> Problem :
> whenever LAN user wish to acces internet he is
> forcebly taken to "index.htm" at 10.0.0.2:80. I have
> click link on index.htm to "www.google.com". Even when
> I clicks on link on "index.htm" page, it goes to
> index.htm page only.
> I tried putting "-m state NEW", thinking only when
> packet state is new it will take to "index.htm" and
> when user click on the link on "index.htm" page it
> will divert them to linked page. But this does not
> happen.

Of course it does not. You have already decided the destination when you 
used DNAT. So no matter what ip the destination (the ip for 
www.google.com or whatever) they will all go to 10.0.0.2 because that is 
what DNAT DOES. Please go read up on the Netfilter howto and understand 
what DNAT does.
> 
> Please guide me to rule which will take user to
> index.htm page at 10.0.0.2:80 only at first time. When
> user click link on index.htm page destined for some
> other page(www.google.com) It should allow user to go
> to google or whatever.

What are you trying to achieve?
> 
> If it is not possible by iptables, is there any
> technology by which i can achieve this.
> Thanks for support.

What are you trying to achieve?

