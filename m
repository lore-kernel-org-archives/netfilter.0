From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: FW: block + kill connections
Date: Sun, 8 Jan 2006 17:28:01 -0600
Message-ID: <200601081728.01152.rob0@gmx.co.uk>
References: <000101c614a7$70964cb0$2801a8c0@MBRC40>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <000101c614a7$70964cb0$2801a8c0@MBRC40>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

On Sunday 2006-January-08 17:01, Michael D. Berger wrote:
> > > I have the same problem.  I DROP in the INPUT chain, but
> > > the connection stays up

Likely so, insofar as your local process knows, as explained in my 
corrected reply to Bob Nichols. But ...

> > > and receives more junk. 

No, not if you used a rule as the OP did, with -I to put it at the top 
of INPUT rules. If a packet matches the first DROP rule, that's where 
it stops. If a --state RELATED,ESTABLISHED -j ACCEPT rule precedes the 
DROP, yes, but that's a different issue.

> > > I await admonition by those more knowledgeable than I.

Does it make sense now?
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

