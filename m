From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: Login load balancing
Date: Fri, 28 Apr 2006 20:23:56 +0200
Message-ID: <20060428202356.5c09239b.arnt@c2i.net>
References: <444FAEFF.1040100@uvic.ca>
	<1146073387.24375.74.camel@sehe-c4.berlin.teles.de>
	<444FBBA7.2020501@uvic.ca> <20060427121619.3e2bf426.arnt@c2i.net>
	<445100BC.1080907@uvic.ca> <20060428120005.4d940e7b.arnt@c2i.net>
	<445244DD.8040100@uvic.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <445244DD.8040100@uvic.ca>
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
To: Drew Leske <dleske@uvic.ca>
Cc: netfilter@lists.netfilter.org

On Fri, 28 Apr 2006 09:37:49 -0700, Drew wrote in message 
<445244DD.8040100@uvic.ca>:

> Arnt Karlsen wrote:
> > On Thu, 27 Apr 2006 10:34:52 -0700, Drew wrote in message 
> > <445100BC.1080907@uvic.ca>:
> > 
> >>> ..check out sdm and sdm-terminal, if you wanna provide X logins
> >over >> ssh, the user sees a menu to choose from and you should be
> >able to  >> "pile up the good boxes" on top of that menu listing:
> >> Interesting, and I might find this useful elsewhere, but for this
> >> issue I need to support console logins as well.
> > 
> > ..and this can't?  At the very least you should be able to offer
> > console logins from the sdm-terminal X menu, and then there's
> > offering a console menu from /etc/inittab instead of /bin/bash or
> > whatever you guys use.
> 
> I'm not sure I understand, but you seem to be suggesting a way by
> which I could use a console window in X.  As a base case, I have to
> support somebody connecting with a vt100 and a 9600 baud modem.  This
> solution needs to be completely independent of X.

..yup, and I was thinking of the various ttys, on which again you offer
a shell menu to choose from, instead of the usual shell prompt, any tty
(except mingetty or fgetty) should do this for you, a few quick ideas:
arnt@a45:~ $ apt-cache search tty |grep tty
a2ps - GNU a2ps - 'Anything to PostScript' converter and pretty-printer
bibclean - pretty-printer for BibTeX databases
boxshade - [Biology] Pretty-printing of multiple sequence alignments
brltty - Access software for a blind person using a soft braille
terminal brltty-flite - Access software for a blind person using a soft
braille terminal brltty-x11 - Access software for a blind person using a
soft braille terminal detachtty - Attach/detach from interactive
processes across the network discus - Pretty version of df(1) command.
dvi2tty - Previewing dvi-files on text-only devices
enscript - Converts ASCII text to Postscript, HTML, RTF or Pretty-Print
eskuel - A pretty PHP administration tool for MySQL databases
fbgetty - A console getty with and without frame buffer capability
fgetty - very small, efficient, console-only getty and login
fillets-ng - puzzle game about witty fish saving the world sokoban-style
fvwm-crystal - Pretty Desktop Environment based on fvwm
hztty - Translates GB, Big5, zW/HZ Chinese encodings in a tty session
kitty - a Qt/KDE based RSS podcast and video aggregator
libemail-mime-contenttype-perl - Parse a MIME Content-Type Header
libio-pty-perl - Perl module for pseudo tty IO
libio-stty-perl - Interface to secure pseudo ttys
libmlrisctools-smlnj - Library for parsing and pretty printing SML code
libmodem-vgetty-perl - Perl module for interfacing with vgetty
(Modem::Vgetty) libpty-ruby - pseudo tty interface for Ruby
libpty-ruby1.6 - pseudo tty interface for Ruby 1.6.x
libterm-query-perl - Subroutines that handle simple tty-based UI
libxml-filter-reindent-perl - Perl module for reformatting whitespace
for pretty printing XML linuxvnc - VNC server to monitor a tty
lyskom-tty-client - TTY client for LysKOM
mgetty - Smart Modem getty replacement
mgetty-docs - Documentation Package for mgetty
mgetty-fax - Faxing tools for mgetty
mgetty-pvftools - Programs for listening and manipulating pvf and rmd
files mgetty-viewfax - Program for displaying Group-3 Fax files under X
mgetty-voice - Voicemail handler for mgetty
mingetty - Console-only getty
mp - pretty-printer for email messages and other text files
muttprint - Pretty printing of mails
owl - A curses-based tty Zephyr client.
pretzel - Prettyprinter generator for noweb
putty - Telnet/SSH client for X
putty-tools - command-line tools for SSH, SCP, and SFTP
rungetty - minimal console getty that can run any process
trueprint - pretty printing of source code
ttv - tty TV application
ttyd - Remote Modem Utility for Unix
ttylog - serial port logger
ttyrec - A tty recorder
ttysnoop - TTY Snoop - allows you to spy on telnet+serial connections
zope-atcontenttypes - archetypes-based replacement for Plone/CMF types
arnt@a45:~ $                                                            
                          

-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;o)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.


