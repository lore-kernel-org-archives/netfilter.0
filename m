From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: iprange
Date: Fri, 7 Nov 2003 12:18:31 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311071218.31713.Alistair@nerdnet.ca>
References: <Pine.LNX.4.58.0311071633360.3942@fhynpb.envafyvqr.arg>
Reply-To: Alistair@nerdnet.ca
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.58.0311071633360.3942@fhynpb.envafyvqr.arg>
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
To: Vigil <nvnwdfuq02@sneakemail.com>, Netfilter Mailing List <netfilter@lists.netfilter.org>

On November 7, 2003 11:45 am, Vigil wrote:
> Hi, I have just installed iptables 1.2.9 from source, but it seems that the
> iprange module that is now built in, is not working. From the iprange pom
> documentation, it used to be that '-m iprange --dst-range
> 10.0.0.0-10.5.255.255.255' would work. Now, that is not working. It gives
> the error, "iptables: No chain/target/match by that name", and iptables
> isn't recognising -m as an argument anyway, but perhaps the -m argument is
> added by pom, which I'm not using now. I figured I don't need to '-m
> iprange', since it is built in, but without that, iptables doesn't
> recognise --dst-range. I thought maybe I don't need to tell it that it's a
> range any more, that it will recognise it as a range, and so with just '-d
> 10.0.0.0-10.5.255.255.255', iptables complains that the host/network is not
> found.
>
> Is iprange even being built in, as the changelog suggests? Do I have to
> activate it in some way? Or has the iprange usage changed? How do I get it
> working as before?
>
> Thanks.

	how many copies of iptables are there on your system? which one is being 
used, what versions are they?

-- 

	Alistair Tonner
	nerdnet.ca
	Senior Systems Analyst - RSS
	
     Any sufficiently advanced technology will have the appearance of magic.
	Lets get magical!

