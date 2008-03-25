From: Franck JONCOURT <franck.mail@dthconnex.com>
Subject: Re: Stopping =?UTF-8?Q?ip=5Fconntrack=5Fmax=20from=20resetting?=
Date: Tue, 25 Mar 2008 20:33:45 +0100
Message-ID: <be74a7029007782ed97a12bfcd070e49@localhost>
References: <alpine.LNX.1.10.0803250258490.9368@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.1.10.0803250258490.9368@fbirervta.pbzchgretzou.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org


On Tue, 25 Mar 2008 02:59:12 +0100 (CET), Jan Engelhardt

<jengelh@computergmbh.de> wrote:

> 

> On Monday 2008-03-24 15:09, Richard Andrews wrote:

>> Hello,



Hi,



>> We have a system running iptables, of which due to the incoming

>> traffic we've had to increase ip_conntrack_max via sysctl.

>> However, when restarting the service during any maintenance the

>> value we pass during sysctl.conf is reset to the default 65536.

>> Which then we are forced to run "sysctl -p" to reload our custom

>> value.  Is there a way to stop the iptables service from rewriting

>> ip_conntrack_max when issued a restart/reload?

> 

> That seems to be a bug of your distribution, because on mine,

> sysctl.conf is read and applied on boot.



Running Debian Sid, I can get the same behaviour. This is not

a bug, just a matter of boot sequence.



If you load sysctl configuration before your module is loaded

(should be nf_conntrack_ipv4, not quite sure), the entry 

net.ipv4.netfilter.ip_conntrack_max does not exist yet, so it

is not possible to set it to its value.



To get it work, I just added it to my module list, in order to 

load it at boot time before my sysctl configuration.



---

Franck Joncourt

http://www.debian.org/ - http://smhteam.info/wiki/



