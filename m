From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Are ok those rules to not filter smtp?
Date: Wed, 23 Oct 2002 10:35:49 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210230935.g9N9ZxL02289@vulcan.rissington.net>
References: <02101721054005.10974@linux1.egovernment>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <02101721054005.10974@linux1.egovernment>
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

On Friday 18 October 2002 12:54 am, Alfredo Muchut wrote:

> When I send a mail, there is a delay of  15 second. Why is this problem?

I'd guess it's the remote mail server sending an IDENT request and getting no 
response.

Antony.

-- 

There are two possible outcomes.

If the result confirms the hypothesis, then you've made a measurement.
If the result is contrary to the hypothesis, then you've made a discovery.

 - Enrico Fermi

