From: Payal Rathod <payal-netfilter@staticky.com>
Subject: changing rules at a defined time
Date: Wed, 24 Dec 2003 09:29:36 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031224092936.GB27890@staticky.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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
To: Netfilter ML <netfilter@lists.netfilter.org>

Hi,
I have a very basic LAN setup question like,

- till 16:00 p.m. all ips can just use ftp but ips 192.168.0.1
  and 192.168.0.100 can do anything

- after 4:00 afternoon all can do anything till 5:00 after which again
  the above [1st rules] are to be applied.

I am thinking of doing,

[For step 1]: - Policy ACCEPT for FORWARD

iptables -A FORWARD -s 192.168.0.1 -p tcp -j ACCEPT
iptables -A FORWARD -s 192.168.0.100 -p tcp -j ACCEPT
iptables -A FORWARD -s 192.168.0.0/32 -p tcp --dport 21 -j ACCEPT
iptables -A FORWARD -s 0/0 -p tcp -j DROP

[For step 2]: - Policy ACCEPT for FORWARD

iptables -A FORWARD -p tcp -j ACCEPT

Maybe same for udp.


Now my question is, 

1> Do the above steps look ok? I will refine them further. Right now are
they workable.

2> If I want to change the rules at 16:00 what is the best way to change
them? I was thing of flushing with iptables -F and iptables -F -t nat
and then running the second step.
Similary at 17:00 do the same kind of flushes and run 1st step from a
file? Is this approach ok or is there anything better?

Thanks a lot in advance and bye.

With warm regards,
-Payal

-- 
For GNU/Linux Success Stories and Articles visit:
          http://payal.staticky.com

