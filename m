From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: time modules problem
Date: Thu, 16 Oct 2003 16:56:07 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200310161656.07200.Alistair@nerdnet.ca>
References: <003d01c393b2$9484d1a0$710aa8c0@N>
Reply-To: Alistair@nerdnet.ca
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <003d01c393b2$9484d1a0$710aa8c0@N>
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
To: sean <sean@ms.dnss.org>, netfilter@lists.netfilter.org





On October 16, 2003 02:56 am, sean wrote:
> i get some problem that cannt del law like
> adding success
> iptables -A FORWARD -p tcp -m time --timestart 08:00 --timestop 16:00
> --days Mon -j ACCEPT
>
>  delete fail
> iptables -D FORWARD -p tcp -m time --timestart 08:00 --timestop 16:00
> --days Mon -j ACCEPT iptables: Bad rule (does a matching rule exist in that
> chain?)
	
	Try:
	locate rule:
	iptables -L -n --line numbers  |more
	
	choose your rule line number from the list
	
	iptables -D FORWARD (line number)

	to delete the rule.


-- 

	Alistair Tonner
	nerdnet.ca
	Senior Systems Analyst - RSS
	
     Any sufficiently advanced technology will have the appearance of magic.
	Lets get magical!

