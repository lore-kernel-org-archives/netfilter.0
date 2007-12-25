From: reader@newsguy.com
Subject: Special firewall for wannabee dmz machine
Date: Tue, 25 Dec 2007 07:53:26 -0600
Message-ID: <87abnyubhl.fsf@newsguy.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

( I've probably irritated the ipfilter list by mistakenly posting this
  there first)

I'd like to see some examples of how to do this:

I'm setting up a gentoo linux machine who's sole purpose is to get
traffic coming to a NETGEAR router upstream.  That router has one of
those options they call DMZ where you can give a lan address machine
to be sent all traffic that is blocked from the lan.

In my case it isn't a true DMZ because it will not route anything to
other parts of the lan.  It's pupose is to drop but log all the
baloney coming at the NETGEAR from the internet.

I just want to poke around in the logs of what is coming my way.

It will only need to communicate to the internet rarely if at all
and then from lynx, or over ssh.  It has no X installed, no services
like apache, samba, cups, etc etc.  Only ssh.  And I'd like that to
only be open to the lan.

I'm confused about which things need to be allowed in and how to
handle the rejected stuff, far as logging only possible nasty stuff
and not normal dns or other normal traffic.

