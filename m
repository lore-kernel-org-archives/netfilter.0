From: "Denis" <rinakkusu@pincushion.de>
Subject: iptables and pasv ftp
Date: Fri, 17 Jan 2003 23:23:58 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <004201c2be77$21efbb20$fe00a8c0@SG1>
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
To: netfilter@lists.netfilter.org

Hi

I'm new to iptable-firewalling and hope someone is able to give some advice.
I'm using redhat 8.0 with
proftpd as ftp server and iptables as firewall. I wrote a rule in iptables
to open port
21. So connecting to my ftp server via active mode works just fine. But if a
client which itself lies behind a firewall tries to use pasv mode, the
connection doesn't work.
I guess I need to put in a new iptable rule or something, because if I
shutdown iptables pasv also works. I read that I need to open port 20 and
some ports like 64500:65535, and that I need to use ip_conntrack and
ip_conntrack_ftp?
Maybe someone has a HowTo?

Thanks

Denis J.


