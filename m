From: David Cannings <lists@edeca.net>
Subject: Re: FW: Filtering multiple networks
Date: Mon, 31 May 2004 11:44:26 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405311144.26516.lists@edeca.net>
References: <E1BUk4b-0006Wv-Cf@vishnu.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <E1BUk4b-0006Wv-Cf@vishnu.netfilter.org>
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

On Monday 31 May 2004 11:32, Markus Zeilinger wrote:
> - Thy is DROP bad here? As I see REJECT would send an error message
> back to the source, but this would not make any sense on packets coming
> on the WAN interface with private IP addresses, or am I wrong?

You are not wrong.  Personally I would DROP any bogons coming in on a WAN 
interface.  REJECT does not make sense in this case, if they are 
unallocated or hijacked blocks the replies will not make it anyway.  If 
they are RFC1918 addresses that you are using internally, the replies 
would be sent to your LAN which would not be desirable.

David

