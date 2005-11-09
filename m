From: Marc Green <marc.green@skynet.be>
Subject: Performance problems on my firewall using iptables (SuSEfirewall2)
Date: Wed, 09 Nov 2005 11:50:07 +0100
Message-ID: <4371D45F.10103@skynet.be>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi everybody.
I know my question might sound odd because of the version I'm using but 
this just because of the type of system I'm running on.

Short :
I'm running a router with a firewall (Firewall2) using SuSE 7.3
The system is a pentium 200 MHz with 94 Mb memory.

I put in attachemend result of different "iptables" commands that show 
the rules that are set up.

Basicaly these are the default rules.

My problem is as follow.
Before the firewall :
Download speed : 320 KB/sec
Upload speed   : 27,1 KB/sec

After the firewall
Download speed : 7,2 KB/sec
Upload speed   : 27,9 KB/sec

Ok for the upload, but such a difference for download I don't think this 
is normal do you?
My nsswitch.conf is "hosts    files dns"
I have eth0 configure to DHCP address from the ADSL ethernet modem
I have eth1 configured static 192.168.0.X
and eth1:1 configure static 192.168.1.X

Can anybody help me for this. In which direction do I have to search for.
I'm thinking about first deleting all the rules and keep only NAT.
BTW the result of "iptables -t nat|filter -L" can be sended on request.

Thank for your help.

