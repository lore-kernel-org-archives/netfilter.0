From: Michael Rash <mbr@cipherdyne.org>
Subject: Re: examining data portion of packet
Date: Thu, 25 Mar 2004 14:53:33 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040325195333.GA31680@orthanc.gambrl01.md.comcast.net>
References: <1080129035.1980.0.camel@localhost> <20040324172244.84631.qmail@web60001.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20040324172244.84631.qmail@web60001.mail.yahoo.com>
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
To: Sandy C <sc_netfiltermail@yahoo.com>
Cc: netfilter@lists.netfilter.org

On Mar 24, 2004, Sandy C wrote:

> I'd like to be able to examine the network data, and
> if the data (not the header info) matches certain
> criteria, I want to perform certain actions. Its not
> clear to me what those actions might be yet.

Sounds like you may be looking for an "active response" capability.
Here are three pieces of software that can react based on
application layer data:

snortsam:       http://www.snortsam.net/
fwsnort:        http://www.cipherdyne.org/fwsnort/
snort_inline:   http://snort-inline.sourceforge.net/

Deploying such functionality essentially give the capability to the
network of reconfiguring itself based on signatures that can easily
generate false positives!  You have been warned.

--Mike

Michael Rash
http://www.cipherdyne.org/
Key fingerprint = 53EA 13EA 472E 3771 894F  AC69 95D8 5D6B A742 839F


> --- "John A. Sullivan III"
> <john.sullivan@nexusmgmt.com> wrote:
> > On Wed, 2004-03-24 at 00:45, Sandy C wrote:
> > >    I would like to be able to be able to examine
> > the
> > > data portion of a network packet after matching
> > it. 
> > > 
> ..
> > >    What is the best way to go about this? Should I
> > be
> > > thinking of writing a target extension?
> > <snip>
> > It depends on what you want to do.  What do you want
> > to do with the
> > information?
> > -- 
> > John A. Sullivan III
> 
> 
> __________________________________
> Do you Yahoo!?
> Yahoo! Finance Tax Center - File online. File on time.
> http://taxes.yahoo.com/filing.html


