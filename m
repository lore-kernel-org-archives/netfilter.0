From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: port 8080 and zope woes...
Date: Thu, 11 Sep 2003 13:58:12 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200309111358.12794.Alistair@nerdnet.ca>
References: <000301c37879$5f93e610$0401000a@tanjian>
Reply-To: Alistair@nerdnet.ca
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000301c37879$5f93e610$0401000a@tanjian>
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
To: Rob Sterenborg <rob@sterenborg.info>, netfilter@lists.netfilter.org

On September 11, 2003 11:28 am, Rob Sterenborg wrote:
> > I have zope server running on port 8080
> > and have enabled its access in IPTables
> > however it fails to open up.
> > any reason why??
> >
> >  -A INPUT -d <dest-ip> -p tcp -m tcp --dport 8080 -j ACCEPT
> >
> > -A OUTPUT -s <dest-ip> -p tcp -m tcp --sport 8080 -j ACCEPT
>
> Have you set the default policy of the INPUT chain set to DROP ?
> Then do you also have :
>
> -A INPUT -m state --state RELATED,ESTABLISED -j ACCEPT
> -A OUTPUT -m state --state RELATED,ESTABLISED -j ACCEPT (if OUTPUT
> default policy is DROP)
>
	Minor spelling error above ESTABLISHED not ESTABLISED
	(I know just a typo .. .but for the archives.)


>
>
> Gr,
> Rob

-- 

	Alistair Tonner
	nerdnet.ca
	Senior Systems Analyst - RSS
	
     Any sufficiently advanced technology will have the appearance of magic.
	Lets get magical!

