From: Gavin Hamill <gdh@acentral.co.uk>
Subject: Re: netfilter and iproute2
Date: Thu, 19 Aug 2004 18:57:50 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040819175750.GA5618@acentral.co.uk>
References: <D5C9032B2B09C64EA2409D6214E91AC90512AC@asimail2.alphanumeric.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <D5C9032B2B09C64EA2409D6214E91AC90512AC@asimail2.alphanumeric.com>
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
To: netfilter@lists.netfilter.org

On Thu, Aug 19, 2004 at 01:44:21PM -0400, Jason Opperisano wrote:
> yeah--your marks don't match.  the output of "iptables -t mangle -vnL"
> shows you a mark of 0x32 (which is what 50 becomes in hex), whereas
> your "ip rule" is looking for a mark of "50." change one of them.

Ah ha! :)

Well done, Jason - I had no idea it could be a simple mixup between 
different bases - it's now working like a charm - have a gold star and a
choc-chip cookie =)

gdh

