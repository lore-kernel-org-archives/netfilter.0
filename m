From: George Alexandru Dragoi <waruiinu@gmail.com>
Subject: Re: problems with alias
Date: Fri, 16 Jul 2004 13:50:16 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3063e504071603504d6e987c@mail.gmail.com>
References: <12a1fd421dcf7411b2acdd8a5da18f59@147.162.2.222>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <12a1fd421dcf7411b2acdd8a5da18f59@147.162.2.222>
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
To: Batstru <batstru@email.it>
Cc: netfilter@lists.netfilter.org

Define "not work", give some error messages, what you expect and what you get


----- Original Message -----
From: Batstru <batstru@email.it>
Date: Fri, 16 Jul 2004 12:00:02 +0200
Subject: problems with alias
To: netfilter@lists.netfilter.org



Hi all!


I changed my server running redhat9 (kernel 2.4.x) with a new one with
fedora core 2 (kernel 2.6.x): each one has  2 ethernet interfaces, so
I copy network configuration fron rh9 to fc2



eth0 --> 192.168.1.254 / 255.255.255.0
eth1 --> 82.186.92.90 / 255.255.255.254
eth1:1 --> 82.186.92.91 / 255.255.255.254
eth1:2 --> 82.186.92.92 / 255.255.255.254
eth1:3 --> 82.186.92.93 / 255.255.255.254
eth1:4 --> 82.186.92.93 / 255.255.255.254


also, I copy and apply iptables configuration but it does not work well.


now iptables doesn't apply rules to virtual interfaces, eth1...eth4.


a line of my configiguration files is:
-A INPUT -p tcp -m tcp -m state -d 82.186.92.91 --dport 20 --state NEW -j ACCEPT


I tried different rules configuration but it still not work.



can you help me?


----

 Email.it, the professional e-mail, gratis per te: clicca qui 

 

 Sponsor:

 Lerboristeria.biz: per la tua bellezza e salute il miglior assortimento 
di prodotti erboristici ed oggettistica online


 Clicca qui

