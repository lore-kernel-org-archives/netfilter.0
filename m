From: "Matthias F. Brandstetter" <haimat@lame.at>
Subject: Re: how to forward traffic to MS Exchange?
Date: Mon, 7 Jun 2004 13:33:20 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406071333.20592.haimat@lame.at>
References: <200406071311.55915.haimat@lame.at> <1086607428.4005.16.camel@laptop.stwerff.xs4all.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1086607428.4005.16.camel@laptop.stwerff.xs4all.nl>
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
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>
Cc: Ludo Stellingwerff <ludo@protactive.nl>

---------- quoting Ludo Stellingwerff ----------
> You could try to SNAT the specific traffic to the LAN address of the
> firewall.
>
> Like: $IPTABLES -t nat -A POSTROUTING -o $LAN_NIC -p tcp --dport 25 -d
> 192.168.120.10  -j SNAT --to-source $LOCAL_LAN_ADDRESS
> (a very insecure setup, switch it off afterwards!)
>
> This will give you the possibility to rule-out accesscontrol issues in
> exchange. If still doesn't work it's more likely to be a netfilter
> problem, if it does work it's more likely an Exchange trouble.

Yep indeed, when I use your rule after my DNAT rule, I _can_ connect to 
Exchange server, so it seems this is the problem. Exchange server is not 
under my control, but now I know where to continue...

Thanks a lot for your help, Ludo!
Greetings, Matthias

-- 
Donuts.  Is there anything they can't do?

		-- Homer Simpson
		   Marge vs. the Monorail

