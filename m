From: "Daniel Wittenberg" <daniel-wittenberg@starken.com>
Subject: state table not working
Date: Fri, 18 Jun 2004 14:48:18 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1087588098.40d3470246775@securemail.starken.com>
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

I've got a firewall I've been supporting for awhile, and few months things have
been screwy, and I think I've narrowed it down.  Originally it looked like a bug
in proftpd, but now it looks like connections that are stateful stop working. 
What seems to happen is that after a period of time (almost 2 weeks now),
passive mode ftp stops working, but active mode still works.  Is there anything
that can be checked/traced to check what the connection table is like?  I have
watched for errors in dmesg and /var/log/message (fedora core 1 box), about
connection table full, but nothing there.  Here's part of the trace when things
broke:

1.2.3.4 is outside host

 0.181007 192.168.254.7 -> 1.2.3.4 FTP Response: 230 User <user> logged in.
  0.214498 1.2.3.4 -> 192.168.254.7 FTP Request: TYPE I
  0.215631 192.168.254.7 -> 1.2.3.4 FTP Response: 200 Type set to I
  0.260922 1.2.3.4 -> 192.168.254.7 FTP Request: PWD
  0.262036 192.168.254.7 -> 1.2.3.4 FTP Response: 257 "/" is current directory.
  0.344486 1.2.3.4 -> 192.168.254.7 TCP 56178 > ftp [ACK] Seq=39 Ack=147
Win=5840 Len=0 TSV=250989004 TSER=112409764
  0.362754 1.2.3.4 -> 192.168.254.7 FTP Request: PASV
  0.363917 192.168.254.7 -> 1.2.3.4 FTP Response: 227 Entering Passive Mode
(192,168,254,7,8,202).
  0.407829 1.2.3.4 -> 192.168.254.7 TCP 56178 > ftp [ACK] Seq=45 Ack=197
Win=5840 Len=0 TSV=250989010 TSER=112409774
  0.407907 1.2.3.4 -> 192.168.254.7 TCP 56179 > 2250 [SYN] Seq=0 Ack=0 Win=5840
Len=0 MSS=1460 TSV=250989010 TSER=0 WS=0
  3.400629 1.2.3.4 -> 192.168.254.7 TCP 56179 > 2250 [SYN] Seq=0 Ack=0 Win=5840
Len=0 MSS=1460 TSV=250989310 TSER=0 WS=0
  9.400613 1.2.3.4 -> 192.168.254.7 TCP 56179 > 2250 [SYN] Seq=0 Ack=0 Win=5840
Len=0 MSS=1460 TSV=250989910 TSER=0 WS=0
 11.114693 1.2.3.4 -> 192.168.254.7 TCP 56178 > ftp [FIN, ACK] Seq=45 Ack=197
Win=5840 Len=0 TSV=250990074 TSER=112409774

Any other ideas?

Dan

