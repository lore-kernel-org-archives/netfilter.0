From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: Login load balancing
Date: Thu, 27 Apr 2006 12:16:19 +0200
Message-ID: <20060427121619.3e2bf426.arnt@c2i.net>
References: <444FAEFF.1040100@uvic.ca>
	<1146073387.24375.74.camel@sehe-c4.berlin.teles.de>
	<444FBBA7.2020501@uvic.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <444FBBA7.2020501@uvic.ca>
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

On Wed, 26 Apr 2006 11:27:51 -0700, Drew wrote in message 
<444FBBA7.2020501@uvic.ca>:

> >> I'm looking for a solution (and I'm not afraid of devving one if
> >necessary) > to load-balance SSH logins over several mostly identical
> >systems.
> > 
> > This sounds like a job for LVS. Have a look at
> > http://www.linuxvirtualserver.org/
> 
> Thanks Sebastian.  I should have mentioned however that I have looked
> at this and I'd like to avoid it.  I'm not afraid of compiling my own
> kernel or software, but here at work we avoid using anything but our
> distribution's standard kernel package.  If it comes down to the
> choice between using LVS and not providing the load-balancing service
> at all, I will probably have to choose the latter.
 
..check out sdm and sdm-terminal, if you wanna provide X logins over
ssh, the user sees a menu to choose from and you should be able to 
"pile up the good boxes" on top of that menu listing:
arnt@a45:~ $ apt-cache search sdm
bsdmainutils - collection of more utilities from FreeBSD
bsdutils - Basic utilities from 4.4BSD-Lite
cfv - versatile file checksum creator and verifier
sdm - Secure Display Manager - secure remote access to X11
sdm-terminal - Secure Display Manager - terminal files
turqstat - Fidonet and Usenet statistics program
xturqstat - Fidonet and Usenet statistics program for X
arnt@a45:~ $ apt-cache show sdm sdm-terminal
Package: sdm
Priority: optional
Section: x11
Installed-Size: 124
Maintainer: Jonas Smedegaard <dr@jones.dk>
Architecture: all
Version: 0.4.0b-3
Depends: openssh-server | ssh | ssh-server, dash, xbase-clients,
x11-common | xfree86-common Recommends: xdialog
Suggests: wmanager, selectwm, icewm | x-window-manager, xterm |
x-terminal-emulator Filename: pool/main/s/sdm/sdm_0.4.0b-3_all.deb
Size: 14108
MD5sum: 0fdab9298ea0f4e42426d67ccb31b9c4
Description: Secure Display Manager - secure remote access to X11
 sdm is an X11 display manager similar to xdm, gdm and kdm, but unlike
 those it wraps the X11 traffic within an ssh tunnel to provide a secure
 login mechanism for remote X sessions.
 sdm provides access only through SSH, not locally. It is technically
 possible to access an sdm server from same host, but probably a waste
of CPU power.
 .
 This package should be installed on any server acting as SDM server.
 .
  Homepage: http://www.lessdisks.net/
Tag: interface::daemon, interface::x11, role::sw:server, use::login,
x11::display-manager

Package: sdm-terminal
Priority: optional
Section: x11
Installed-Size: 108
Maintainer: Jonas Smedegaard <dr@jones.dk>
Architecture: all
Source: sdm
Version: 0.4.0b-3
Depends: openssh-client | ssh | ssh-client, dash, xserver-xorg |
xserver-xfree86 | xserver, xbase-clients Recommends: xdialog
Filename: pool/main/s/sdm/sdm-terminal_0.4.0b-3_all.deb
Size: 13692
MD5sum: 93ad42913ddf30c04da3a2a4c239c49d
Description: Secure Display Manager - terminal files
 sdm is an X11 display manager similar to xdm, gdm and kdm, but unlike
 those it wraps the X11 traffic within an ssh tunnel to provide a secure
 login mechanism for remote X sessions.
 sdm provides access only through SSH, not locally. It is technically
 possible to access an sdm server from same host, but probably a waste
of CPU power.
 .
 This package contains helper files for a terminal to connect to an sdm
 server, and should be installed on any computer accessing an sdm
server. .
  Homepage: http://www.lessdisks.net/
Tag: admin::login, role::content:data, security::authentication,
use::login, x11::display-manager

arnt@a45:~ $                                                            
                   


-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;o)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.


