From: David Cannings <lists@edeca.net>
Subject: Re: Not forwarding?
Date: Sun, 28 Mar 2004 22:15:59 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403282215.59200.lists@edeca.net>
References: <20040328155231.32b07799@darna.vectec.net> <200403282154.17071.Antony@Soft-Solutions.co.uk> <20040328170733.23247779@darna.vectec.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040328170733.23247779@darna.vectec.net>
Content-Disposition: inline
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

On Sunday 28 March 2004 22:07, Cody Harris wrote:
> I rewrote the rules following your suggestions. It still doesn't work:
> Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
> any    any     anywhere             192.168.0.2        tcp dpt:ssh
> state RELATED,ESTABLISHED

What I meant want a separate rule in FORWARD for established or related 
packets.  However, please see the other mail I have just sent.

David

