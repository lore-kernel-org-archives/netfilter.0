From: Luis legar Garcia <legar1@dnrpa.gov.ar>
Subject: Re: comments about lokkit default script (Faheem Mitha)
Date: Sat, 13 Sep 2003 17:52:17 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030913175217.315cbfdf.legar1@dnrpa.gov.ar>
References: <20030913100149.1ee765e9.legar1@dnrpa.gov.ar>
	<Pine.LNX.4.44.0309131350300.1054-100000@Chrestomanci>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0309131350300.1054-100000@Chrestomanci>
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

Dear Faheem,

I missunderstood the --syn flag, so your script is ok. Other way you could not receive any return packets. 

I confused with using  -m state ! --state INVALID that means what I wrote before (all connections except invalid)

legar

On Sat, 13 Sep 2003 13:51:51 -0400 (EDT)
Faheem Mitha <faheem@email.unc.edu> wrote:

> 
> 
> On Sat, 13 Sep 2003, Luis legar Garcia wrote:
> 
> > Dear Faheem,
> >
> > As longh as I understand the rule:
> >
> > iptables -A RH-Lokkit-0-50-INPUT -p tcp -m tcp --syn -j REJECT
> >
> > it will reject ALL except INVALID, even 'Established' and 'Related' connections,
> > which you should allways allow.
> > To avoid this I'd put just before it something like
> >
> > iptables -A RH-Lokkit-0-50-INPUT -p tcp -m state --state RELATED,ESTABLISHED -j ACCEPT
> >
> > and maybe the same rule but for UDP packets.
> > bye,
> > legar, from Argentina
> 
> What kinds of problems could I expect to see if these 'Established'
> and 'Related' connections are not allowed? I have been using the rules
> I posted for some days now, and have seen no problems yet.
> 
>                                                                        Faheem.
> 

