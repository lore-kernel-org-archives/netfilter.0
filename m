From: Jim Carter <jimc@math.ucla.edu>
Subject: Re: Connection Tracking
Date: Wed, 8 Oct 2003 11:09:40 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.53.0310081100450.18217@simba.math.ucla.edu>
References: <3F81AA62.7050404@stimulustech.com>
 <Pine.LNX.4.53.0310080929350.18217@simba.math.ucla.edu> <3F844C62.5080804@stimulustech.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F844C62.5080804@stimulustech.com>
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

On Wed, 8 Oct 2003, Nathan Whittacre wrote:
> We do have control over the Nat box.  It is a custom Linux router that
> we put in for these clients.  The biggest problem with the DNATing to a
> specific internat IP is that several client computers will want to use
> it at different times.  So, I don't want to have to change the DNATing
> every time a different computer wants to connect.

Bummer.  You might plagarize the code from the FTP helper module,
designating the return connection to the NAT box's port 1066 as "related",
which you would then allow through the firewall and which would be
de-NATted so it went to whichever client the original connection belonged
to.  It would be a whole lot easier if the client would accept the return
connection from an arbitrary source port (not just the mainframe's 1066),
so you won't have to think about conntracks hanging around, if a connection
shuts down uncleanly -- as far as the helper module is concerned,
arbitrarily many clients can use the service at once, with different source
ports, even if there's a limit at the mainframe.

But I've never actually tried doing this kind of thing.  Other people on
the list, however, do seem to successfully make special modules.  "Let's
you and him fight" :-)

James F. Carter          Voice 310 825 2897    FAX 310 206 6673
UCLA-Mathnet;  6115 MSA; 405 Hilgard Ave.; Los Angeles, CA, USA  90095-1555
Email: jimc@math.ucla.edu    http://www.math.ucla.edu/~jimc (q.v. for PGP key)

