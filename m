From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: I have no idea why this doesn't work...
Date: Thu, 22 Apr 2004 20:43:27 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404222043.27743.Antony@Soft-Solutions.co.uk>
References: <6.0.0.22.0.20040422085041.03eb3ec0@mail.garisonpiatt.com> <200404222023.24672.Antony@Soft-Solutions.co.uk>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200404222023.24672.Antony@Soft-Solutions.co.uk>
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

On Thursday 22 April 2004 8:23 pm, Antony Stone wrote:

> On Thursday 22 April 2004 7:58 pm, Garison Piatt wrote:
>
> > Below is a pared-down combination of several example scripts which did
> > something reasonably close to what I want.  When I run this, however, I
> > lose FTP, and who-knows-what-else.
>
> Your posted ruleset *is* very long, yes, and by your own admission you're
> not quite sure what you're doing, so I recommend that you start simple and
> build up, ensuring there are no problems at each stage, so that when a
> problem does crop up, you know it must be the small part you just changed,
> rather than "somewhere in this great long script I've got".

Sorry for replying to my own posting, but I've just looked at your script in a 
bit more detail, and I immediately notice how many user-defined chains you 
have.   I think this is unnecessarily complicating things for you (and us, 
trying to read the script), so I suggest you remove (comment-out) as many as 
possible (the ones which block 'bad' packets for example - you can do without 
those whilst you're getting the firewall working, and then add them in again 
later to add some bells & whistles to a system which is by then doing the 
basic job okay).

I'm sticking to my previously-stated philosophy of "start simple and build up 
gradually, checking for problems at each stage", since it makes the debuggign 
process of working out where the problem crept in much easier.

Regards,

Antony.

-- 
The truth is rarely pure, and never simple.

 - Oscar Wilde

                                                     Please reply to the list;
                                                           please don't CC me.


