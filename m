From: Richard Hector <rhector@paradise.net.nz>
Subject: Re: Packet sniffing... sort of
Date: Sun, 11 Apr 2004 15:08:53 +1200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040411030853.GA13274@fake>
References: <200404110154.39209.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <200404110154.39209.Antony@Soft-Solutions.co.uk>
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
Content-Transfer-Encoding: 7bit
To: Netfilter <netfilter@lists.netfilter.org>

On Sun, Apr 11, 2004 at 01:54:39AM +0100, Antony Stone wrote:
> 
> I want to pick up a packet stream, but for an HTTPS connection, and using a 
> standard packet sniffer like ethereal just gives me the encrypted SSLv3 
> stuff, not the plaintext data which I need to see.
> 
> Can anyone think how I can see the content of packets from a browser running 
> on my machine, which is posting a form back to a remote server somewhere, 
> using HTTPS?
> 
> I can do anything I want on the client machine (and I can see the source code 
> of the form page too), however when I try sending what I think is the same 
> data back to the server from a Perl program instead of from my browser, the 
> remote server complains at me (and not in a helpful way, either - it says 
> "500 Internal Server Error").

Can you write your perl program in the form of a proxy - so your browser
connects to it in the clear, and it sends the requests on using ssl?
Then you can either dump the traffic from your program, or sniff it
ahead of the proxy in the normal way.

Richard


