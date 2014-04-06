From: Eric Leblond <eric@regit.org>
Subject: Re: /proc/net/netfilter/nf_log boot setup / persistence
Date: Sun, 06 Apr 2014 18:51:44 +0200
Message-ID: <1396803104.21935.4.camel@ice-age2.regit.org>
References: <001a11c16772e52ced04f661a84d@google.com>
	 <0828E69AE2D243E4AFDB81850D33C0B8@PEGGYPC>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <0828E69AE2D243E4AFDB81850D33C0B8@PEGGYPC>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: oatech <oatech7402@gmail.com>
Cc: netfilter@vger.kernel.org

Bonjour,

On Sun, 2014-04-06 at 18:24 +0200, oatech wrote:
> 
> Hi
> 
> I manage to change the /proc/net/netfilter/nf_log flags using echo > 
> /process/sys/netfilter/nf_log/ ...
> ( For IPv6 nflogging )
> 
> But it gets deleted at reboot.
> Worse, using a boot-time script fails ( the flags get overwritten )
> Using /etc/sysctl.conf doesn't seem to work.

I fear your firewall script is running after sysctl.conf settings are
installed. Usually the firewall script is triggering the loading of
logging modules.

> I end up using a 1minute cron job that rewrites the flags each minute.
> 
> Is there a better way ? Or a sysctl.conf kind config file ?

The most handy way can be to load the Netfilter modules at start For
example by putting them in /etc/modules (at least for debian). Then when
sysctl settings will be evaluated you should get a working config.

> Thanks  :-)

You're welcome (if my suggestion works) ;)

BR,
-- 
Eric Leblond <eric@regit.org>

