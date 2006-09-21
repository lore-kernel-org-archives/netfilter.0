From: Dimitri Yioulos <dyioulos@firstbhph.com>
Subject: Re: Port forwarding question
Date: Thu, 21 Sep 2006 17:23:30 -0400
Message-ID: <200609211723.31082.dyioulos@firstbhph.com>
References: <200609211555.39634.dyioulos@firstbhph.com>
	<200609211653.46613.dyioulos@firstbhph.com>
	<451300B6.2050902@rtij.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <451300B6.2050902@rtij.nl>
Content-Disposition: inline
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

On Thursday September 21 2006 5:14 pm, you wrote:
> Dimitri Yioulos wrote:
> >On Thursday September 21 2006 4:25 pm, you wrote:
> >>Greetings,
> >>
> >>Dimitri Yioulos wrote:
> >>>Noob, question:
> >>>
> >>>I want to allow a vendor to access a piece of equipment on our
> >>>LAN (192.168.100.46) through port 4000 from outside via a server
> >>>in our DMZ (www.xxx.yyy.zzz).  While I should know how to do
> >>>this, I'm not 100% sure.  Can someone help?
> >>
> >>DNAT.
> >>
> >>for example:
> >>iptables -t nat -A PREROUTING -d www.xxx.yyy.zzz -i eth1 -p tcp
> >>--dport 4000 -j
> >>DNAT --to 192.168.100.46
> >
> >eth1 being the DMZ iface?
>
> No, your Internet interface.
>
> This rule says: if destination is www.xxx.yyy.zzz and it comes in
> through eth1 and it's tcp and it's on port 4000, then DNAT to the
> internal server. Obviously, if the packet comes from the vendor, it
> must come from the Internet, so the interface in -i must be your
> Internet interface.
>
> You could leave this out, but that opens up all kind of nastiness
> if you access this port on www.xxx.yyy.zzz from your DMZ (the
> return packets will go straight to your client in the DMZ, will not
> go through your firwall so will not be de-DNATted. Your client will
> get confused as it gets packets from somewhere it's not expecting
> them. In short, it will not work). You could replace that -i with
> "! -i $DMZ_IF", meaning if it comes in from any interface but the
> DMZ interface. Then you can access it from any interface (read your
> internal interface) other than your DMZ interface.
>
> HTH,
> M4

Stupid me.  Of course it's the inet interface.  And, I appreciate the 
explanation.

Many, many thanks to all for you help!

Dimitri

-- 
This message has been scanned for viruses and
dangerous content by MailScanner, and is
believed to be clean.


