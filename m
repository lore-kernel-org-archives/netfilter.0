From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Redirecting outgoing SMTP from LAN to another LAN server
Date: Thu, 13 May 2004 14:42:24 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405131442.24566.Antony@Soft-Solutions.co.uk>
References: <20040429095949.GB22172@acentral.co.uk> <20040429144757.GA6534@zion.homelinux.com> <200405131346.12621.gdh@acentral.co.uk>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200405131346.12621.gdh@acentral.co.uk>
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

On Thursday 13 May 2004 1:46 pm, Gavin Hamill wrote:

> This is just a final followup to say thanks for the advice, and to report
> on the final solution.
>
> eth0 is the 0utside, and eth1 is the 1nside (that's what I use to stop
> confusing myself...) and 10.0.0.254 is the firewall and default gateway for
> all LAN machines
>
> $ iptables -t nat -A PREROUTING -p tcp -i eth1 -s ! 10.0.0.253 --dport 25
> -j DNAT --to 10.0.0.253:25
> $ iptables -t nat -A POSTROUTING -p tcp -s 10.0.0.0/24 -d 10.0.0.253
> --dport 25 -j SNAT --to 10.0.0.254
>
> This way, LAN users trying to connect directly to an external mail server
> get sent to the MTA on 10.0.0.253, and 10.0.0.253 itself still has full
> access to 'real' port 25 in order that it can deliver mails! :)
>
> Cheers,
> Gavin.

I'd just like to say that it's very nice to see a posting like this here, 
showing the working solution (together with an explanation of why it works, 
and exactly what it does), since this sort of thing is very useful to people 
searching the archives in future.

Find a working solution which someone has bothered to document is much more 
helpful than finding someone with a similar problem, and having to go through 
half the same effort of solving it, so thanks Gavin for providing this info.

Regards,

Antony.

-- 
"Black holes are where God divided by zero."

 - Steven Wright

                                                     Please reply to the list;
                                                           please don't CC me.


