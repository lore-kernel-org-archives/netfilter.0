From: Jose Celestino <japc@co.sapo.pt>
Subject: Re: nslookup vs. dig
Date: Tue, 11 Jun 2002 12:12:11 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020611111210.GA16001@co.sapo.pt>
References: <Pine.LNX.4.04.10206041555420.15358-100000@lysa> <Pine.LNX.4.04.10206041600230.15358-100000@lysa>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.04.10206041600230.15358-100000@lysa>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org

Words by Michael Montero [Tue, Jun 04, 2002 at 04:02:25PM -0400]:
> However, I'm not sure why digging domains would work consistently all the
> time then suddenly trigger nslookup to work.  To prove it's not some type
> of caching I'll nslookup a domain and get temporary failure in name
> resolution.  Then I'll dig a completely different domain and get results
> successfully.  Then I will return to nslookup the first domain....which I
> did not lookup using dig.  And it resolves.  Everything thereafter
> resolves fine.
> 
> If however, I then do:
> 
> nslookup
> 
> server [any name server]
> some.domain.com
> 
> It fails....times out.  All the time.  I'm assuming my rules are blocking
> this.  I'm just not sure how.....how the dig utility differs from
> nslookup.
> 

Dig doesn't try to resolve the reverse for the dns server and fail if it
can't. Check it out.


-- 
Jose Celestino <japc@co.sapo.pt> SAPO.pt::Systems http://www.sapo.pt
---------------------------------------------------------------------
Quod licet Iovi non licet bovi.
(What Jove may do, is not permitted to a cow.)

