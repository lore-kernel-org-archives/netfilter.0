From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: per user IP adresses
Date: Mon, 5 May 2003 14:09:54 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030505140954.1b2a2d0f.arnt@c2i.net>
References: <01CEA3A5B8B2D511890F0002A5870AEC0128AD85@EXCHANGE>
	<000401c312e0$8bf85d70$0200a8c0@WKSJOHN>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000401c312e0$8bf85d70$0200a8c0@WKSJOHN>
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
To: netfilter@lists.netfilter.org

On Mon, 5 May 2003 10:30:06 +0200, 
"John Guntenaar" <john@guntenaar.nl> wrote in message 
<000401c312e0$8bf85d70$0200a8c0@WKSJOHN>:

> That won't work either because the IP's are aliased, so the all have
> the same MAC address.

..you have everybody on the _same_ box???  'iptables -nL OUTPUT' ?

..on your lan firewall; check 'iptables -nl FORWARD' for _outbound_
rules, too, add port matches as needed.

> I just want that userid 1234 can't use IP 1.2.3.4 BUT userid 1235 CAN
> use that IP to bind for things like IRC sessions (for like a vhost or
> something).

..ok, hook up your userid to an ip alias and match that, _then_ drop
irc traffic for your bad(?) buddies.  Rule _sequence_ rules.  ;-)
You can set your irc sw to "talk" with just that one ip? 

..no, I'm old school and too lazy to type at irc speed, so I have 
_no_ idea.  ;-)

-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.



