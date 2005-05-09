From: Chadley Wilson <chadley@pinteq.co.za>
Subject: Redirecting traffic to my ftp site?
Date: Mon, 9 May 2005 20:13:56 +0200
Message-ID: <200505092013.56681.chadley@pinteq.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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

Greetings

My firewall / router has two interfaces.
bond0 == internal
eth0 == external

I have an ftp server setup on the same box. If anyone on the internal network 
tries to access http 80 or ftp 20:21 I would like to route them regardless of 
the url entered to my ftp site.
 
:} "evil I know"

iptables -t nat -A PREROUTING -i bond0 -p tcp --dport 80 -j DNAT \
--to-dest 192.168.0.1 (ftp??)

Could I use iptables for that?
If how should that rule look?

Thanks in advance,

Oh and by the way there is method in the madness ;)



-- 
Chadley Wilson
Redhat Certified Technician 
Cert Number: 603004708291270
Pinnacle Micro
Manufacturers of Proline Computers
====================================
Exercise freedom, Use LINUX
=====================================


