From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: debugging rc.firewall
Date: Tue, 18 Jun 2002 19:02:45 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206181802.g5II2pA29007@Networker.rockstone.co.uk>
References: <20020618130639.2ec22286.mt@open2web.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020618130639.2ec22286.mt@open2web.com>
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
To: Netfilter Mailing List <netfilter@lists.samba.org>

On Tuesday 18 June 2002 6:06 pm, Mark Tessier wrote:

> In trying to debug rc.firewall on a gateway/firewall between a LAN subnet
> and DMZ subnet, I've put in the following
>
> iptables -A INPUT -i eth1 -j LOG
>
> immediately after iptables --policy INPUT DROP
>
> As mentioned my log messages are not registering in /var/log/messages and
> I'm not sure why.

You need to specify the "logging level" so that syslogd.conf knows what 
category the messages are are can send them to the appropriate file.

Depending on what version of iptables you have, you need to say:

iptables -A INPUT -i eth1 -j LOG --log-level=<level>

where <level> is either a number or a word (some versions of iptables don't 
accept the word variant, but it is more intuitive if you can use that, so try 
it first and see if it is accepted - if not, use the number instead).

I use --log-level=info and this logs quite happily into /var/log/messages

I believe the corresponding numeric value for this is 6, so you would say:

iptables -A INPUT -i eth1 -j LOG --log-level=6

Note that you can also specify --log-prefix as an option to the LOG target, 
which puts a fixed message into the log entry - this can be useful for 
indicating which one of your LOG rules was responsible for generating a given 
logfile line.

eg: iptables -A INPUT -i eth1 -j LOG --log-level=info --log-prefix="Input"
iptables -A FORWARD -i eth1 -j LOG --log-level=info --log-prefix="Forward"

etc....

 

Antony,

