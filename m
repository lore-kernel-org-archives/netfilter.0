From: Jim Carter <jimc@math.ucla.edu>
Subject: Re: why must linux for halted firewall?
Date: Tue, 16 Sep 2003 10:46:25 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.53.0309161040220.4397@xena.cft.ca.us>
References: <BAY8-F93kuutSgcOrBL0000ec1b@hotmail.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BAY8-F93kuutSgcOrBL0000ec1b@hotmail.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chua Boon Ping <nitb@hotmail.com>
Cc: netfilter@lists.netfilter.org

On Mon, 15 Sep 2003, Chua Boon Ping wrote:
> concerning "why opts for Linux(netfilter/iptables) rather than OpenBSD to
> implement a Halted Firewall". actually, can OpenBSD be halted just like
> Linux kernel do?

I'm not sure what you mean by a "halted firewall".  Do you mean that the
kernel uses the "halt" instruction when there is no work to do?  Actually,
if you have APM or ACPI BIOS (all recent machines do), the kernel will use
them to conserve power if the machine has been halted for a while, and if
the BIOS has that capability.

I like Linux iptables because it's flexible and semi-comprehensible, and it
can do (almost) everything I want to, and it uses relatively little CPU per
packet.  But what you really need is a reply from someone who knows both
NetBSD and Linux, and can say what's good about NetBSD firewall code.

James F. Carter          Voice 310 825 2897    FAX 310 206 6673
UCLA-Mathnet;  6115 MSA; 405 Hilgard Ave.; Los Angeles, CA, USA 90095-1555
Email: jimc@math.ucla.edu  http://www.math.ucla.edu/~jimc (q.v. for PGP key)

