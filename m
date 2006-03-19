From: "Jay L.T. Cornwall" <jay@esuna.co.uk>
Subject: Re: ipt_owner and ICMP
Date: Sun, 19 Mar 2006 00:26:35 +0000
Message-ID: <441CA53B.6010606@esuna.co.uk>
References: <004801c64aba$9e81b170$0301a8c0@asp> <441CA43E.1040706@zoomnet.ro>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <441CA43E.1040706@zoomnet.ro>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Alexandru Dragoi wrote:

>> This works fine for UDP and TCP, but my outgoing ICMP packets never match
>> the rule. I understand why incoming ICMP should fail to match, but why are
>> outgoing packets missing the filter?

> I think this is because icmp packets are just generated and sent away by
> some part of the kernel after it received a syscall from a program with
> uid 0 (only root can use icmp).

Oh, of course! *slaps head*

Ping was running as setuid root. I feel silly now, thanks for pointing 
that out. :)

-- 
Jay L.T. Cornwall, http://www.esuna.co.uk/~jay/
PhD Student
Imperial College London

