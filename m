From: Nick Drage <nickd@metastasis.org.uk>
Subject: Re: learning firewall
Date: Fri, 3 Sep 2004 11:25:43 +0100
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20040903102543.GI3755@metastasis.org.uk>
References: <20040902191645.GA28800@omega.lacnic.net.uy>
Reply-To: Netfilter Mailing List <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20040902191645.GA28800@omega.lacnic.net.uy>
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

On Thu, Sep 02, 2004 at 04:16:45PM -0300, Pablo Allietti wrote:

> hi all i have a question. 
> 
> exist any soft based in iptables to have the option LEARN ?? 
> 
> example 
> 
> i run snort in my system when detect a intrusion add the ip address to
> the iptables table. 
> 
> exist this ??

As well as snort the program "fwlogwatch" has a daemon option you can
use.  I haven't used it myself, so I can only tell you it's there,
rather than how useful it is.

-- 
mors omnia vincit

