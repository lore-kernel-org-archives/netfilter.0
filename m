From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: Netfilter vs commercial
Date: Wed, 11 Aug 2004 16:31:26 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <411A902E.1010404@pbl.ca>
References: <20040809093022.5842e85e@mgalepc.utilitran.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040809093022.5842e85e@mgalepc.utilitran.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Michael Gale wrote:
> Hello,
> 
> 	I know this question has most likely come up a few times and most people ask about performance and through put. But my
> question seems to me a little different.
> 
> I would like to know how people on this list ... which I know might be a biased opinion feel how a Netfilter firewall
> box .. properly configured would compare in security to a commercial firewall. 

I'd say that security is at about same level, if you keep the products 
updated to the latest release, and if you do not have applications 
running on the firewall itself (like you do, squid is appliaction).

Use product that you feel comfortable with, and that has features you 
need.  No point in using Netfilter if it lacks a feature from CheckPoint 
that you need.  Or using CheckPoint if it lacks a feature from Netfilter 
that you need.

Sadly, at some places that I used to work in the past (luckily not 
working there anymore), the two main arguments (usually used by higher 
management) for going commercial was that "if we pay, we will have 
someboy to blame when things are not working".  And "commercial looks 
more professional".  Totally stupid and neither of those has anything 
with common sense.  Hope it will not be the case at your place.

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

