From: Michael Gale <michael.gale@pason.com>
Subject: Re: Multiple PPTP connections from same public IP ?
Date: Wed, 01 Aug 2007 13:38:32 -0600
Message-ID: <46B0E138.6040505@pason.com>
References: <46AFAB54.5020602@pason.com> <46AFB3E3.4050505@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <46AFB3E3.4050505@plouf.fr.eu.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@lists.netfilter.org

Hey,

	Thanks for the reply, I will look into upgrading this kernel.

Michael


Pascal Hambourg wrote:
> Hello,
> 
> Michael Gale wrote :
>>
>> Am I correct that mutliple GRE (proto 47) tunnels would be a problem 
>> when the clients have the same IP address ?
> 
> Yes, unless the NAT in "firewall A" has PPTP support.
> 
>> We are running the standard kernel 2.6.9-42.0.3.EL.
> 
> On "firewall A" ? If so, can't you use a more recent kernel ? PPTP 
> conntrack and NAT support, formerly in the patch-o-matic-ng, was added 
> in the mainline kernel in version 2.6.14.
> 

-- 
Michael Gale

Red Hat Certified Engineer
Network Administrator
Pason Systems Corp.

"Life is not easy for any of us, but what of that? We must have perseverance and above all confidence in ourselves. We must believe that we are gifted in something, and 
that this thing, at whatever cost, must be attained."

Marie Curie
French (Polish-born) chemist & physicist (1867 - 1934)

