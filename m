From: Felipe <fflores@millicom.com.pe>
Subject: SNAT not working
Date: Sun, 29 Feb 2004 04:34:44 -0500 (PET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1078047284.4041b234e0530@milliweb.millicom.com.pe>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

I've tried to set up SNAT to match INTERNAL network to a external ip,


/usr/local/sbin/iptables -t nat -A POSTROUTING -o eth0 -s 10.0.0.0/16 -j SNAT --to-source 200.110.2.179

But that's working, it only works when i put:

/usr/local/sbin/iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE


eth0= external interface
eth1= internal interface

i've linux 7.3 kernel 2.6.3 andiptables v1.2.9


Could you help me please?


Thanks



