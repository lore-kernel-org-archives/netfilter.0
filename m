From: sysinu@nix.g.root-servers.net
Subject: TC+IMQ+IPtables problem
Date: Wed, 10 Aug 2005 12:06:22 -0700
Message-ID: <20050810190622.GA14479@nix.g.root-servers.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Description: TC+IMQ+IPTABLES problem
Content-Disposition: inline
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

I am attempting to execute iptables -t mangle -A MYSHAPER-IN -j IMQ in a 
bandwidth shaping script (http://www.belongt0.us/shaper/shaper.txt) and 
I am getting the error message iptables: No chain/target/match by that 
name.  From what I can tell everything is setup correctly, and my 
shaping script is just a variant of a wider used shaping script...  I 
cannot for the life of me figure out why it's doing this.  I have built 
IMQ into both the Kernel and IPTABLES.  I've also attempted putting 
--todev 0 after the line I am trying to execute.

I am running the following:

Linux version 2.6.12.4 (root@nix) (gcc version 3.3.5-20050130 (Gentoo 
Linux 3.3.5.20050130-r1, ssp-3.3.5.20050130-1, pie-8.7.7.1)) #11 SMP Wed 
Aug 10 09:32:12 MST 2005

tc utility, iproute2-ss050310

ipchains 1.3.10, 1-Sep-2000

iptables v1.3.3

My IPTABLES was patched with:
http://www.linuximq.net/patchs/iptables-1.3.0-imq1.diff

My Kernel was patched with:
http://www.linuximq.net/patchs/linux-2.6.9-imq1.diff

Thank you in advance for all the help contributed.  There are a few 
debug files of mine available at http://www.belongt0.us/shaper/

Thanks again,
-Sysinu

