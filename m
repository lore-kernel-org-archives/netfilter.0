From: "Andrew E. Mileski" <andrewm@isoar.ca>
Subject: Re: Unable to apply pptp conntrack patch
Date: Fri, 14 May 2004 10:46:33 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40A4DBC9.6000702@isoar.ca>
References: <Pine.LNX.4.33.0405141253510.21804-100000@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.33.0405141253510.21804-100000@blackhole.kfki.hu>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Jozsef Kadlecsik wrote:
> 
> Your kernel, iptables source and patch-o-matic versions are too old:
> oldest supported kernel is 2.4.23, iptables is 1.2.10 (from cvs).
> And definitely use newer pom-ng.

Since this has been asked before, and I have some RPMS on hand...

I've made 2.4.22-1.2149.nptl.pptp available at:
   http://isoar.ca/ftp/~andrewm/redhat/RPMS
   http://isoar.ca/ftp/~andrewm/redhat/SRPMS
The required updated iptables can also be found there.

I've tested this kernel against Intel's Centrino VPN test suite on an
Intel provided validation system, and it passed.  An Intel rep should be
by the office next week for a spot-check, so the kernel should gain
certification *knocks on wood*

For a newer kernel, my hacks to the spec file for patch-o-matic can be
used to build your own RPMS.  The iptables package just needs to be
re-compiled against the updated kernel headers.

-- 
Andrew E. Mileski

