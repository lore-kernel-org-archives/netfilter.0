From: "Peter E. Fry" <pfry@redsword.com>
Subject: Re: Is dropping all ICMP traffic valid?
Date: Tue, 12 Nov 2002 19:32:21 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DD15745.1378.3D1FB1@localhost>
References: <1037143537.8023.4.camel@trent.nin>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <20021113010119.NUVS26478.mta05-svc.ntlworld.com@there>
Content-description: Mail message body
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

On 13 Nov 2002 at 1:01, Antony Stone wrote:

> ICMP type 3 code 4 is Source Quench - not very common these days, but
> important to let through if you run systems which use it.

  The only stack I've seen use source quench is the old Mac stack, 
and it sent 'em gratuitously.  Funny -- I can't bloody well remember 
how I found that out.  I must've shared a LAN with a Mac at some 
point.
  I just wanted to point that out, to those who see lots of 
"quenches" on the Internet.  I'd never advocate dropping all ICMP.

[...]

Peter E. Fry


