From: =?windows-1254?Q?=DDhsan__Turkmen?= <iturkmen@ifk.com.tr>
Subject: RE: binding nntp to one interface
Date: Thu, 12 Sep 2002 10:26:05 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <A758C299015FD411887B0000E2131186C213F2@TRUVA>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 'Rasmus Reinholdt Nielsen' <rasmus@narani.dk>, netfilter@lists.samba.org

Rasmus.
SNAT can not be defined in PREROUTING , you must use POSTROUTING table. This
is your first failure..


-----Original Message-----
From: Rasmus Reinholdt Nielsen [mailto:rasmus@narani.dk]
Sent: Thursday, September 12, 2002 10:06 AM
To: netfilter@lists.samba.org
Subject: binding nntp to one interface


Hi

I have two different internet connections, to two different ISP's, set up 
as load balancing.

My problem is that both my isp's have ip restricted their newsservers, so I 
need to bind all outgoing trafic on port 119 to a specific interface or ip. 
Anybody knows how to do this?

I have tried using redirect but it didn't work

iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 119 -j REDIRECT --to 
<wan-ip>

and I get an error of "Invalid argument" on this SNAT rule

iptables -t nat -A PREROUTING -p tcp -i eth0 --dport 119 -j SNAT --to
<wan-ip>

hope somebody knows haw to do this.

Thanks

/Rasmus


