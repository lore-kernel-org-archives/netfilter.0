From: Nick Drage <nickd@funkyjesus.org>
Subject: Re: ICMP question
Date: Sun, 24 Nov 2002 16:34:38 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021124163438.A14289@funkyjesus.org>
References: <NABBIDJPNCAGKGOFGHBFOELFPIAA.luba@assist.com.gt> <IMEDICLPAGAOCBLCCKLPGELFEFAA.homes@darrelldieringer.com>
Reply-To: Netfilter Mailing List <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <IMEDICLPAGAOCBLCCKLPGELFEFAA.homes@darrelldieringer.com>; from homes@darrelldieringer.com on Thu, Nov 14, 2002 at 03:47:18PM -0600
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

On Thu, Nov 14, 2002 at 03:47:18PM -0600, Darrell F. Dieringer wrote:
> 
> Anyone please feel free to correct me if I'm wrong, but I think your
> original rules would work fine if your "ESTABLISHED" rule was changed
> to "ESTABLISHED,RELATED".  Perhaps the "NEW,ESTABLISHED" rule should
> also say "NEW,ESTABLISHED,RELATED" as well.
> 
> If your internal machine issues an "echo request", the "echo reply"
> will be a "RELATED" packet.  (I'd use icmp type numbers, but I don't
> know them off the top of my head.)

/usr/include/netinet/ip_icmp.h

Is always handy for this kind of thing ( 8 and 0 respectively ).

-- 
FunkyJesus System Administration Team


