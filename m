From: "John A. Sullivan III" <jsullivan@opensourcedevelopmentcorp.com>
Subject: Re: Guaranteeing bandwidth through netfilter-based router?
Date: Thu, 06 Jan 2005 21:25:16 -0500
Message-ID: <1105064717.7100.78.camel@localhost>
References: <132A17DB-6023-11D9-BC93-000A95CFE5AA@latencyzero.com>
	<20050106222649.GA26877@acentral.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050106222649.GA26877@acentral.co.uk>
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
To: Gavin Hamill <gdh@acentral.co.uk>
Cc: Netfilter users list <netfilter@lists.netfilter.org>

On Thu, 2005-01-06 at 22:26 +0000, Gavin Hamill wrote:
> On Thu, Jan 06, 2005 at 12:39:34PM -0800, Rick Mann wrote:
> > Hi. I have a netfilter-based router set up on Fedora Core 2 that's 
> > working very well. However, one of the things I run behind it is a VoIP 
> > box, and sometimes voice quality suffers if other hosts are consuming 
> > bandwidth.
> > 
> > Is there a way to give priority to UDP traffic to/from a particular 
> > host, without permanently reserving bandwidth for it?
> 
> You're on the wrong list :)
> 
> http://lartc.org/
> 
> http://lartc.org/wondershaper/
> 
> Good luck! :D
> 
> Cheers,
> Gavin.
> 
> 
Not really, there are pertinent elements of netfilter.  Linux will to
some rudimentary traffic shaping based upon the TOS bits.  One can
change those in the mangle table.  Set the VoIP packets as best as you
can identify them with TOS of minimize-delay - John
-- 
John A. Sullivan III
Open Source Development Corporation
+1 207-985-7880
jsullivan@opensourcedevel.com

If you would like to participate in the development of an open source
enterprise class network security management system, please visit
http://iscs.sourceforge.net


