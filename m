From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: iplimit module refuses to work
Date: Mon, 11 Aug 2003 14:31:36 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030811183136.GD11900@cannon.eng.us.uu.net>
References: <63349768828.20030811132640@dslr.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <63349768828.20030811132640@dslr.net>
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
To: justin <justin@dslr.net>
Cc: netfilter@lists.netfilter.org

On Mon, Aug 11, 2003 at 01:26:40PM -0400, cmbb@dslr.net wrote:

> 
> I can't get the iplimit module to work for me,
> this is an SMP AMD machine.
> 
> # iptables -A TcpLimit -m iplimit --iplimit-above 125 -j OverX

Do you have OverX and TcpLimit as chains?

Ramin

> 
> iptables: Invalid argument
> 
> strace -f ...
> 

