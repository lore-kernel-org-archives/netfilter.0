From: Jim Carter <jimc@math.ucla.edu>
Subject: Re: Connection Tracking
Date: Wed, 8 Oct 2003 09:46:32 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.53.0310080929350.18217@simba.math.ucla.edu>
References: <3F81AA62.7050404@stimulustech.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F81AA62.7050404@stimulustech.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nathan Whittacre <nathan@stimulustech.com>
Cc: netfilter@lists.netfilter.org

On Mon, 6 Oct 2003, Nathan Whittacre wrote:
> The way this protocol works is that the remote computer connects to it
> on port 1066, exchanges some data over the existing connection and then
> the server initiates a connection back to the client on the client's
> port 1066.  This is fine as long as the client has a static, un-NAT'd
> internet IP, but the connection is dropped by the server if it does not
> get a reply from port 1066.  I have a few client machines on a NAT'd
> network that need to connect to this remote server, but with only one

FTP does the same kind of thing except the return port varies; the client
tells the server what port it's listening on.  If you have access to the
NAT box you could perhaps put in a special rule so port 1066 (for the
return connection) was DNATted to just one client's internal IP address and
restricted to just port 1066 rather than the default high-numbered range.
(I assume the client insists on a source port of 1066.)  If it's a
user-owned inexpensive NAT box that you can't configure, you're up the
creek.  I believe the Linksys "Broadband Router" for $80 can do the needed
DNAT.  But then you get into a nightmare of user support issues.

Why the callback?  It really makes things complicated.  If you're trying to
enhance security, as you might with a modem connection, each TCP connection
includes return packets, which will not return if the originator's address
is spoofed.  Also, in principle the Black Hats can invade your ISP and fake
the DNS records.  Much better to use TLS at 4th layer or IPSec at 3rd
layer, and only talk to remote machines that are on your authorization
list.

James F. Carter          Voice 310 825 2897    FAX 310 206 6673
UCLA-Mathnet;  6115 MSA; 405 Hilgard Ave.; Los Angeles, CA, USA  90095-1555
Email: jimc@math.ucla.edu    http://www.math.ucla.edu/~jimc (q.v. for PGP key)

