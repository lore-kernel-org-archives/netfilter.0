From: "Patrick Ahler" <patrick@vikus.com>
Subject: Masquerade and NAT
Date: Thu, 13 Mar 2003 16:20:47 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <ABEKJILKOKKGGDJKHKDFEEDGCAAA.patrick@vikus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter EMAIL <netfilter@lists.netfilter.org>

Hi,
I am hoping to be able to run IP Masquerade and NAT on the same
firewall/router. ie 192.168.1.1-61 use NAT to translate their internal IP's
to external IP's (a.b.c.1-61), and have a variety of internal hosts on the
same subnet(as the other machines using NAT) using IP masquerading to pass
through the firewall.. ie 192.168.1.62-140 use IPMASQUERADE to translate
their internal ip's to a.b.c.62

Is this possible? If so how? I've found that in order to use IP MASQUERADE
you have to specify a subnet of internal ip's that will use IP MASQUERADE,
but what if I only want to select specific internal ip's that will use it?
Help? Thanks!


Patrick



