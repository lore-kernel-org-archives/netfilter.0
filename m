From: "Leonardo Rodrigues ( listas )" <leolistas@solucoesip.net>
Subject: Re: question on recent module
Date: Sat, 25 Jan 2003 18:43:52 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000f01c2c4ba$da76b8d0$3201a8c0@leonardo>
References: <001901c2c3b3$5adfe4a0$3201a8c0@leonardo> <20030125013327.GO484@ns.snowman.net> <005201c2c4a9$f9e7f280$3201a8c0@leonardo> <20030125192149.GP484@ns.snowman.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: netfilter ML <netfilter@lists.samba.org>, sfrost@snowman.net


    tried: iptables -A OUTPUT -m recent --seconds 60 --name
bullshit --rdest -j DROP
iptables v1.2.7a: recent: you must specify one of `--set', `--check'
`--update' or `--remove'

    tried adding --check according to error I received, because I want just
checking and not including/updating/excluding:
iptables -A OUTPUT -m recent --seconds 60 --name bullshit --rdest --check -j
DROP
iptables v1.2.7a: Unknown arg `--check'

    OK, seems recent module doesnt have the --check option despite the 1st
rule error message :) Watching 'iptables -m recent --help' i think I should
be using --rcheck .... let's try ....

iptables -A OUTPUT -m recent --seconds 60 --name
bullshit --rdest --rcheck -j DROP

    And it works !! :))

    Stephen, thanks very much for your help and, just in case, please
correct the error message ( --check to --rcheck stuff ).

    Sincerily,
    Leonardo Rodrigues

----- Original Message -----
From: "Stephen Frost" <sfrost@snowman.net>
To: "Leonardo Rodrigues ( listas )" <leolistas@solucoesip.net>
Cc: "netfilter ML" <netfilter@lists.samba.org>
Sent: Saturday, January 25, 2003 4:21 PM
Subject: Re: question on recent module


> * Leonardo Rodrigues ( listas ) (leolistas@solucoesip.net) wrote:
> >
> >     It's really not clear for me :) Could you give an example rule of
how an
> > destination address could be checked with recent module in an OUTPUT
rule
> > for example ? This is my situation ..... i want ALL packets whose
> > destination was matched for the last 60 seconds in a recent list called
> > 'bullshit'.
> >
> > iptables -A OUTPUT -m recent --seconds 60 --name bullshit
??????????????? -j
> > DROP
>
> --rdest for the rule above, that's it.  Note that something else needs
> to actually populate that table, but I think you've got that figured out
> already...


