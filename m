From: "Bailey Kong" <bailey@tgpsolutions.com>
Subject: Re: IPTables not available
Date: Wed, 26 Jun 2002 10:19:23 -0700 (PDT)
Sender: netfilter-admin@lists.samba.org
Message-ID: <4738.192.168.1.2.1025111963.squirrel@mail.tgpsolutions.com>
Reply-To: bailey@tgpsolutions.com
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
To: netfilter@lists.samba.org

> yeah, I think rh72 ships with an ipchains kernel. if you apply system
> updates, the new kernel is an ipchains one. don't know about rh73,
> which would be odd if it's the same reason. ...send the error?

Both RH7.2 and RH7.3 ship with an iptables kernel. The reason why it
probably doesn't work for you, is simply because ipchains was loaded
alrdy.  Ipchains is RH's default firewall.  All you need to do is

chkconfig --del ipchains
so ipchains doesn't load on boot or you can delete the ipchains firewall
rm /etc/sysconfig/ipchains

then reboot
i don't think you can just do a service ipchains stop, but i could be
wrong

and then implement your iptables firewall using the iptables command

iptables -A .....

after you done with that you can save it to a file using

/etc/rc.d/init.d/iptables save or service iptables save

hope this helps
Bailey

-- 
bailey@tgpsolutions.com

Administrator, tgpsolutions
http://www.tgpsolutions.com



