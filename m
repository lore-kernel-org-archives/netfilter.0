From: "Maxime Ducharme" <mducharme@cybergeneration.com>
Subject: Re: Dynamic DNS
Date: Wed, 9 Mar 2005 10:26:44 -0500
Message-ID: <109201c524bc$66ef5660$b000a8c0@cybergeneration.com>
References: <20050309062542.GA27660@gw.home.tux-labor.de>
	<103901c524bb$0eedffd0$b000a8c0@cybergeneration.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"
To: Sebastian Docktor <sebi@tux-labor.de>, netfilter@lists.netfilter.org


Forgot something important

you must add a jump from INPUT to the new
rule

iptables -A INPUT -j CHECK_SSH_DYNDNS

so the rule become active :)

also : add -m state --state NEW to CHECK_SSH_DYNDNS

HTH

Maxime Ducharme
Programmeur / Sp=E9cialiste en s=E9curit=E9 r=E9seau

----- Original Message -----=20
From: "Maxime Ducharme" <mducharme@cybergeneration.com>
To: "Sebastian Docktor" <sebi@tux-labor.de>; <netfilter@lists.netfilter.org>
Sent: Wednesday, March 09, 2005 10:17 AM
Subject: Re: Dynamic DNS


>
> Hello Sebastian
>
> Suggestion :
>
> 1. create script for this :
>
>
> check_ssh_dyndns.sh
> ##############################
> # delete rule (if it existed)
> iptables -t filter -D CHECK_SSH_DYNDNS
>
> # re-create rule
> iptables -t filter -N CHECK_SSH_DYNDNS
>
> # read the DynDNS ip
> theHost=3D`host a.dyndns.org |awk '{print $4}'`
>
> # Add it to allowed SSH
> iptables -t filter -A CHECK_SSH_DYNDNS -p tcp --dport 22 -s $theHost
> ##############################
>
>
> In your firewall script call this script
> ./check_ssh_dyndns.sh
>
>
>
> In crontab, run this script every 5 mins (default
> DynDNS TTL). It will keep your dyndns host in the
> rules up to date.
>
> *** note that this script may need adujstement, i didnt
> tested it, I'm sending an idea
>
> HTH
>
> Maxime Ducharme
> Programmeur / Sp=E9cialiste en s=E9curit=E9 r=E9seau
>
> ----- Original Message -----=20
> From: "Sebastian Docktor" <sebi@tux-labor.de>
> To: <netfilter@lists.netfilter.org>
> Sent: Wednesday, March 09, 2005 1:25 AM
> Subject: Dynamic DNS
>
>
> > Hi,
> >
> > I want to allow a Dynamic DNS Client to Access the SSH-Server
> > on my Firewall. But I don't want to open SSH for all IPs,
> > Is it possible that iptables always looks up the ip address from the
> > hostname, so that only the ip has access which is registrated under
> > the dyndns?
> >
> >
> > --=20
> > Sebastian Docktor <sebi@tux-labor.de>
> >
>


