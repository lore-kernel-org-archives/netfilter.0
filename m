From: varun_saa@vsnl.net
Subject: ftp rules
Date: Tue, 16 Aug 2005 16:00:43 +0500
Message-ID: <a4929a56e2.a56e2a4929@vsnl.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-language: en
Content-disposition: inline
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

Hello,  
     My server in on FC4  
eth0 is wan with static IP connected to 512K DSL  
eth1 is lan - 192.168.0.0/24  
  
WAN -----> eth0 - FC4 server - eth1 -----------> clients ( 192.168.0.0/ 24 )   
FC4 server is only for sharing internet , mails, etc for clients system.   
I do not run any ftp server on ny FC4 server.   
I have loaded ip_contrack_ftp modules. 
  
Clients connected to FC4 server on eth1 should be able to connect  
to ftp sites.  
  
Is the following rule enough ?  
  
-A FORWARD -i eth1 -o eth0 -p tcp --dport 21 -j ACCEPT  
  
Thanks  
  
Varun  


