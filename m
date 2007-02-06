From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: Connect to localhost bound port from outside?
Date: Tue, 6 Feb 2007 20:38:34 +0100 (MET)
Message-ID: <Pine.LNX.4.61.0702062038020.22760@yvahk01.tjqt.qr>
References: <eppgne$mc1$1@sea.gmane.org> <45C06BE7.2080208@plouf.fr.eu.org>
	<45C0B772.2090201@riverviewtech.net>
	<Pine.LNX.4.64.0702061413090.3777@darkstar.sysinfo.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.64.0702061413090.3777@darkstar.sysinfo.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "R. DuFresne" <dufresne@sysinfo.com>
Cc: Mail List - Netfilter <netfilter@lists.netfilter.org>, Grant Taylor <gtaylor@riverviewtech.net>


On Feb 6 2007 14:13, R. DuFresne wrote:
>
> What's a "dummy" interface?

	modprobe dummy
	ip a a 192.168.222.222/24 dev dummy0

it's not particularly useful, but well, it's there for whatever reason one
might need it.


regs,
Jan

