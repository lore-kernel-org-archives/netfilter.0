From: "Hu" <budget@apocyber.net>
Subject: iptables/pptp restriction
Date: Sat, 9 Jun 2007 08:22:06 -0500 (CDT)
Message-ID: <61039.67.184.120.135.1181395326.squirrel@67.184.120.135>
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

I have a pptp server (3.1.1.3) that allows technicians to gain access to
my network.

I have a particular user who I am granted a static ip address to (3.1.1.200).

I only want this user to have access to, for instance, servers 3.1.1.10
and 3.1.1.20.

How do I, using iptables on 3.1.1.3, restrict this user to only have
access to .10 and .20?

Any assistance will be greatly appreciated.

Thanks in advance,
Hu


