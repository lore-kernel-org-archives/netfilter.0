From: Jim Laurino <nfcan.x.jimlaur@dfgh.net>
Subject: Re: dhcp windows client port (nfcan: addressed to exclusive sender
	for this address)
Date: Sat, 12 Nov 2005 22:13:35 -0500
Message-ID: <20051113031335.GC28723@salty>
References: <BAY102-F1641FB10F962FBD8A6F79EAE580@phx.gbl>
Reply-To: nfcan.x.jimlaur@dfgh.net
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <BAY102-F1641FB10F962FBD8A6F79EAE580@phx.gbl> (from
	+nfcan+jimlaur+957286d880.props666999#hotmail.com@spamgourmet.com
	on Sat, Nov 12, 2005 at 18:27:32 -0500)
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
Content-Type: text/plain; format="Flowed"; delsp="Yes"; charset="us-ascii"
To: netfilter@lists.netfilter.org

On 2005.11.12 18:27, P theodorou - props666999@hotmail.com wrote:
> Hello again
> 
> Anybody knows where can i find scripts  with very restricted policies ?
> If someone could suggest some  would be very appreciated

You can not have a more restrictive filter rule set
than the one Rob Sterenborg already gave you.

Your original statement:

>> I wish the windows machine which receives Internet
>> from the firewall pc to be restricted fully
>> apart from the port needed to access the internet.

is ambiguous, because "the internet" is *everything*,
but you did use the singular, "the port".

So I am responding to what I think you
might be trying to accomplish.

My guess is you mean something more like "the web".

I think you mean that you want
to restrict the pc to just "web browsing".

If this guess is correct, then
what you need to understand is that this
is not really a job that a firewall can do.

A firewall can restrict the pc to access
just tcp port 80, but that does not really
restrict what kind of traffic can flow.

My guess is that making the pc use
a proxy web server may do what you want.

For Linux, you could look at squid:

http://www.squid-cache.org/

I hope that helps.

-- 
Jim Laurino
nfcan.x.jimlaur@dfgh.net
Please reply to the list.
Only mail from the listserver reaches this address.

