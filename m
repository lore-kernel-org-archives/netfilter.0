From: "Spiro Azkoul" <spiro@snacorp.net>
Subject: RE: IPs blocked still able to connect
Date: Mon, 14 Jun 2004 01:54:19 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406140853.i5E8rsqE031321@ylpvm43.prodigy.net>
References: <20040613135859.51704919@mgalepc.utilitran.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040613135859.51704919@mgalepc.utilitran.com>
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

By doing the -I transition no one could connect to my server anymore. 

Knowing that I had a bunch of rules such as 

[root@linux root]# iptables -L INPUT 
Chain INPUT (policy ACCEPT)
target     prot opt source               destination         
DROP       all  --  YahooBB219000000000.bbtec.net/8  anywhere           
DROP       all  --  AAnnecy-204-1-27-120.w81-249.abo.wanadoo.fr  anywhere

DROP       all  --  61.178.0.0/16        anywhere           
DROP       all  --  53-bem-10.acn.waw.pl  anywhere           
DROP       all  --  216.155.64.0/19      anywhere    
RH-Lokkit-0-50-INPUT  all  --  anywhere             anywhere           
ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:ssh 
ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:http 
ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:smtp 
ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:pop3

That did not work
No one could connect for POP or SMTP. 
What is wrong with that config?
Thanks
       


