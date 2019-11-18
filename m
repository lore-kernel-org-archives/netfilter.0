From: trentbuck@gmail.com (Trent W. Buck)
Subject: Re: One more application available for nftables
Date: Mon, 18 Nov 2019 13:43:32 +1100
Message-ID: <87v9rhdhuz.fsf@goll.lan>
References: <b99d882d69f5e152919339c65ac26163@mailtower.de>
        <b5512a97bad28c14e57ebf2f92c12f27@mailtower.de>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Matt <matt-nft@mailtower.de> writes:

> I'd like to announce a new application which runs on nftables,
> I've named it "fail2nft".
> https://coolscript.org/index.php/Fail2nft

Here's my quick review as a non-expert bystander.
(This is a critique of the code, NOT the author!)

That page needs a section "why choose fail2nft over existing products?" :-)

 * sshguard is lex/yacc (C) that reads logs journal/syslog/NCSA
   and runs a helper script to add/remove block rules.
   Adding new match rules requires a recompile.
   It blocks everything by default (on Debian, via nftables).

   https://bitbucket.org/sshguard/sshguard/src/master/src/fw/sshg-fw-nft-sets.sh

   It's about 2KLOC (slightly bigger than fail2nft).

 * fail2ban is python and uses regular expressions to look for attacks.
   It's configured via a huge mess of .ini files.
   It blocks nothing (except SSH?) by default (on Debian, via xtables).

   https://github.com/fail2ban/fail2ban/blob/0.11/config/action.d/nftables.conf

   It's about 17KLOC (much bigger than fail2nft).

perlcritic (a.k.a. "use criticism;") was very unhappy about
https://coolscript.org/download/fail2nft-installer.pl and
https://coolscript.org/download/fail2nft.tar.gz:usr/local/fail2nft/fail2nft.pl

I recommend fixing pretty much everything perlcritic complains about.
(note that by default, it only emits "high severity" complaints.)

I recommend making fail2nft's git (or whatever VCS) repo publicly
visible, and having versioned release tarballs
(fail2nft-0.9.tar.gz, not fail2nft.tar.gz).


The persistence across reboots via sqlite is interesting.


I haven't nitpicked your
usr/local/fail2nft/install/usr/sbin/nftinit-*.nft in detail.
The overall style looks reasonable.

I suggest explicitly putting "fail2nft" in your table/chain names, and
running them at "priority filter - 5" or so (i.e. before the default
"priority filter").  At that point, your fail2nft table can do nothing
but drop attacker sets, and all the normal rules can live somewhere else.
(See the sshguard link above for an example.)

I know your index.php says it's not for routers yet, but I *strongly*
recommend you hook into INPUT *and* FORWARD, where currently you only
hook into INPUT.  This will handle the easy 80% of routers in only a
couple of extra lines.

I see you're matching vsftpd.  I very very strongly recommend
you... encourage your end users to switch from FTP to SFTP.  :-)
(Many (most?) Windows FTP clients can do SFTP these days.)

