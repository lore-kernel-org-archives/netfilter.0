From: Michael Montero <mmontero@mail.communityconnect.com>
Subject: Re: nslookup vs. dig
Date: Tue, 4 Jun 2002 16:02:25 -0400 (EDT)
Sender: netfilter-admin@lists.samba.org
Message-ID: <Pine.LNX.4.04.10206041600230.15358-100000@lysa>
References: <Pine.LNX.4.04.10206041555420.15358-100000@lysa>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <Pine.LNX.4.04.10206041555420.15358-100000@lysa>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ramin Alidousti <ramin@cannon.eng.us.uu.net>
Cc: netfilter@lists.samba.org

However, I'm not sure why digging domains would work consistently all the
time then suddenly trigger nslookup to work.  To prove it's not some type
of caching I'll nslookup a domain and get temporary failure in name
resolution.  Then I'll dig a completely different domain and get results
successfully.  Then I will return to nslookup the first domain....which I
did not lookup using dig.  And it resolves.  Everything thereafter
resolves fine.

If however, I then do:

nslookup

server [any name server]
some.domain.com

It fails....times out.  All the time.  I'm assuming my rules are blocking
this.  I'm just not sure how.....how the dig utility differs from
nslookup.

-----  Your Message May Appear Below This Line

On Tue, 4 Jun 2002, Michael Montero wrote:

> No, most certainly not.  That's been covered already.  I used to run
> ipchains.....problem didn't exist with my simplistic rules.  When I got a
> little more serious and installed ip_tables the problem began.
> 
> 
> 
> 



