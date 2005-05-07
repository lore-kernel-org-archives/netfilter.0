From: varun_saa@vsnl.net
Subject: Re: mails not going thru'
Date: Sat, 07 May 2005 21:03:11 +0500
Message-ID: <f4dc0df4fdfc.f4fdfcf4dc0d@vsnl.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-language: en
Content-disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: Jason Opperisano <opie@817west.com>
Cc: netfilter@lists.netfilter.org



----- Original Message -----
From: Jason Opperisano <opie@817west.com>
Date: Saturday, May 7, 2005 8:17 pm
Subject: Re: mails not going thru'

> On Sat, May 07, 2005 at 10:14:49AM +0500, varun_saa@vsnl.net wrote:
> > *filter
> > :FORWARD ACCEPT [0:0]
> > :INPUT DROP [0:0]
> > :OUTPUT ACCEPT [0:0]
> > -A INPUT -s 127.0.0.1 -j ACCEPT
> > -A INPUT -p tcp -m tcp -i eth1 --dport 3128 --sport 1024:65535 -j 
> ACCEPT> -A INPUT -p udp -m udp -i eth1 --dport 3128 --sport 
> 1024:65535 -j ACCEPT
> > -A INPUT -s 62.0.0.0/255.0.0.0 -i eth0 -j REJECT
> > -A INPUT -p tcp -m tcp -s 217.81.0.0/255.255.0.0 -i eth0 -j REJECT
> > -A INPUT -i eth0 -j DROP
> > -A INPUT -p tcp -m tcp -i eth1 --sport 80 -j DROP
> > -A INPUT -m state -i eth1 --state ESTABLISHED,RELATED -j ACCEPT
> > -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
> > -A FORWARD -p tcp -i eth1 -o eth0 --dport 25 --sport 1024: -j 
> ACCEPT  --syn 
> > -A FORWARD -p tcp -i eth1 -o eth0 --dport 110 --sport 1024: -j 
> ACCEPT  --syn 
> > -A FORWARD -p tcp -i eth1 -o eth0 --dport 1863 --sport 1024: -j 
> ACCEPT  --syn 
> > -A FORWARD -p tcp -i eth1 -o eth0 --dport 5050 --sport 1024: -j 
> ACCEPT  --syn 
> 
> the policy of your FORWARD chain is set to ACCEPT, so even if there's
> traffic you haven't accounted for in these rules--it will still be
> allowed through.  you have a rule that allows SMTP (TCP 25) out--so i
> bet if you type:
> 
>  telnet 64.233.185.27 25
> 
> which is the IP of gmail's preferred MX, you'd get connected.  if 
> you'reFORWARD policy was DROP, i'd say that the reason you can't 
> send mail from
> a client machine is because you have no rule allowing DNS traffic out:
> 
>  -A FORWARD -i eth1 -o eth0 -p udp --sport 1024: --dport 53 -j ACCEPT
>  -A FORWARD -i eth1 -o eth0 -p tcp --syn --sport 1024: --dport 53 \
>     -j ACCEPT
> 
> but since those packets will be accepted by the chain policy, my only
> guess is that you do not have any valid DNS servers configured on your
> client machines--on a *nix box:
> 
>  cat /etc/resolv.conf
> 
> -j
> 
> --
> "Richie: Mom, uh, I really like Potsy.
> Mrs. Cunningham: Well, Potsy's a nice boy, dear. Why shouldn't you
> like him?
> Richie: No, I mean... I REALLY like Potsy.
> Mr. Cunningham: We heard you the first time, son, you've got a
> homosexual attraction to Potsy."
>        --Family Guy
> 

Thanks a lot.
Sorry for the resend. I keep forgeting
to the check the reply addresses.

Varun


