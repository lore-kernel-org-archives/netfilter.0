From: "Michael" <michael@insulin-pumpers.org>
Subject: Re: ipt_string problems and FAQ
Date: Thu, 4 Sep 2003 10:28:00 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200309041728.h84HS8228881@bzs.org>
References: <Pine.LNX.4.51.0309011300560.32229@dns.toxicfilms.tv>
Reply-To: michael@insulin-pumpers.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <200309010821.41115.tabris@tabris.net>
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

> On Monday 01 September 2003 07:03 am, Maciej Soltysiak wrote:
> > Hi,
> >
> > > ask where this FAQ entry is...
> >
> > http://www.netfilter.org/documentation/FAQ/netfilter-faq-3.html#ss3.14
> >
> 
> Kay... Though as my friend asked, what IS it good for? examples?
> 
> > > second, I've been using ipkungfu to attempt to stop codered, nimda,
> > > etc from hitting my apache server and clogging up my logs.
> > > It's not working, the rules never trigger. I've played around with it
> > > to no avail.
> >
> > I do not know how ipkungfu works, i'd have to check it out to see if it
> > can works and if it is a valid and clean solution.
> >
> http://www.linuxkungfu.org/
> 
> > > I guess, if this doesn't work, and isn't supposed to work, what
> > > SHOULD I do?
> >
> > Patch your affected servers, use unaffected software and
> > inform the netadmins of infected hosts about virii.
> 
> fwiw, i don't use IIS, so I don't really get infected by it, but all
> the same I get it clogging up my logs... which is what i'm really
> trying to take care of here... no more crap in my logs.
> 
> >
> > Regards,
> > Maciej
> --
> tabris
> -
> Life only demands from you the strength you possess.
> Only one feat is possible -- not to have run away.
>   -- Dag Hammarskjold
> 
> 

This is not a netfilter solution, but it does the trick for our 
servers. If your server is mod perl enhanced then use this statement 
in your httpd.conf file

# trap exploits of nimda & code-red compromised systems.
# version 1.06 9-20-01 michael@bizsystems.com
<perl>
{
  package Apache::VirusLogZapper;
  use Apache::Constants qw(:common :response);

  my $ERRORLOG = 0;

  sub handler {
    my $r = shift;
    if ($ERRORLOG) {
      $r->uri =~ /(cmd\.exe|root\.exe|default\.ida)/;
      $r->log_error(__PACKAGE__, ' ',
                $r->get_remote_host, ' ' ,$1);
    }
    $r->push_handlers(PerlLogHandler => sub {return DONE});
    return DONE;
  }
}
</perl>
Michael@Insulin-Pumpers.org

