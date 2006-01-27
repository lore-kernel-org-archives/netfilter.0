From: Carl-Daniel Hailfinger <c-d.hailfinger.devel.2006@gmx.net>
Subject: Re: Completely Bypassing a Firewall?!
Date: Fri, 27 Jan 2006 15:54:57 +0100
Message-ID: <43DA3441.5090901@gmx.net>
References: <1138198038.16454.73.camel@localhost.localdomain>
	<33402.138.106.11.116.1138351847.squirrel@intern.southpole.se>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <33402.138.106.11.116.1138351847.squirrel@intern.southpole.se>
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
To: Jimmy Hedman <jimmy.hedman@southpole.se>
Cc: netfilter@lists.netfilter.org

Jimmy Hedman schrieb:
>>We just heard a rumor about our rival company, that they have developed
>>a "system" that can completely bypass a properly-configured/locked-down
>>firewall (netfilter or any other).

Properly locked down = no connection to the outside possible, not even
via proxy. No ICMP, no DNS, no SMTP. Well, in that case it would be
interesting to see them break that. OTOH, such a thing makes it impossible
for anyone to surf the net or send mails.

>>Is this truly possible? with only external access and no software that's
>>already been planted inside the firewall?
>>
> 
> If you have someone at the "inside" there is no problem to create tunnels
> with for example OpenVPN that completly "bypasses" the firewall. If you
> create a tunnel with OpenVPN over https and bridge the networks together
> you could get everything through with the traffic looking just like
> ordinary https-traffic.
> But with only access from the outside it is very vary hard, if not
> impossible.

Yes, but finding a sufficiently naive user will probably be easy. I wrote
such a tool myself (but it used a few java quirks), so if you can get
somebody inside to click on something you present him, every other defense
(except cutting the wire physically or logically) is worthless. Hey, you
could even use the WMF exploit for such a purpose.


Regards,
Carl-Daniel
-- 
http://www.hailfinger.org/

