From: Patrick Schaaf <bof@bof.de>
Subject: Re: Iptables forwarding
Date: Wed, 26 Jun 2002 10:07:08 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020626100708.A729@oknodo.bof.de>
References: <1C61B9073EBFBD40B45FA90B8265B2DD1BDF@MELXCHW01.oz.quest.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <1C61B9073EBFBD40B45FA90B8265B2DD1BDF@MELXCHW01.oz.quest.com>; from loc.huynh@oz.quest.com on Wed, Jun 26, 2002 at 05:41:37PM +1000
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
To: Loc Huynh <loc.huynh@oz.quest.com>
Cc: netfilter@lists.samba.org

Hi,

> The above worked fine if I have the "FORWARD" to be open to ACCEPT
> ie: $IPTABLES -P FORWARD ACCEPT
> 
> Of course, I don't want the default is open to "ACCEPT", is there anyway to
> avoid this please ?

Without thinking about your exact setup, here is a general advise:
in a case like the one you have on your hands, when you see that
a chain default policy is neccessary for something to work, you
can immediately guess that you are missing a neccessary rule within
the chain itself. Now what can you do to find out what kind of
rule you need? Easy: use the LOG target at the end of the chain,
and you will see in your syslog (/var/log/messages, most likely)
the address information of the packets which fall off the end
of your chain.

hope this helps
  Patrick

