From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: examining data portion of packet
Date: Wed, 24 Mar 2004 14:57:26 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1080158245.1995.2.camel@localhost>
References: <20040324172244.84631.qmail@web60001.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: Sandy C <sc_netfiltermail@yahoo.com>
Cc: netfilter@lists.netfilter.org

Have you looked at Snort - http://www.snort.org
that will allow you to look for patterns in the application layer
payload - John

On Wed, 2004-03-24 at 12:22, Sandy C wrote:
> I'd like to be able to examine the network data, and
> if the data (not the header info) matches certain
> criteria, I want to perform certain actions. Its not
> clear to me what those actions might be yet.
> 
> S C 
> 
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
-- 
John A. Sullivan III
Chief Technology Officer
Nexus Management
+1 207-985-7880
john.sullivan@nexusmgmt.com


