From: "Shaun T. Erickson" <ste@smxy.org>
Subject: OT: split-dns
Date: Tue, 31 Aug 2004 09:34:19 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <41347E5B.5020401@smxy.org>
References: <7C9884991ADAE0479C14F10C858BCDF56794C2@alderaan.smgtec.com>
	<20040831000249.GH20169@metastasis.org.uk>
Reply-To: ste@smxy.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20040831000249.GH20169@metastasis.org.uk>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

Nick Drage wrote:
> On Mon, Aug 30, 2004 at 03:23:58PM -0700, Daniel Chemko wrote:
> 
> 
>>>Not knowing what split-dns was, I googled it. If I understand it
>>>correctly it seems that this is only needed when you use a single,
>>>common domain for both internal and external systems. All our
>>>external systems (both between the firewall and the router, and in
>>>the DMZ) are in "domain.com" and all our internal systems are in
>>>"sub.domain.com", so we don't need split-dns, right?
> 
> 
> Probably a good idea anyway - you probably don't want external users
> using your DNS server in the same way that internal hosts do - i.e.
> making recursive lookups.  Also while it isn't much of an information
> leak, stopping Internet users looking up hosts in sub.domain.com won't
> do any harm.

My DNS here is a bit screwy, having inherited it from my predecessor, 
whom I only recently took over for. The outside name server handles our 
primary domain "y.net", only, so external people cannot look up internal 
hosts, but they can make recursive requests for information about our 
external systems. My internal name server handles our internal domain, 
"x.y.net", and a copy of our external domain, on a Windows box. Clients 
are pointed at the internal name server and the secondary nameserver our 
ISP runs for us.

Clearly, this all needs to be re-done, which I plan to do as soon as my 
shiny new server arrives, which I'll migrate all my services too, 
rebuilding them as I go.

> Also with the use of "view" this is pretty easy to do with BIND 9.  If
> you don't have a copy of "DNS and BIND" 

I do - excellent book.

	-ste

