From: =?iso-8859-1?Q?Leonardo_Rodrigues_Magalh=E3es?= <leolistas@solutti.com.br>
Subject: Re: Maximum Number of Chains
Date: Wed, 3 Sep 2003 13:19:35 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001801c37237$2bdac070$9600000a@casa>
References: <09B04A55822EFF4DA48D2E0BB2941D4A15C21A@wardrive.citadelcomputer.com.au> <20030903120302.M95330@tkevans.com> <3F560BCC.4020907@riovia.net>
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
To: Paul Caritj <pcaritj@riovia.net>, netfilter@lists.netfilter.org


    OK, let's get 4000 users. Are their IPs in a known range or these are
internet users ? Are this rules be applied on input/output or they'll be for
forwarding stuff ?

    Are rules always be the same for every IP or rules can change from one
IP to another ? Could you explain us a little better in what context will
this solution be used ?

    Sincerily,
    Leonardo Rodrigues


----- Original Message ----- 
From: "Paul Caritj" <pcaritj@riovia.net>
To: <tkevans@tkevans.com>; <netfilter@lists.netfilter.org>
Sent: Wednesday, September 03, 2003 12:42 PM
Subject: Re: Maximum Number of Chains


> Agreed,
> Heres my situatuation: I need to create rules on the fly for
> (potentially) up to 4000 users. What I need is a way to delete *all* the
> rules for a given ip address without knowing the full contents of the
> rule (only the ip); as you might have guessed, I'm doing this
> programatically.
>
> My current solution is to have one chain for each associated IP. Is
> there a better solution to this problem?
>
> As for memory...I can have as much as I need, if anyone knows how much
> that would be. :)
>
> Tim Evans wrote:
>
> >On Wed, 3 Sep 2003 09:25:51 +1000, George Vieira wrote
> >
> >
> >>How much memory do you have???
> >>
> >>I've added at once stage around 500+ rules in once chain alone, if
> >>that helps you in anyway..
> >>
> >>
> >
> >Seems to me if you have to ask about the maximum number of rules, you
already
> >have too many. There are ways to create general rules that apply to many
> >cases--i.e., address ranges, port ranges, etc.
> >--
> >Tim Evans                       |    5 Chestnut Court
> >tkevans@tkevans.com             |    Owings Mills, MD 21117
> >http://www.tkevans.com/         |    443-394-3864
> >http://www.come-here.com/News/  |
> >
> >
> >
> >.
> >
> >
> >
>
>
>


