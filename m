From: "gbj" <gbj@glc.cn.net>
Subject: how to got  lasting time about one connection from iptable log?
Date: Wed, 4 Jun 2003 10:51:51 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E19NOOU-0001Jt-00@kashyyyk.netfilter.org>
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
To: netfilter@lists.netfilter.org, netfilter@lists.netfilter.org

When open iptables's log file,we can got some messages like this:
 time                      in   pro    src         spt      dest        dpt
Jun 02 07:59:30   ACCEPT  eth0  tcp  192.168.6.26  4269  64.215.164.33  80  
Jun 02 07:59:31   ACCEPT  eth0  tcp  192.168.6.26  4269  64.215.164.33  80  
Jun 02 07:59:31   ACCEPT  eth0  tcp  192.168.6.26  4269  64.215.164.33  80  
Jun 02 07:59:31   ACCEPT  eth0  tcp  192.168.6.26  4269  64.215.164.33  80  
Jun 02 07:59:31   ACCEPT  eth0  tcp  192.168.6.26  4278  64.215.164.33  80  
Jun 02 07:59:32   ACCEPT  eth0  tcp  192.168.6.26  4278  64.215.164.33  80  
Jun 02 07:59:32   ACCEPT  eth0  tcp  192.168.6.26  4278  64.215.164.33  80  

but in fact, this connection information perhaps belonge to one connection,I want to know how to combine 
this information to one connection message and got the duration time of the connection,just like this:
        start  time        duration       src         spt     dest       dtp

    Jun 02 07:59:30        128         192.168.6.26  4269  64.215.164.33  80 


Thanx U all!




