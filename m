From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: debugging iptables
Date: Mon, 17 Jun 2002 23:04:45 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206172204.g5HM4kA26349@Networker.rockstone.co.uk>
References: <20020617165903.4b7ac76a.mt@open2web.com> <200206172112.g5HLCMA23419@Networker.rockstone.co.uk> <20020617173308.6b2bfc5d.mt@open2web.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020617173308.6b2bfc5d.mt@open2web.com>
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
To: netfilter@lists.samba.org

On Monday 17 June 2002 10:33 pm, Mark Tessier wrote:

> > What are the values of the variables $SMTP_SERVER and $POP_SERVER in your
> > script ?
>
> SMTP_SERVER="smtp1.my.isp.ca"
> POP_SERVER="mail.my.isp.com"

Okay, so your firewall needs to be able to resolve hostnames at the time it 
processes any rules containing these names.   Are you sure it can do that at 
that time ?

I see FORWARD and OUTPUT rules for destination port 53, but what rules do you 
have for allowing packets into the INPUT chain so that the DNS server can 
reply ?

Also, I'm a bit puzzled at your labelling of the interfaces - am I right in 
thinking you have an internal network interface called $LAN_INTERFACE, and an 
external interface called $DMZ_INTERFACE ?   It's more common to use DMZ for 
a second 'internal' interface which has some access from the inside, and some 
from the outside, rather than to label the external interface like this...

I assume you have the recommended DROP policy on your INPUT and OUTPUT 
chains, so try putting a LOG line at the end of each of those and see what 
gets logged (just before getting dropped).   I'll bet something gets logged 
from your INPUT chain which doesn't look good.....

 

Antony.

