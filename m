From: Alexis <alexis@attla.net.ar>
Subject: Re: IPTables, Linksys BEFSR41 and PCAnywhere
Date: Thu, 15 Jan 2004 15:18:43 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1074190723.1570.10.camel@pepelui.baicom>
References: <000a01c3db92$465416d0$0f00a8c0@tandem>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000a01c3db92$465416d0$0f00a8c0@tandem>
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

youre right, just dont forget that pc anywhere uses 2 ports, that i
think they are 5631 and 5631 tcp

the linksys is with nat enabled? (its just to know, forwarding the ports
is enough to work)


On Thu, 2004-01-15 at 15:06, A. Clausen wrote:
> We are using netfilter to run a broadband wireless network.  For customers
> wanting a public IP, we simply forward a public IP to an internal NAT IP.
> 
> We have one customer who wants to use PCAnywhere remotely to contact his
> machine on the inside.  As usual, I simply forwarded a public IP to the
> private IP.  On the private IP they have a Linksys BEFSR41 router.
> 
> Basically it looks like this:
> 
> public ip ---> Linux netfilter router ---> private ip ---> Linksys
> router ---> customer's network
> 
> He is insisting that he needs to actually have a public IP, rather than just
> having our Linux router forward a public IP to a private.  We have other
> customers doing similiar things, one even opening up ports for MS-SQL
> server, without a problem, so I'm presuming that this customer is coming
> from a position of ignorance.  But before I start digging deeper, I need
> confirmation that this Linksys router is not some bizarre piece of hardware.
-- 
Alexis <alexis@attla.net.ar>


