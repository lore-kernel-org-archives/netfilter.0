From: "Gautham Thavva" <gautham.thavva@lycos.com>
Subject: TFTP Connection Tracking Issue...
Date: Wed, 29 Oct 2003 17:14:11 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <NGNKFNPLIENKNDAA@mailcity.com>
Reply-To: gautham.thavva@lycos.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Language: en
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


I have enforced a firewall, using iptables-1.2.6a, on a Redhat 7.2 host (Kernel version is 2.4.7-10).

I have applied the *tftp* patch available in the patch-o-matic. The patch has not helped in tracking the TFTP session.

The TFTP client sends the Read request to the server. The server sends the Data block but there is no acknowledgement from the client.

After enabling the debug prints, I have noticed that: 1. the tuple for the connection is created
2. enters and exits out of *ip_conntrack_expect_related* function
3. through the netfilter hook, enters the *resolve_normal_ct* function. It however doesn't find the connection tracking tuple. It finds that the incoming packets are *related* packets and it accepts that packet.

However, the TFTP transfer times out.

----------------
Later I added a rule specifying the destination port of the tftp session and noticed that the *related* packets became *normal* packets for that connection.

The following is a snippet of the iptable rules for the TFTP protocol:

### TFTP ###
$IPTABLES -A allowed_udp -p UDP -m state --state RELATED -j ACCEPT
$IPTABLES -A udp_packets -p UDP -s 0/0 --sport 69 -j allowed_udp

Please can someone share their insight and assist me in resolving the TFTP connection tracking problem.

Thanks,
Gautham Thavva







____________________________________________________________
FREE ADHD DVD or CD-Rom (your choice) - click here!
http://ad.doubleclick.net/clk;6413623;3807821;f?http://mocda2.com/1/c/563632/131726/311392/311392
AOL users go here: http://ad.doubleclick.net/clk;6413623;3807821;f?http://mocda2.com/1/c/563632/131726/311392/311392
This offer applies to U.S. Residents Only

