From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: seeking help on iptable/netfilter and X protocol
Date: Mon, 12 May 2003 11:59:13 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200305121159.13974.Alistair@nerdnet.ca>
References: <20030512131114.86082.qmail@web41704.mail.yahoo.com>
Reply-To: Alistair@nerdnet.ca
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030512131114.86082.qmail@web41704.mail.yahoo.com>
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
To: Reuven Kohanim <rkohanim@yahoo.com>, netfilter@lists.netfilter.org

On May 12, 2003 09:11 am, Reuven Kohanim wrote:
> I have been successfully using X protocol across an
> ipchains gateway. I am trying to move to iptables.
> Finally ,and thanks to some help that I got at this
> forum, everything is working smoothly except for X.
>
> I am bypassing masquerading when my source/destination
> are the X client/server so that I can use my
> non-masqed ip address for the 'display' parameter of
> say xterm application. Could anyone tell me if
> iptables
> does or does not supports X.
>
> Thanks
> Reuven
>
>
> __________________________________
> Do you Yahoo!?
> The New Yahoo! Search - Faster. Easier. Bingo.
> http://search.yahoo.com

	I've found with the simple expedient of setting appropriate rules for 
	source IP and dest ip I can manage my X connections through Iptables.
	I prefer to have outside X connections initiated from within ssh ... it is
	more secure, and easier to manage on a per user basis, (I dont have to add a
	new rule for each connection site.) since ssh handles X forwarding for the
	client.

	What masquerading are you bypassing and why?  -- 
	if you are connecting to a remote site and exporting to a non routeable IP 
	your X connection will not work ... if you are connecting internally and
	using your local ip, that should work ... but even then, if the ip is non
	routeable (or private as some call them) you might have problems.

-- 

	Alistair Tonner
	nerdnet.ca
	Senior Systems Analyst - RSS
	
     Any sufficiently advanced technology will have the appearance of magic.
	Lets get magical!

