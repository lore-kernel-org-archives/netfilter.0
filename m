From: "Joao C. Marigonda" <joao@neotechnologies.com.br>
Subject: Active FTP with client behind NAT
Date: Sat, 10 May 2003 00:20:02 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1052536802.3ebc6fe2603dd@webmail.webnow.com.br>
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

Hello all, excuse me...

I have found lots of explanations about ip_conntrack_ftp but no one could help 
me to solve the following problem:
 
My FTP server is behind a firewall (ports >1023 blocked), so FTP should be 
always done in ACTIVE MODE and so, the client needs to send PORT command to 
server and server will open the data connection...
But the client is behind a NAT and the data connection from the FTP server is 
rejected by the NAT. This makes the client timeout because it will never get 
the SYN packet from server...

Question: How to configure NAT to track this incoming FTP data connection from 
any server behind a firewall to any clients in the LAN ????
 
Thanks very much!
 
 
Joao





