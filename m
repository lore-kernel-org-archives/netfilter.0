From: Michael Sconzo <msconzo@net.tamu.edu>
Subject: Odd question with source based blocking
Date: Thu, 26 Aug 2004 16:57:03 -0500
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20040826165702.H1111@net.tamu.edu>
References: <D5C9032B2B09C64EA2409D6214E91AC90512EE@asimail2.alphanumeric.com>
	<1093555992.4293.37.camel@porky>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1093555992.4293.37.camel@porky>;
	from eric@inl.fr on Thu, Aug 26, 2004 at 11:33:12PM +0200
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I have a brief (hopefully) question.

I currently have a box that sits inline with a firewall setup similiar
to the following

FORWARD - Policy - DROP
 * allow DNS
 * allow DHCP
 * all WEB
 * allow all from 192.168.1.0/24 -> BLOCKED
 * allow all to 192.168.1.0/24 -> BLOCKED

BLOCKED
 * Block this IP
 * Block this other IP
 * etc ...

I've tried setting the default policy of BLOCKED to accept, however it
doesn't seem to let traffic through that doesn't match any one of the
'block this IP rule'.

The only catch is, I remove the 'block this IP' rules from the BLOCKED
list, so it makes it hard to ensure an ALLOW rule remains at the
bottom.  Any ideas on how I can do this (default allow traffic not
hitting a rule on BLOCKED to be ALLOWED?

Thanks!
-=Mike

-- 
_
_ Michael J. Sconzo
_ Computing & Information Services, Texas A&M University

The New Testament offers the basis for modern computer coding theory,
in the form of an affirmation of the binary number system.
        But let your communication be Yea, yea; nay, nay: for
        whatsoever is more than these cometh of evil.
                -- Matthew 5:37

