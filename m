From: Michael Rash <mbr@cipherdyne.org>
Subject: Re: Trojan Spyware Malware Control
Date: Sat, 26 Jan 2008 00:21:00 -0500
Message-ID: <20080126052100.GA2412@cipherdyne.org>
References: <4799A03E.4040706@yahoo.co.in> <4799FFBE.2010505@riverviewtech.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-reply-to: <4799FFBE.2010505@riverviewtech.net>
Content-disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On Jan 25, 2008, Grant Taylor wrote:

> On 01/25/08 02:39, TRM wrote:
>> Using iptables rules in my gateway, how can i control/stop 
>> Trojan,malware,spyware. example, tutorial, docs, link anything if i can 
>> get from the list, it'll be my pleasure.
>
> This is akin to filtering phone calls purely by phone number only, no 
> names.  If you know the source address of good connections, you can allow 
> them.  However with out some information as to where the trojan, malware, 
> spyware, you are trying to block, there is little (but some) you can do at 
> the network / transport level.

There are also some things that iptables can do at the application layer
with the string match extension along with translated Snort rules.  The
fwsnort project http://www.cipherdyne.org/fwsnort/ (disclaimer: I wrote
it, so I'm obviously biased) can accomplish this translation.

For example, here is a Snort rule that describes some Spyware activity:

alert tcp $HOME_NET any -> $EXTERNAL_NET $HTTP_PORTS (msg:
"BLEEDING-EDGE MALWARE 180solutions Spyware (tracked event reported)";
flow: to_server,established; uricontent:"/TrackedEvent.aspx?"; nocase;
uricontent:"eid="; nocase;
reference:url,securityresponse.symantec.com/avcenter/venc/data/pf/adware.180search.html;
classtype: trojan-activity; sid: 2001397; rev:6; )


Using fwsnort, this becomes the following iptables command:

$IPTABLES -A FWSNORT_FORWARD_ESTAB -p tcp --dport 80 -m string --string
"/TrackedEvent.aspx?" --algo bm -m string --string "eid=" --algo bm -m
comment --comment "sid:2001397; msg:BLEEDING-EDGE MALWARE 180solutions
Spyware (tracked event reported); classtype:trojan-activity;
reference:url,securityresponse.symantec.com/avcenter/venc/data/pf/adware.180search.html;
rev:6; FWS:1.0.3;" -j LOG --log-ip-options --log-tcp-options
--log-prefix "[118] SID2001397 ESTAB "


All iptables commands built up by fwsnort are stored within the script
/etc/fwsnort/fwsnort.sh for easy execution.

> Firewalls are not intended to block this type of traffic, you should use 
> something that is.

In general, I agree with this.  If you want really good detection
measures for activity associated with Spyware et.al., then frequently
decoding operations against web traffic as well as pcre's become
involved, and at that point there is no viable iptables alternative
(unless you are running Snort inline built on top of the QUEUE target
or some such).

However, in some cases, having iptables offer some protection (after
all, it is inline by definition) can be handy.

--
Michael Rash
http://www.cipherdyne.org/
Key fingerprint = 53EA 13EA 472E 3771 894F  AC69 95D8 5D6B A742 839F


> Grant. . . .
> -
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
