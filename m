From: Jason Opperisano <opie@817west.com>
Subject: Re: Policy Misunderstanding: RTFM Guidance Requested.
Date: Wed, 01 Sep 2004 12:50:58 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1094057457.1824.11.camel@wolfpack.ljm.dom>
References: <200409011323.i81DNQAi040521@jkcpub.iserver.net>
	<8ca4228204090108466549b5f3@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <8ca4228204090108466549b5f3@mail.gmail.com>
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
To: netfilter@lists.netfilter.org

On Wed, 2004-09-01 at 11:46, Mike wrote:
> Hi Deepak,
> 
> Thank you for your response.
> 
> On Wed, 1 Sep 2004 09:27:22 -0400, Deepak Seshadri
> <dseshadri@broadbandmaritime.com> wrote:
> > 
> > If the default policy on your mangle & Nat chain is set to DROP & if you
> > have no rules to classify traffic in these tables, all your packets will get
> > dropped here. They will not make it to the FILTER table.
> 
> This is a good point and shows where maybe I am starting to MIS-understand.  
> 
> 1.  Can appended rules override default polices? 

yes--for example:

iptables -P INPUT DROP
iptables -A INPUT -j ACCEPT

will accept all traffic in the INPUT chain.  the POLICY of a chain is
only enforced when a packet reaches the last rule in that chain and
hasn't matched any rules.

> 2.  Do you need to include appended rules to parts of the iptables
> chain that you are not using, or else all the packets will get
> dropped?  For example, do you have to set Mangle rules even if you are
> not using any Mangling but have set a DROP policy for mangling.

if you set the policies of the mangle chains to DROP and then do not
append any rules, you can be pretty sure that no traffic will get
through.

i'd recommend against starting your netfilter adventure by setting the
policies of nat & mangle chains to DROP.  it will make it a very short
trip...

-j

-- 
Jason Opperisano <opie@817west.com>


