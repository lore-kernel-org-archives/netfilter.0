From: Ken Kachnowich <ken.kachnowich@verizon.net>
Subject: Newbie netfi;ter question
Date: Sat, 10 May 2003 10:05:47 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3EBD073B.2050603@verizon.net>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi,

   I have created a very simple module to use netfilters. I
display some info from the sk_buff structures.
The protocol field always has an 8 in it.

What does the 8 mean? I would expect this to indicate this is
an IP packet of some type, but so far I have not found a header
or any docs that explains it. Where would be a good place for me
to find these things out (please don't say read the kernel source).

Thanks,

Ken


