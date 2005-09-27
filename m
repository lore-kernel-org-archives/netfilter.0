From: Sandro Dentella <sandro@e-den.it>
Subject: ip on 2.6 kernelL link/[65534] instead of link/ppp
Date: Tue, 27 Sep 2005 20:35:11 +0200
Message-ID: <20050927183511.GA7089@casa.e-den.it>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: iptables <netfilter@lists.netfilter.org>

Hi all,

   
   "ip adds ls" used to give me smething like:

250: tun0: <POINTOPOINT,MULTICAST,NOARP,UP> mtu 1500 qdisc pfifo_fast qlen 10
    link/ppp
    inet 10.0.1.254 peer 10.0.0.254/32 scope global tun0

    but since 2.6 I see somethining like:

12: tun1: <POINTOPOINT,MULTICAST,NOARP,UP> mtu 1500 qdisc pfifo_fast qlen 500
    link/[65534]  <<<<<<<<<<<<<<<<<<<
    inet 10.0.0.254 peer 10.0.1.254/32 scope global tun1


Does anybody know why?

TIA
sandro
*:-)


-- 
Sandro Dentella  *:-)
e-mail: sandro@e-den.it 
http://www.tksql.org                    TkSQL Home page - My GPL work

