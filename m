From: "Mark Weaver" <mark@npsl.co.uk>
Subject: RE: icmp: 10.1.4.50 unreachable - need to frag (mtu 500) [tos 0xc0]
Date: Wed, 14 Jan 2004 18:11:18 -0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <GFEPJIHHFOJDOFDMNAJDIEHKEPAA.mark@npsl.co.uk>
References: <1074011912.2048.5.camel@grendel>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1074011912.2048.5.camel@grendel>
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

> Do a:
> iptables -V
>
> I'm guessing you are running an older version that is not patched for
> this problem (1.2.6a or prior). Here is the original advisory:
> http://www.linuxsecurity.com/advisories/other_advisory-2063.html
>
That's not enough: you need a patched (or later) kernel as well as the bug
actually existed in the netfilter module.  I can't remember OTOMH which
kernel release this went into, although it was much later than the mentioned
version because the kernel team rejected the original fix (for some good
reasons).  I know 2.4.23+ don't have this problem.


