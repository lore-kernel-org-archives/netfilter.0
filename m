From: Jason Opperisano <opie@817west.com>
Subject: Re: pptp
Date: Fri, 15 Oct 2004 10:10:36 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20041015141036.GA6848@bender.817west.com>
References: <20041015063914.GA23147@plain.ev1servers.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20041015063914.GA23147@plain.ev1servers.net>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Fri, Oct 15, 2004 at 01:39:14AM -0500, K. Shantanu  wrote:
> Hi,
> I have just installed Mandrake Linux 10.0 (Official). Kernel Used is  2.6.3-7mdksmp.
> I want to connect to my client's PPTP server from a windows based pptp client.
> Are there any gotchas for the same? Or do I just need to open port 47 and 1723, 
> protocol tcp for it?

yes--if your are performing SNAT/MASQ for your entire internal network
on your gateway, it won't work.  there is a PPTP conntrack and nat module
in POM for this situation, but it will only compile against a 2.4 kernel.

one option would be to give the PPTP client a dedicated public IP and
perform a one-to-one SNAT/DNAT for that client and allow TCP 1723 and
IP protocol 47 outbound from that client and IP protocol 47 inbound to
that client from the PPTP server.

-j

-- 
Jason Opperisano <opie@817west.com>

