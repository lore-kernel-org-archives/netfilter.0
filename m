From: "Pradeep Bhomia" <pradeepbhomia@ahm.cmc.net.in>
Subject: Problem with sendmail server behind firewall...
Date: Fri, 5 Sep 2003 12:10:08 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030905062950.M87452@ahm.cmc.net.in>
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
To: netfilter@lists.netfilter.org

We are facing problem with the sendmail server when it is put behind the 
iptables firewall.
The setup is:
Sendmail 8.12.9
IPTables 1.2.7
Shorewall 1.3.14

Earlier Sendmail server was connected directly to the Internet with a valid 
Internet IP. At that time the number of sendmail processes never exceeded 10 
at any given poing of time. (Checked with ps -ef | grep sendmail)
Now we have implemented the Mandrake Linux 9.1 based firewall using IPTables 
and Shorewall. NATting was configured on the firewall. After doing this, we 
have observed that the number of sendmail process keeps on increasing and 
goes upto nearly 170 processes. It seems that the problem is with the 
incoming message requests. It process remains open for nearly 2 hours. This 
is observed for random connections or some particular sites.
As such sendmail server is receiving and sending mails without any problem to 
the users.
After I remove the firewall and put the server directly on the internet the 
sendmail processes remain at less than 10.

I have been working on this problem for last two days without success. I 
cannot understand whether the problem is with the implementation of firewall 
(NATting) or with sendmail server. I have checked the firewall with only 
NATting (removed all the rules)

Kindly help.

Thanks and regards, 
 
Pradeep Bhomia 

