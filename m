From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: RELATED emulation without ip_conntrack
Date: Wed, 23 Oct 2002 16:17:56 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210231518.g9NFI4L02942@vulcan.rissington.net>
References: <200210231602.00745.roy@karlsbakk.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200210231602.00745.roy@karlsbakk.net>
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
To: Netfilter mailinglist <netfilter@lists.netfilter.org>

On Wednesday 23 October 2002 3:02 pm, Roy Sigurd Karlsbakk wrote:

> hi
>
> I've got this video server streaming @ ~250Mbps, so I really don't want to
> waste cpu cycles on ip_conntrack.
>
> how can I test for tcp flags to allow me to do a poor-man's-conntrack?

Treat packets with SYN set, and ACK, FIN and RST clear as NEW connections.

Treat packets with SYN and ACK set, FIN and RST clear as NEW replies.

Treat packets with ACK set, SYN, FIN and RST clear as ESTABLISHED connections.

Treat packets with FIN or RST set (probably ACK too) as terminating 
connections.

Antony.

-- 

Most people have more than the average number of legs.

