From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Active Directory
Date: Wed, 9 Oct 2002 22:25:28 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021009212530.KYBL459.mta02-svc.ntlworld.com@there>
References: <AF435BB1224A4C4888B58C546728EE32300F@s2.valiant.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <AF435BB1224A4C4888B58C546728EE32300F@s2.valiant.com>
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

On Wednesday 09 October 2002 4:00 pm, Keith R. Weiner wrote:

> Here is my scenario:
>
> I have a domain controller on the inside with an address of 192.168.0.5
> (255.255.255.0).
> In the DMZ is a domain controller to be with an address of 192.168.100.5
> (255.255.0.0).

I hope that is a typo, and the second netmask should really be 255.255.255.0 ?

If not, then you've got two overlapping networks (addresses 192.168.0.x fall 
into both ranges), and this is Not a Good Idea.

Antony.

-- 

If at first you don't succeed, destroy all the evidence that you tried.

