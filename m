From: Craig Davison <cd@securityfocus.com>
Subject: Re: Link time problems with libipq example code
Date: Mon, 23 Dec 2002 11:07:51 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021223180751.GA16194@securityfocus.com>
References: <20021220224405.GB28191@securityfocus.com> <Pine.LNX.4.43.0212211048490.286-100000@abodh.pesit.deeproot.co.in>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.43.0212211048490.286-100000@abodh.pesit.deeproot.co.in>
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
Content-Transfer-Encoding: 7bit
To: "Narendra Prabhu. B" <naren@deeproot.co.in>
Cc: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

That did it - thanks!

-- 
Craig Davison
Symantec Corporation
+1 (403) 213-3939 ext. 228

On Sat, Dec 21, 2002 at 10:59:43AM +0530, Narendra Prabhu. B wrote:
> Hi,
> 
> Yes, even I have come across such problems.... I just complied it using
> the following command.
> 
> $gcc -I/usr/local/include -L/usr/local/lib -o ipqtst ipqtst.c -lipq
> 
> Just notice that I have put "-lipq" in the end... Well, I have not been
> able to reason, why it works this way. Its probably the gcc issue.


