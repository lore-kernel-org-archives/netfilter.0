From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: open ports
Date: Sun, 16 May 2004 11:09:01 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405161109.01292.Alistair@nerdnet.ca>
References: <BAY15-F22bMcBuxPaYX00067fe4@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BAY15-F22bMcBuxPaYX00067fe4@hotmail.com>
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

On May 16, 2004 05:52 am, azeem ahmad wrote:
> i m also doing so but there is the problem of some programs that some times
> use dynamic ports like msn messenger uses dynamic ports for file transfer
> through it (i think so if it is wrong then tell me please) ad where the log
> will go and can i specify any file instead of the one default
>
> Regards
> Azeem
>

	Your logging is managed by your syslog daemon -- syslog.conf will tell you 
where the log data are written.  The default syslog daemon will not allow 
*too* much granularity on this front, but can be managed.  I've since 
switched to syslog-ng which is more detail oriented, but takes a *lot* more 
reading to manage.

	*with much snippage for brevity*

	Alistair Tonner

