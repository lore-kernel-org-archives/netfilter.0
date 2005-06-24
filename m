From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Firewall feature recommendation
Date: Fri, 24 Jun 2005 09:32:08 -0500
Message-ID: <200506240932.08470.rob0@gmx.co.uk>
References: <fad9d48405062403562537f546@mail.gmail.com>
	<Pine.GSO.4.58.0506241002340.17433@queeg.cs.rit.edu>
	<200506240912.08598.rob0@gmx.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200506240912.08598.rob0@gmx.co.uk>
Content-Disposition: inline
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

On Friday 24 June 2005 09:12, I wrote:
> > Would you be so kind as to post a randomly-selected zone file for
> > our enjoyment?
>
> [file: null.zone]

I should clarify: this same zone is loaded for all blocked domains.
Please note that it's generic. And (just before I saw Edvin's request)
it occurred to me that you might want to see the blacklist of zones:

rob0@room101:/etc/named$ cat blacklist
# named/blacklist - modular BIND configuration file - 2005/03/31
# /dev/rob0 <rob@gmx.co.uk>
#
# This lists zones which will return the local server IP for *ALL*
# hostnames. The following is a list of known spyware domains which are
# blocked.
# NOTE: if you are using the domain blocking Webmin module we have
# provided, these comments will be lost, so we've also provided a copy
# as "named/blacklist.orig".

zone "180solutions.com" { type master; notify no; file "null.zone"; };
zone "2020search.com" { type master; notify no; file "null.zone"; };
zone "2nd-thought.com" { type master; notify no; file "null.zone"; };
zone "blazefind.com" { type master; notify no; file "null.zone"; };
zone "bonzibuddy.com" { type master; notify no; file "null.zone"; };
zone "clrsch.com" { type master; notify no; file "null.zone"; };
zone "cometcursor.com" { type master; notify no; file "null.zone"; };
zone "cometsystems.com" { type master; notify no; file "null.zone"; };
zone "coolsearch.biz" { type master; notify no; file "null.zone"; };
zone "date-manager.com" { type master; notify no; file "null.zone"; };
zone "doubleclick.net" { type master; notify no; file "null.zone"; };
zone "drsnsrch.com" { type master; notify no; file "null.zone"; };
zone "euniverse.com" { type master; notify no; file "null.zone"; };
zone "eyeblaster.com" { type master; notify no; file "null.zone"; };
zone "feedbackresearch.com" { type master; notify no; file "null.zone"; };
zone "flingstone.com" { type master; notify no; file "null.zone"; };
zone "funwebproducts.com" { type master; notify no; file "null.zone"; };
zone "gator.com" { type master; notify no; file "null.zone"; };
zone "gatoradvertisinginformationnetwork.com" { type master; notify no; file "null.zone"; };
zone "grandstreetinteractive.com" { type master; notify no; file "null.zone"; };
zone "hotornot.com" { type master; notify no; file "null.zone"; };
zone "incredifind.com" { type master; notify no; file "null.zone"; };
zone "match.com" { type master; notify no; file "null.zone"; };
zone "offeroptimizer.com" { type master; notify no; file "null.zone"; };
zone "plaxo.com" { type master; notify no; file "null.zone"; };
zone "pointroll.com" { type master; notify no; file "null.zone"; };
zone "precisionpop.com" { type master; notify no; file "null.zone"; };
zone "searchbrowser.com" { type master; notify no; file "null.zone"; };
zone "serving-sys.com" { type master; notify no; file "null.zone"; };
zone "shopnav.com" { type master; notify no; file "null.zone"; };
zone "sirsearch.com" { type master; notify no; file "null.zone"; };
zone "toprebates.com" { type master; notify no; file "null.zone"; };
zone "twain-tech.com" { type master; notify no; file "null.zone"; };
zone "webshots.com" { type master; notify no; file "null.zone"; };
zone "whenu-advertising.com" { type master; notify no; file "null.zone"; };
zone "whenu.com" { type master; notify no; file "null.zone"; };

Most if not all of the listed domains were personally researched by me.
That's the weakness of this, though: it's impossible to keep ahead of
the spammers and other ratware peddlers in this arms race. There are
perhaps millions of domains which belong on this list! I can't research
them all, and I wouldn't want to trust someone else to manage the list
outside our organisation.

The aforementioned Webmin module is custom-made and very simple. The
user has a text box control listing domains to block, one per line.
Upon submission of the form we rewrite the blacklist file (which is
part of named.conf by means of an include), "rndc reload", and signal
the slaves to update their configuration.

Note the philosophy here is that if a domain is bad it's ALL bad. You
could, however, specify a subdomain ...
zone "badboy.example.com" { type master; notify no; file "null.zone"; };
... and thus not block "goodguy.example.com."

We're way off topic here, but this is fascinating stuff. I need to find
someone to fund some ratware research; this could be a major project
with far-reaching benefits.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

