From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: DNAT + 2 uplinks + route = nogo
Date: Wed, 15 Oct 2003 19:07:42 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200310151907.43054.Alistair@nerdnet.ca>
References: <DAAAFFB7B8C62F40BC87BF3E729F79E10119907A@ibfdmail.ibfd.oin>
Reply-To: Alistair@nerdnet.ca
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <DAAAFFB7B8C62F40BC87BF3E729F79E10119907A@ibfdmail.ibfd.oin>
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
To: Gaby Schilders <G.Schilders@ibfd.org>, netfilter list <netfilter@lists.netfilter.org>
Cc: George Vieira <georgev@citadelcomputer.com.au>


	Can I make one other (possibly stupid) suggestion?

	if I understand correctly ... 
	
	Can you perhaps have TWO ip addresses on the destination systems?
	alias the one on top of the other?
	Then DNAT from inbound interface A to target ip A 
	         DNAT from inbound interface B to tartget ip B
	and the unDNAT would handle more accurately?

	(or am I utterly off the wall here) and the reply from the target system  to 
the firewall would not nessesarily come BACK from the ip it was sent to?


On October 15, 2003 08:23 am, Gaby Schilders wrote:
> idea. I will check if this works. Is the conmark retained on all packets
> associated with the connection?

-- 

	Alistair Tonner
	nerdnet.ca
	Senior Systems Analyst - RSS
	
     Any sufficiently advanced technology will have the appearance of magic.
	Lets get magical!

