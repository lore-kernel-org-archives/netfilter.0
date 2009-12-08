From: "System Support" <support@microtechniques.com>
Subject: Observations from a new user
Date: Tue, 08 Dec 2009 14:13:38 -0500
Message-ID: <4B1EA562.25180.3396C0B@support.microtechniques.com>
Reply-To: support@MicroTechniques.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=MicroTechniques.com;
	s=MT_email; t=1260299619;
	bh=qSy5+lwjPHdCNeGimeLlTgXme59I87mO61pbVht1Dmw=;
	h=From:To:Date:MIME-Version:Subject:Reply-to:Message-ID:
	 Content-type:Content-transfer-encoding:Content-description;
	b=CBBc4bWeegndN2VqNYTgIM9baVghKYBY2yBKlk0glNJRNiAKjDV1gGBPnWuykXmJg
	 LIBgTiWuJkhhssZim3rXK+YVB5winfwM5ydRO7kYv+n5GD/hzjwszJdDtn6GeMQCtA
	 G/+zxuimvv0iwAerjJyh72qf7N+x4YC6kTONi3PY=
Content-description: Mail message body
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I recently tried to install the ipset routines on my system and had a number of unnecessary 
problems.  They are likely things that most readers of this list have already figured out and no 
longer cause you problems and thus they don't get fixed, but can be very frustrating to a first 
time user. 

Background:

I have been using iptables for a number of years.  In the past I used patch-o-matic to add 
features missing from my distribution.  However, for the last couple of years everything I have 
needed has already been in the SuSE distribution, and I stopped using patch-o-matic and 
compiling my own kernel.

Recently, one of my filter tables became rather large, and I decided to try ipset.  It turned out 
that SuSE 11.2 provided the -m set and -j SET features, but not the ipset program needed to 
load the sets. (reported as a problem to SuSE) I dusted off my old patch-o-matic scripts.  They 
not longer worked, so I headed over to netfilter.org.

I found a patch-o-matic tab over to the left and select that and found a familiar blurb on patch-o-
matic.  I hit the 'lists' option at the top to check the recent postings and get:

Not Found
The requested URL /projects/patch-o-matic/mailing lists.html was not found on this server.
 --> This should  be fixed.

Hmm.  The footer of the page lists 'pablo@netfilter.org' as the webmaster, so I e-mail him a 
question about the mailing lists, but wait, he is no longer the webmaster.  --> This should be 
fixed.

I then read the extensions HOWTO referenced on the site at: 
http://www.netfilter.org/documentation/HOWTO//netfilter-extensions-HOWTO-2.html#ss2.2
and find that the address of the cvs server has changed.  I update my scripts and rerun them 
only to have the server reject my connection.  I  spend quite a bit of time verifying the 
addresses, the scripts, and doing various pings and traceroutes.

I find that the list tab from the HOWTO page works and browse the mailing list and find a 
number of postings with similar complaints.  And then find the following: ... and patch-o-matic is 
replaced by xtables (http://xtables-addons.sourceforge.net/).  Well, why isn't it mentioned on the 
website?  --> The references on the site to patch-o-matic should be removed and replaced with 
xtables.  The cvs server should supply a better error message other than just connection 
refused.

I get a copy of xtables, and get it installed after correcting some interesting errors caused by my 
having multiples versions of the kernel sources installed, while not having the iptables sources 
installed.

I liked the way that patch-o-matic would run through the available uninstalled patches, give a 
brief description, and ask if I wanted to apply it.  I assumed that the replacement would work 
similarly ( I don't need no stinkin documentation).  I try to run the xtables 'command' and can't 
seem to find it.  A little digging, and oops, the make install has already installed ALL of the 
extensions.  Not what I expected.  The use of mconfig is documented in the INSTALL file, but ...
--> I would suggest that this be made a little more prominent and that a section for people 
converting from patch-o-match be added.

Well anyway, ipset is installed and I give it a try only to find the iptables can't find the module.
Ah, SuSE has the extensions in /usr/lib/xtables, not the default.  Changed the ./configure options 
and got it working.

I also support a website that is used by a local neighborhood association that is constantly 
getting bombarded by out of country spam.  The steps to block that have also made it much less 
user friendly for the legitimate users.  I have had some success by blocking out of region ips, but 
that is high maintenance, and the large iptables chains slow down the system.  The geoip 
module looked interesting, and I decided to give it a try.  I clicked on the HOWTO link and got:
Not Found
The requested URL /acidfu/geoip/howto/geoip-HOWTO.html was not found on this server.
--> This should be fixed

A little searching turns up:
http://people.netfilter.org/peejix/geoip/howto/geoip-HOWTO.html

Which again refers to patch-o-matic.  I skip that part, and follow that rest of the steps to 
download and install the database.  I add a couple of sample rules, which fail lookinig for .iv0 
files.  I can not find any reference to these in the documentation.  I spend some time examining 
the source, and find that the format of the database has changed from what was in the 
documentation.  A little googling and I find:

The extra files you will need is the binary database files. They are generated from a country-
subnet database with the geoip_csv_iv0.pl tool, available at http://jengelh.hopto.org/files/geoip/ .

Well, that's different, but seems to match the code.  So, I download those files and give it a go, 
The .pl tools has a lot of prerequisites that are not documented, but a bit of trial-and-error gets it 
going, .. and it works.  --> The HOWTO should be updated, and there should be a little more 
documentation on the requirements.

Since I am messing with my iptables rules, I decied to give -m recent a try.  However, I get 
unexpected results, and after a lot of work with tcpdump and -j TRACE I find that the rules

iptables -A dummy -o net1 -m recent --name testip --rdest --rcheck   --seconds 60 -j LOG
and
iptables -A dummy -o net1 -m recent --name testip --rdest --rcheck ! --seconds 60 -j LOG

both match the same packets ( on SuSE 11.2 with iptables v 1.4.4) --> This was reported to 
SuSE as a bug.

I also found:
iptables -A dummy -m limit ! --limit 3/second -j LOG
generates:
iptables v1.4.4: limit does not support invert
Try `iptables -h' or 'iptables --help' for more information.
However, the man page indicates that it does (also on SuSE 11.2).  --> This was reported to 
SuSE as a bug.

I also tried:
iptables -A dummy -m set --match-set testip src -o net1 -m recent --name testip --set -j LOG
generates                              
option conflict
iptables v1.4.4: --match-set can be specified only once
Try `iptables -h' or 'iptables --help' for more information.

--> -m recent should provide an alternative to --set, say --rset.

I must mention that the whole issue of re-examining my iptables rules came about when I was 
doing a carefull examination of my logs while testing the SuSE 11.2 beta.  I found that 

iptables -A FORWARD -m time --timestart 08:00 --timestop 08:30 --days Mon,Tue -d 10.168 -j 
DROP
generated
unknown option '--days'

I reported this as a bug to SuSE and was told that:

BTW, it also was --weekdays in openSUSE 11.1/iptables 1.4.1. In fact, it has
been "--weekdays" ever since xt_time was added to iptables 1.4.x.

BUT, your documentation at
http://netfilter.org/projects/patch-o-matic/pom-external.html referenced above, and also by 
xtables still shows:

[ --days listofdays ]
    Match only if today is one of the given days. (format: Mon,Tue,Wed,Thu,Fri,Sat,Sun ; default 
everyday)

As well as almost every google referenced article.

--> This should be fixed.

SuSE pointed me to an updated iptables man page which had several other changes over what I 
had been using, so I decided to review everything.


OK, as some of the documentation says - 'it works for me'.  I have worked out the issues and 
gotten things working on my system, and don't expect to be messing with iptables again for 
many months, and I provide this diary only in an effort to save a future newbie some grief.  

...don

support (at) microtechniques.com

