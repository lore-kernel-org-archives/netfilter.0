From: Sven Schuster <schuster.sven@gmx.de>
Subject: Re: How to log dropped packet ?
Date: Wed, 16 Jul 2003 20:20:01 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F159751.7010907@gmx.de>
References: <000701c34b93$c4da9180$96f2f8db@independence.co.kr> <1058359786.6618.33.camel@raylinux.internal> <20030716131925.M66225@tripnotik.dyndns.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030716131925.M66225@tripnotik.dyndns.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Julien Didron <admin@tripnotik.dyndns.org>
Cc: netfilter@lists.netfilter.org


Hi,

you could take a look at the ULOG target. You'll need the additional 
ulogd-package
from http://gnumonks.org/gnumonks/projects . With this you can log 
pakets to plain
text files, databases, etc. More information is in the iptables man-Page 
and probably
in the ulogd package itself, I haven't used it for some time.

Hope this helps

Sven


Julien Didron wrote:

>Hi all,
>
>I apologize for being a little OT, but has anybody tried to log to another 
>file than /var/log/syslog when using -j log ? if so, thanks for sharing the 
>experience ;o)
>
>--
>Open WebMail Project (http://openwebmail.org)
>
>  
>


