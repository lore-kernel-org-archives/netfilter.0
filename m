From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Problems with Transparent Proxy using IPTables, Squid and 2.6 kernel
Date: Thu, 8 Jan 2004 17:02:57 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401081702.57180.Antony@Soft-Solutions.co.uk>
References: <9C537DF4-41FB-11D8-AFEE-000393677A36@porchlight.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <9C537DF4-41FB-11D8-AFEE-000393677A36@porchlight.ca>
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

On Thursday 08 January 2004 4:56 pm, Peter Schobel wrote:

> I have a server that was running a transparent redirection proxy - i
> was using 2.4.20 kernel on this system and i recently upgraded to
> 2.6.0.107 kernel package for redhat 9
>
> Ever since i did the kernel upgrade the proxy does not work correctly.

Have you recompiled the userspace iptables to match the new kernelspace 
netfilter?

Does Squid seem to work correctly as a proxy if you configure your client 
browser to use it specifically, rather than doing it transparently?

Antony.

-- 
If the human brain were so simple that we could understand it,
we'd be so simple that we couldn't.

                                                     Please reply to the list;
                                                           please don't CC me.


