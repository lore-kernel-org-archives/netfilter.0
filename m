From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Connection opening problem (prev: FTP/auth problems (slooow links))
Date: Tue, 15 Oct 2002 22:46:54 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021015214657.VOUT292.mta03-svc.ntlworld.com@there>
References: <3DA97045.2040803@solidas.com> <3DAA80EA.7070106@solidas.com> <3DAC86CD.9030506@solidas.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3DAC86CD.9030506@solidas.com>
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

On Tuesday 15 October 2002 10:21 pm, Svein E. Seldal wrote:

> Hello,
>
> The root of my problem was this:
>  > [0:0] -A SYNFLOOD -m limit --limit 1/s --limit-burst 4 -j RETURN
>  > [0:0] -A SYNFLOOD -j DROP
>  > [0:0] -A CHECK -p tcp -m tcp --tcp-flags SYN,RST,ACK SYN -j SYNFLOOD
>
> When the HTTP/FTP-clients etc. spawned several connections (in this case
>  >4) to download files, the router blocked them.
>
> I guess that it adds protection to keep the SYNFLOOD check there. What
> are sensible values to use on -m limit, making it work for flooding, yet
> not stopping normal clients?

I would suggest that 10 connections within one second is reasonable for a 
normal client.

However 30 connections within 3 seconds would seem excessive.

50 concurrent connections within any period of time from one client to one 
server seems unnecessary.

It would be nice if there were a way in netfilter to limit the number of 
half-open connections to/from a given machine - then you could accept all the 
SYNs you liked, so long as they were followed by SYN-ACK and ACK, but SYNs 
without a SYN-ACK, or SYN-ACKs without an answering ACK, would get blocked.

Antony.

-- 

Abandon hope, all ye who enter here.
You'll feel much better about things once you do.

