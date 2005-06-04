From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Fedora 3, missing ip_conntrack_ftp & ip_nat_ftp
Date: Sat, 04 Jun 2005 12:11:07 -0400
Message-ID: <1117901467.2143.15.camel@grendel>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@lists.netfilter.org>

Greets all,

I have a pretty basic Fedora 3 install with all patches installed via
Yum. I'm using the box as a network firewall and need support for
outbound PASV FTP. I tried to modprobe the modules ip_conntrack_ftp and
ip_nat_ftp, but I get an error saying the files do not exist. A quick ls
of /sys/modules confirms this. 

Any idea what I'm missing? I know I could pull down source and install
that way, but I would prefer to do it via RPM's & Yum so I can easily
keep the box up to date. 

Any and all help greatly appreciated,
Chris



