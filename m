From: "Pradeep Bhomia" <pradeepbhomia@ahm.cmc.net.in>
Subject: Firewall performance querry
Date: Tue, 9 Sep 2003 11:21:32 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030909053404.M44692@ahm.cmc.net.in>
References: <20030905062950.M87452@ahm.cmc.net.in>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030905062950.M87452@ahm.cmc.net.in>
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
To: netfilter@lists.netfilter.org

Hello Friends,

I have recently setup an iptables based firewall and put a Sendmail server 
behind firewall (although after facing some problems and with help from 
friends in this mailling list). Now I want to put a proxy server behind this 
same firewall. Right now the proxy server is connected directly to the 
internet. Before moving ahead I want to know what will be the load on the 
firewall. The configuration of firewall box is P4, ~1.8GHz, 256MB RAM, 
Mandrake Linux 9.1, IPTables 1.2.7 and Shorewall 1.3.14. I will be having 
aroung 300-400 concurrent users. I plan to setup NATting. Can anybody help me 
in this regard. Whether NATting will be sufficient to take care about this 
load or some other method can be used ( Total load on firewall will be some 
1000 email accounts on sendmail server and around 400 clients for web 
browsing). If anybody can direct me to some websites having some sort of 
statistics for iptables.

Thanks a lot,

Pradeep Bhomia

