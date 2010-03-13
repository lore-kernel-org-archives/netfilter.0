From: Robert Nichols <rnicholsNOSPAM@comcast.net>
Subject: Re: drop dhcp request from a particular mac address, after a dhcp
 relay
Date: Sat, 13 Mar 2010 10:03:00 -0600
Message-ID: <hngcvl$e12$1@dough.gmane.org>
References: <937499.80494.qm@web31506.mail.mud.yahoo.com> <4B9B4860.5010509@chello.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4B9B4860.5010509@chello.at>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

On 03/13/2010 02:10 AM, Mart Frauenlob wrote:
> On 12.03.2010 03:27, netfilter-owner@vger.kernel.org wrote:
>> --- On Wed, 3/10/10, Robert Nichols<rnicholsNOSPAM@comcast.net>  wrote:
>>
>>   :-
>>>>
>>>>      iptables ..... -m bootp --mac-source
>>> 00:08:a1:ab:75:d1 -j DROP ?
>>>>
>>>> Well, if 'iptables' can't serve the purpose, how about
>>> ebtables ?
>>>
>>> Wouldn't it be a lot easier to adjust the DHCP server's
>>> configuration by
>>> adding a "deny" statement in the pool's permit list?
>>>
>>
>> True but manually editing the configuration file will require the dhcp server to be restarted, whereas 'iptables' and/or 'ebtables' can be scripted at runtime.
>>
>> Cheers.
>>
>
> most likely the dhcp server should have a 'reload' parameter?
> actually adding/inserting/deleting iptables rules does just the same (as
> a service restart). the whole ruleset inside the kernel gets reloaded
> for every single 'runtime' command you place. that is why there is
> iptables-restore, which loads all rules at once.

dhcpd does not have a "reload" action.  From the manpage for dhcpd:

     Whenever changes are made to the dhcpd.conf file, dhcpd must be
     restarted.  To restart dhcpd, send a SIGTERM (signal 15) to the
     process ID contained in /var/run/dhcpd.pid, and then re-invoke
     dhcpd.
     ...
     We realize that it would be nice if one could send a SIGHUP to the
     server and have it reload the database.  This is not technically
     impossible, but it would require a great deal of work, our resources
     are extremely limited, and they can be better spent elsewhere.

If you look at the "reload" action in the initscript, you'll see that
it actually performs a restart.  Since 'dhcpd' can be harmlessly
restarted there really should be no problem with doing that.

OTOH, if you're using 'dnsmasq' to perform the named and dhcpd services,
then restarting is a less attractive option.

As for iptables, if you're using a high-level firewall builder to
generate the rules, then yes, it will probably reload the entire rule
set if you make any change.  If you work at a lower level and use the
'iptables' command directly, then only the rule you add or change is
affected.  You can confirm that quite easily by running "iptables -vnL"
before and after the change and observing that the packet counts for
the other rules do not get reset.

-- 
Bob Nichols     "NOSPAM" is really part of my email address.
                 Do NOT delete it.

