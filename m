From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: DNAT possible with the string module?
Date: Mon, 4 Nov 2002 19:57:35 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021104195745.DUTJ27595.mta05-svc.ntlworld.com@there>
References: <aq64dg$4br$1@hermes.vibe.ac>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <aq64dg$4br$1@hermes.vibe.ac>
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

On Monday 04 November 2002 3:40 pm, Udo Rader wrote:

> hi,
>
> I would like to do the following thing:
>
> 2 daemons listening on different ports (lets say 1234 and 2345).
>
> The firewall then ideally takes all connects from clients to port 1234,
> looks for a "magic string" (using -m string) in the packages and based
> upon the (non)existance of the string finally decides, which daemon to
> forward the connect to.
>
> ... is there a chance for this to work?

I think the answer is no, it cannot work (assuming you are talking about TCP 
ports and not UDP ports).

The reason is as follows:

Before a client can send the magic string you are looking for, it needs to 
have completed the TCP handshake of SYN - SYN/ACK - ACK, because it's only 
after that's done that any data gets transferred between the systems.

Obviously the SYN and the SYN/ACK are to and from a specific port number on 
the listening server, so by the time you get to see the magic string, the 
choice of port number to connect to has already been made.

Antony.

-- 

If the human brain were so simple that we could understand it,
we'd be so simple that we couldn't.

