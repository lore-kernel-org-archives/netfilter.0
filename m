From: Gerd Zemella <gzemella@gmx.net>
Subject: Re: Port forwarding doesn't work.
Date: Mon, 13 Oct 2003 17:02:34 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1066057354.4010.44.camel@Marvin>
References: <LFEHKEBEBHAFGJBMNKAOKELACCAA.markee@bandwidthco.com>
	 <200310121411.00898.Herman@AerospaceSoftware.com>
	 <1065994862.3562.10.camel@Marvin>
	 <200310121604.06545.Herman@AerospaceSoftware.com>
	 <1066029196.4010.1.camel@Marvin> <073301c39196$c4e2ddb0$eb00010a@andromeda>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <073301c39196$c4e2ddb0$eb00010a@andromeda>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: "Adam D. Barratt" <netfilter.list@adam-barratt.org.uk>
Cc: netfilter@lists.netfilter.org

Ups, two faults. Too much for a monday morning.....

Am Mon, den 13.10.2003 schrieb Adam D. Barratt um 16:32:
> Gerd Zemella wrote, Monday, October 13, 2003 8:13 AM
> 
> [Please *don't* post HTML to the list]
> 
> > Hi Herman,
> >
> > Am Mon, den 13.10.2003 schrieb Herman um 00:04:
> >
> > > Well, here goes:
> > > iptables -t nat -I PREROUTING  -d 192.168.10.100 -j DNAT --to
> 192.168.10.245
> >
> > did you wrote this --to? you must write --to-destination!
> 
> Nope. In context, --to is equivalent to --to-destination. There's absolutely
> nothing wrong with using it in the manner above (in fact, every single DNAT
> rule in our firewall script does -j DNAT --to).
> 
> Adam
> 
> 


