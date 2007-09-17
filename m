From: Vitaly <vitaly_il@yahoo.com>
Subject: Kernel crash. Are  ipt_recent and ipt_conntrack   culprit?
Date: Mon, 17 Sep 2007 03:39:14 -0700 (PDT)
Message-ID: <630871.25383.qm@web60316.mail.yahoo.com>
References: <46E6D557.7050204@rtij.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <46E6D557.7050204@rtij.nl>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <http://lists.netfilter.org/pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

I run RHEL3 with kernel 2.4.21-32.0.1.ELsmp.
Yesterday morning I started to play with iptables on
this server and yesterday evening I had kernel crash
on this server.

My iptables contains just two rules, see script below

MAXHITS=70
iptables -F
rmmod ipt_recent
modprobe  ipt_recent  ip_pkt_list_tot=200
 
iptables -I INPUT -p tcp --dport 80  ! -s
10.10.10.0/24   -m state --state NEW -m recent --set
iptables -I INPUT -p tcp --dport 80   ! -s
10.10.10.0/24    -m state --state NEW -m recent
--update --seconds 60 --hitcount $MAXHITS -j LOG
--log-prefix "http_limit_test "  --log-level="DEBUG"

I don't see reports about recent 2.4
kernel/ipt_recent/ip_conntrack  crashes. 
OTOH, this server worked many months without crashes
before I activate  iptables. 

Should I go to the latest RHEL3 kernel even I don't
see something relevant into kernel changelog? Other
suggestions? 

Thanks
Vitaly




      ____________________________________________________________________________________
Fussy? Opinionated? Impossible to please? Perfect.  Join Yahoo!'s user panel and lay it on us. http://surveylink.yahoo.com/gmrs/yahoo_panel_invite.asp?a=7 


