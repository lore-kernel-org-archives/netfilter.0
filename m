From: Nick Drage <nickd@funkyjesus.org>
Subject: Re: IPSEC and other non tcp/udp/icmp blocking
Date: Mon, 14 Oct 2002 15:31:41 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021014153141.D3805@funkyjesus.org>
References: <41791.64.86.49.17.1034369123.squirrel@www.icafe.co.tz>
Reply-To: Nick Drage <nickd@funkyjesus.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <41791.64.86.49.17.1034369123.squirrel@www.icafe.co.tz>; from murli@icafe.co.tz on Fri, Oct 11, 2002 at 11:45:23PM +0300
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

On Fri, Oct 11, 2002 at 11:45:23PM +0300, Mitesh P Choksi wrote:
> Dear All,
> 
> How does netfilter work with other protocols apart tcp/udp/icmp?
> 
> I am trying to either block or account IPSec traffic.

See the "--protocol" section in the man pages.

-- 
FunkyJesus System Administration Team


