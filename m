From: Filip Sneppe <filip.sneppe@uptime.be>
Subject: Re: Packet sniffing... sort of
Date: Sun, 11 Apr 2004 03:34:08 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1081647247.2602.1.camel@xbox>
References: <200404110154.39209.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200404110154.39209.Antony@Soft-Solutions.co.uk>
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
To: Netfilter <netfilter@lists.netfilter.org>

On Sun, 2004-04-11 at 02:54, Antony Stone wrote:

> Can anyone think how I can see the content of packets from a browser running 
> on my machine, which is posting a form back to a remote server somewhere, 
> using HTTPS?
> 
Hi Antony,

Take a look at ssldump - it does exactly what you want. But you'll need
access to the server as ssldump will need the server's private key.

Regards,
Filip


