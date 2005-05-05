From: Jason Opperisano <opie@817west.com>
Subject: Re: How to Get a DMZ hosts's trafic routed via a particular IP
	address on a firewall?
Date: Thu, 5 May 2005 17:34:58 -0400
Message-ID: <20050505213458.GA24884@bender.817west.com>
References: <c0e9781f05050509315ff51a77@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <c0e9781f05050509315ff51a77@mail.gmail.com>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Thu, May 05, 2005 at 05:31:54PM +0100, Greg Cope wrote:
> Hi all,
> 
> I have an iptables firewall that has 3 ethernet cards,
> eth0(Red/internet) , eth1 (DMZ), eth2 (lan)
> 
> eth0 has a few alias;
> 
> eth0 (217.154.55.249) gateway
> eth0:1 (217.154.55.250) for the mail server - an A record for mail.e-dba.net
> eth0:2 (217.154.55.253) for a webserver
> eth0:3 (217.154.55.245) another alias for a host on the DMZ
> 
> When sending trafic from this firewall host or any host behind it the
> trafic leaves from eth0 (217.154.55.249).
> 
> The firewalls default gateway router is an ADLS ethernet modem on 217.154.55.241
> 
> However mail (SMTP) trafic goes in via 217.154.55.250, and I would
> like it to go out via 217.154.55.250 as this has the correct
> (mail.e-dba.net) PTR records.

<--snip crazy routing stuff-->

sounds like you want 1-to-1 NAT for the mail server, which takes 2 NAT
rules (one for connections initiated *to* the mailserver, and one for
connections initiated *from* the mailserver):

  iptables -t nat -A PREROUTING -i eth0 -d 217.154.55.250 \
    -j DNAT --to-destination $MAILSRV_PRIV_IP

  iptables -t nat -A POSTROUTING -o eth0 -s $MAILSRV_PRIV_IP \
    -j SNAT --to-source 217.154.55.250

sounds like you already have the 1st rule in place.  make sure the 2nd
rule comes *before* any outbound SNAT/MASQ rule that is less specific.

-j

--
"Dennis Miller: I don't want to go on a rant, here, but America's
 foreign policy makes about as much sense as Beowulf having sex
 with Robert Fulton at the first battle of Antietam. I mean when
 a neo-conservative defenestrates it's like Raskolnikov filibuster
 deoxymonohydroxinate...
 Peter: What the hell does rant mean?"
        --Family Guy

