From: Brett Simpson <simpsonb@hillsboroughcounty.org>
Subject: Re: Send local traffic to a different server.
Date: Wed, 23 Jun 2004 12:53:52 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1088009632.4009.92.camel@simpsonb.hillsboroughcounty.org>
References: <s0d956ae.099@GroupWise>
	 <1088005171.2406.5.camel@wslinux-fractal.penson.com>
Reply-To: simpsonb@hillsboroughcounty.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1088005171.2406.5.camel@wslinux-fractal.penson.com>
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
To: "B. McAninch" <bmcaninch@penson.com>
Cc: netfilter@lists.netfilter.org

On Wed, 2004-06-23 at 11:39, B. McAninch wrote:
> Check that you have Netfilter kernel support for 'NAT of local
> connections' (this may or may not help).

The source shows it's enabled. But since the binary Redhat kernel RPM
doesn't always match what's in /usr/src/linux-2.4 do you know of another
way I can check if it's enabled?

[*]     NAT of local connections (READ HELP)  

Thanks,
Brett


