From: Patrick Schaaf <bof@bof.de>
Subject: Re: Connection Tracking
Date: Fri, 21 Jun 2002 17:16:01 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020621171601.G5183@oknodo.bof.de>
References: <0B2759D401C1D211ACA500805FFE2C3F0636753D@cmxserv3.hilton.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <0B2759D401C1D211ACA500805FFE2C3F0636753D@cmxserv3.hilton.com>; from Preston_Wade@hilton.com on Fri, Jun 21, 2002 at 09:54:11AM -0500
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Preston Wade <Preston_Wade@hilton.com>
Cc: "'netfilter@lists.samba.org'" <netfilter@lists.samba.org>

On Fri, Jun 21, 2002 at 09:54:11AM -0500, Preston Wade wrote:
> 
> I am curious to get other peoples thoughts about the 5 Day timeout for the
> following variable: TCP_CONNTRACK_ESTABLISHED.  This value seems high for
> high traffic firewalls.  For instance if I wanted to use netfilter for a
> firewall between my corporate network and my WAN, which has roughly 2300
> nodes and 40000 users.  It seems to me like you would run out of STATE
> memory and with most connection being TCP it would take 5 days before most
> of them would timeout.  I realize I could modify the value and recompile...
> although it would be nice to be able to modify these with sysctl.conf or via
> the /proc filesystem.

Somehow, that was an impressive summary of a discussion we had here on the
list over and over again. Here's a short key to see why that is status quo:

"seems high" translates to "in rare situations". The default seems
good for the installed base.

"could modify ... and recompile" is true, the exact point where you have
to modify has been pointed out lots of time in the past.

"would be nice to sysctl" is true, and can/could be found in patch-o-matic
somewhere. It's not in the base system because the developers feel to many
knobs hurt. Several past attempts at arguing that position went fruitless.

So, all cases are covered already.

best regards
  Patrick

