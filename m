From: Jason Opperisano <opie@817west.com>
Subject: RE: How to block only MX query made to DNS server
Date: Tue, 30 Nov 2004 09:28:57 -0500
Message-ID: <1101824937.2881.20.camel@hubcap.ljm.dom>
References: <20041130072636.72194.qmail@web12308.mail.yahoo.com>
	<1101820669.2881.11.camel@hubcap.ljm.dom>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1101820669.2881.11.camel@hubcap.ljm.dom>
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
To: netfilter@lists.netfilter.org

On Tue, 2004-11-30 at 08:17, Jason Opperisano wrote:

whoops...

> my $listenip = "127.0.0.1";
                  ^^^^^^^^^

that should be the inside IP of the firewall in order for it to work
properly with the REDIRECT statement...

> my $listenport = "5353";
> my $verbose = 1;
> 
> my $ns = Net::DNS::Nameserver->new(
>        LocalAddr        => $listenip,
>        LocalPort        => $listenport,
>        ReplyHandler     => \&reply_handler,
>        Verbose          => $verbose
> );
> 
> sub reply_handler {
>   my ($qname, $qclass, $qtype, $peerhost) = @_;
>   my ($rcode, @ans, @auth, @add);
> 
>   if ($qtype eq "MX") {
>     $rcode = "NXDOMAIN";
>     return ($rcode, \@ans, \@auth, \@add, { aa => 1 });
>   } else {
>     my $res   = Net::DNS::Resolver->new;
>     my $query = $res->search("$qname", "$qtype", "$qclass");
>     if ($query) {
>       foreach my $rr ($query->answer) {
>         next if $rr->type eq "CNAME";
>         push @ans, Net::DNS::RR->new($rr->string);
>         $rcode = "NOERROR";
>         return ($rcode, \@ans, \@auth, \@add);
>       }
>     }
# i also forgot to add this here
# if query fails, send negative response
else {
        $rcode = "NXDOMAIN";
        return ($rcode, \@ans, \@auth, \@add, { aa => 1 });
    }

>   }
> }
> 
> $ns->main_loop;
> ---  END PERL SCRIPT  ---

-j

--
"Be careful when we capture him! We cannot claim the reward unless
 we have 51% of the carcass"
	--The Simpsons


