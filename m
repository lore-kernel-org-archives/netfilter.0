From: Chris <chris@imi.com.au>
Subject: Traffic accounting
Date: 27 Jan 2003 00:18:59 +1100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1043587138.2372.4.camel@athlon-boxen>
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

Hi all,

I've got a Linux box set up acting as a mail server, web server and
firewall. There are a few other boxes sitting on the same rack that this
Linux box firewalls off from the net. 

My question is this - how can I come up with an appraisal of how much
traffic each box that we act as a firewall for has received and sent
over a given period? The only thing I can think of that might complicate
the process is this fact:

	We are using Proxy ARP and everything's on the same subnet.

All thoughts greatly appreciated! All amusing flames stuck to my wall.

Chris


