From: Alexis <alexis@attla.net.ar>
Subject: Re: Rules for DNS
Date: Thu, 29 Jan 2004 12:47:13 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1075391233.10439.14.camel@noc2tuh.dcn>
References: <1075389910.2794.6.camel@dchws.TQMcube.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1075389910.2794.6.camel@dchws.TQMcube.com>
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
To: netfilter <netfilter@lists.netfilter.org>

DNS's uses udp/53 for querys and tcp/53 for zone transfers
tcp/53 is used for querys too if it exceeds 512 bytes.

M$ Windows uses tcp and udp for querys, without look the size, so for
mswin to work, you need to open both ports.

be extremely carefull if you are natting the dns server.



On Thu, 2004-01-29 at 12:25, David C. Hart wrote:
> I am terribly confused about what I need to accept and reject and the
> associated IPTables rules for Bind to work properly without exposing our
> server to exploits. Right now, I'm pretty much accepting all traffic to
> and from port 53 and that's "probably" not a good thing. I'm running
> IPtables on the same machine running Bind.
> 
> Can someone point me in the right direction?
> 
> Thanks.
>                                ---------
>             Quality Management - A Commitment to Excellence
-- 
Alexis <alexis@attla.net.ar>


