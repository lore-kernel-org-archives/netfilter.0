From: Jason Opperisano <opie@817west.com>
Subject: Re: original destination IP address
Date: Wed, 27 Apr 2005 11:09:46 -0400
Message-ID: <20050427150946.GA22994@bender.817west.com>
References: <000801c54ab7$4e244e80$2201a8c0@compaq>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <000801c54ab7$4e244e80$2201a8c0@compaq>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Wed, Apr 27, 2005 at 06:25:53AM +0700, Ken Hilliard wrote:
> When using the REDIRECT target (e.g., doing transparent web proxying)
> the packet's destination IP address is mangled to 127.0.0.0.

no--it's not.  this is the most common misconception i see.  
"-j REDIRECT" rewrites the destination IP to be the IP address of the
input interface.  if you try to write a filter rule to allow this
traffic--this becomes a useful tidbit.

> When using
> proxy web servers like Apache or Squid do they automatically retrieve
> the original destination IP address?

they use the HTTP Host: Header to determine the origin server to fetch
the content from.

> For HTTP v1.1 the host is included
> in the request header so the proxy does not strictly need it. But HTTP
> v1.0 does not contain the host name/IP address. I've read there is a
> netfilter version of the getsockopt function. Do they use this or some
> other mechanism?

whatcha talkin' 'bout, willis?  the GET request specifies HTTP/1.0 or
HTTP/1.1, the Host: Header is sent separately whether the GET is 1.0
or 1.1.  if what you're saying was accurate, name-based virtual hosting
wouldn't work with HTTP/1.0...and um--it does...

here's a snippet of lynx tracelog that shows this:

GET / HTTP/1.0\r
Host: foo.817west.com\r
Accept: text/html, text/plain, application/x-ica, text/sgml, video/mpeg,
image/j
peg, image/tiff, image/x-rgb, image/png, image/x-xbitmap, image/x-xbm,
image/gif
, application/postscript, */*;q=0.01\r
Accept-Language: en\r
User-Agent: Lynx/2.8.5rel.1 libwww-FM/2.14 SSL-MM/1.4.1 OpenSSL/0.9.7e\r
\r

-j

--
"Chris: Cheesy Charlie's is great. They have a game where you put in a
 dollar and you get four quarters. I win every time."
        --Family Guy

