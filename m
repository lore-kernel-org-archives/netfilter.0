From: James Rhett Aultman <jaultman@cise.ufl.edu>
Subject: Re: running commands when packet matched
Date: Mon, 05 Dec 2005 12:48:18 -0500
Message-ID: <43947D62.40407@cise.ufl.edu>
References: <43921EA4.7060905@cise.ufl.edu> <1133655073.17460.4.camel@porky>
	<4394784C.8030800@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4394784C.8030800@gmail.com>
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
To: Georgi Alexandrov <georgi.alexandrov@gmail.com>, netfilter@lists.netfilter.org

Georgi Alexandrov wrote:

> Danger Will Robinson: Conventional wisdom says that auto-blocking is
> inherently dangerous."


Actually, for what I'm trying to do, switching to userspace is probably
not that dangerous.  The reason is because I am trying to match one
packet, then the rule for the matching is actually switched off.  In
other words, I want to match a single packet, run some user code, then
remove the rule for matching that packet.  Given this, I can't see how
the scenario you've laid out would be that big of a threat.

--
Rhett.

