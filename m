From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: icq
Date: Wed, 16 Jun 2004 22:26:29 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406162226.30006.Alistair@nerdnet.ca>
References: <7EACCDBB65D37443912D80713CC1245D47285E@fsnsab20.losangeles.af.mil>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <7EACCDBB65D37443912D80713CC1245D47285E@fsnsab20.losangeles.af.mil>
Content-Disposition: inline
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

On June 16, 2004 05:03 pm, Hudson Delbert J Contr 61 CS/SCBN wrote:
> the rpc like tendencies of icq make it not worth the trouble to manage
> access to/from it.
>
> ~piranha

	? rpc like ? 

> Not sure about recent versions, but with old versions you could only do
> simple things like messaging when using NAT only.
> If you wanted to do things like chat and/or filetransfer, you needed a
> socks server. I guess this still holds.
> NEC had a free socks5 server for *nix once, but stopped providing it.
> It's now Permeo's (www.permeo.com) but AFAIK not free any more. If you
> need it ; there's a source version on rpmfind.net.
>
	
	Although there are already some answers here, the extended attributes
	for icq can be managed in a small home lan situation by properly configuring
	the clients (set the ports on which connections can be recieved to a 
	different specific range per client) and then forward the appropriate range
	of  ports per client from the firewall.  In my case at home, I have three
	internal clients that are permanently forwarded.  You can't filter on source
	address as icq -> icq transfers are client to client.  For standard chatting 
	however, nothing need be done save the initial connection out to 
	login.icq.com and an established related rule.  Some folks might find that
	they have to send the initial message through the servers (window clients 
	auto fallback to this state, licq has to be told to do it) but after the 
	first message out from behind the firewall, if the ESTABLISHED,RELATED rule
	is in place, chat messages work just fine.

	Alistair Tonner.



>
>
> Gr,
> Rob

