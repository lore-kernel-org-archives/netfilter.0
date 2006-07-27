From: Rigoberto Corujo <rcorujo@yahoo.com>
Subject: NFS hang after restarting IP tables
Date: Thu, 27 Jul 2006 13:00:43 -0700 (PDT)
Message-ID: <20060727200043.90594.qmail@web60816.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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

Hello everyone,

I have just joined this mailing list so my apologies
if my question is not appropriate for this mailing
list.

Basically I need some guidance on a problem I'm
having.

With iptables already started, I NFS mount a
filesystem using the "proto=tcp" option on, say,
"/mnt".  I can do a "ls /mnt" with no problem.

Now, if I restart iptables, my "ls /mnt" will hang for
a good long while and eventually time out.

From the tcpdump output, you can see that the NFS
client "njxcsup7nh" is communication on port 800 with
the NFS server "kurby".

The packet exchange seems to be going fine until,
suddenly, the NFS client "njxcsup7nh" decides he is no
longer accepting packets to port 800 and sends back an
"unreachable - admin prohibited" packet to the NFS
server "kurby".

14:06:34.871476 IP njxcsup7nh.companyname.com.800 >
kurby.companyname.com.nfs: P 3932:4064(132) ack 3489
win 18 <nop,nop,timestamp 775808018 2529886659>
14:06:34.871667 IP kurby.companyname.com.nfs >
njxcsup7nh.companyname.com.800: P 3489:3605(116) ack
4064 win 9756 <nop,nop,timestamp 2529886660 775808018>
14:06:34.871714 IP njxcsup7nh.companyname.com.800 >
kurby.companyname.com.nfs: P 4064:4196(132) ack 3605
win 18 <nop,nop,timestamp 775808018 2529886660>
14:06:34.871905 IP kurby.companyname.com.nfs >
njxcsup7nh.companyname.com.800: P 3605:3721(116) ack
4196 win 9756 <nop,nop,timestamp 2529886660 775808018>
14:06:34.871954 IP njxcsup7nh.companyname.com.800 >
kurby.companyname.com.nfs: P 4196:4328(132) ack 3721
win 18 <nop,nop,timestamp 775808018 2529886660>
14:06:34.872146 IP kurby.companyname.com.nfs >
njxcsup7nh.companyname.com.800: P 3721:3837(116) ack
4328 win 9756 <nop,nop,timestamp 2529886660 775808018>
14:06:34.872165 IP njxcsup7nh.companyname.com >
kurby.companyname.com: icmp 176: host
njxcsup7nh.companyname.com unreachable - admin
prohibited
14:06:35.072687 IP njxcsup7nh.companyname.com.800 >
kurby.companyname.com.nfs: P 4196:4328(132) ack 3721
win 18 <nop,nop,timestamp 775808219 2529886660>
14:06:35.072841 IP kurby.companyname.com.nfs >
njxcsup7nh.companyname.com.800: . ack 4328 win 9756
<nop,nop,timestamp 2529886861 775808219,nop,nop,sack
sack 1 {4196:4328} >
14:06:35.072857 IP njxcsup7nh.companyname.com >
kurby.companyname.com: icmp 72: host
njxcsup7nh.companyname.com unreachable - admin
prohibited

After the "ls /mnt" times out, subsequent "ls /mnt"
are successful.  That is, unless I restart iptables
again.

As a side note, when I only had one file in "/mnt" I
didn't get the hang.  So I copied files under "/etc"
to "/mnt" and then I get the hang.  I have observed
that the "unreachable - admin prohibited" message
occurs randomly during the packet exchange between the
NFS client and the NFS server.  That is, sometimes
tcpdump shows more packets being exchanged and
sometimes it shows less packets being exchanged before
the rejection occurs.

This problem does not occur if the "proto=udp" option
is used with NFS.  This problem has been observed on
Red Hat AS 3 as well as Red Hat AS 4.

Would anyone be able provide even a guess as to why
the NFS client "njxcsup7nh" started to reject packets
to port 800 after it had been happily accepting them?

Thank you.

Rigoberto


__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 

