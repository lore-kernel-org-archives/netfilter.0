From: Dave Osbourne <dave@osbourne.uk.eu.org>
Subject: Using dynamic IP lists to block forwarding
Date: Tue, 9 Jan 2018 09:28:26 +0000
Message-ID: <57cdc69a-1be8-d117-61a9-0de376f54152@osbourne.uk.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-GB
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@vger.kernel.org

Hi,

Not totally sure this is an acceptable post... I'm trying to find a 
"firewalling principles" discussion group, but everything I find online 
is either old and not longer used or brand / package specific.

This question is specifically about services that MUST be exposed to the 
"big bad internet" (i.e. internal MS Exchange servers for OWA, POP / 
IMAP etc) and I'd like to exclude any discussion of whether this 
(exposure) is good plan, focusing rather on how to best handle 
forwarding (via iptales or deeper level inspection)

Our current Watchguard does a temporary IP block on "bad" activity (this 
could be from bad SYN/ACK/PSH or from a log watch), but I've noticed 
that co-ordinated probes are coming from many different IPs, so this 
sort of response doesn't help that at all.

One suggestion I've had from a security agency is to identify a list of 
"good" (in my case "UK" IPs) and block everything else.  I don't think 
this is good since there are 2 modes of failure.

 1. The list might be incorrect and legit requests will be blocked, the
    list will have to regularly derived (there might be a source who knows)
 2. "bad" IPs might be on that list and allowed


My response is to implement a dynamic block list (say) 
http://iplists.firehol.org/?ipset=blocklist_net_ua - using iptables on 
(say) Debian.  I've looked at an hour of probe data and it seems that 
that /*specific */list would have blocked 97+% of known bad probe 
attempts (and the list is updated regularly).

I hope someone might be able to provide argument for / against... or 
share an alternative...

Regards,
Dave

---
http://dave.osbourne.uk.eu.org/

