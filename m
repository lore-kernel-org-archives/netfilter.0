From: Scott Mayo <scotgmayo@gmail.com>
Subject: Re: Public IP to Private IP
Date: Tue, 25 Feb 2014 12:06:02 -0600
Message-ID: <CAFPGR9i8pwkL+ws+20NoRVatgmX4ZPZAau5seyCWTA2Ziffwzg@mail.gmail.com>
References: <CAFPGR9jhpurA644xdfWc6dF58iVCc5t7mbUw6NsjxPqYQxtUHw@mail.gmail.com>
	<CAFPGR9jQFUyQhjyH-kBdDj7cJvNrub5uFaGmStXRtWRfO6NFWQ@mail.gmail.com>
	<CAFPGR9hjWxAUxkP_EerkWr5NiWRZpWZa7=8UfNfaDbYRBgBASg@mail.gmail.com>
	<CAFPGR9gxAsMskRaO1CNkdf5Wvg6zX+oSd0-xrqaYNHYcNLEGtg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type;
        bh=7aRGadHYwWl73UzifG+oowsm//LmbFcQDWG4/V7k49M=;
        b=wviHcRfQIx1Whjs6MuuC8Iv++Dbb5kjB0VLFt9krZ0UYnBWrFMMJrRsXeYOQTR0XGE
         QrCdQxh0SI8BFqSNcMi62wo7zmtOMF1CphL5MtiLHymt6EdQ7rHjY1O9q9BaXjl4sQAj
         hwPHi7de+s5zQWEiFOA5PIn3933J6LDtQ8WCl24odvXTuHOqqOZmyMTTbKuepSPAwAPX
         fa1RVY8Un/Bx0BjKHj0OIn1FF+dPmnH7ym5sq6qiMMRCpQzWDIbfB4aShcXRNRlLanVv
         OIvxzCDsE/OlddkHKE5AbLhdv8yCbmyBTcIEXS/ZXtbKm3PvzFJx27ql8JSOQ/juz4EQ
         n38A==
In-Reply-To: <CAFPGR9gxAsMskRaO1CNkdf5Wvg6zX+oSd0-xrqaYNHYcNLEGtg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Mon, Feb 24, 2014 at 3:56 PM, Scott Mayo <scotgmayo@gmail.com> wrote:
> On Mon, Feb 24, 2014 at 1:13 PM, Scott Mayo <scotgmayo@gmail.com> wrote:
>> On Mon, Feb 24, 2014 at 12:22 PM, Scott Mayo <scotgmayo@gmail.com> wrote:
>>> On Mon, Jan 27, 2014 at 1:22 PM, Scott Mayo <scotgmayo@gmail.com> wrote:
>>>> I am having some troubles getting my public IPs routed to my private IPs.
>>>>
>>>> Here is an example.
>>>> Private IP of the main server with my IPTables:  192.168.0.1
>>>> Public IP of the main server:  1.1.1.1
>>>> I also have 1.1.1.2 and 1.1.1.3 as public IPs attached to the public nic.
>>>> Domain name example.org is pointed to 1.1.1.2
>>>>
>>>> I am trying to get the following public IPs to Private IPs:
>>>> 1.1.1.2 -> 192.168.0.2
>>>> 1.1.1.3 -> 192.168.0.3
>>>>
>>>> If I am outside my network and go to example.org, it seems to work fine.
>>>> If I am inside my network and go to 192.168.0.2 then it works fine.
>>>> If I go to example.org from inside my network then it goes back to
>>>> 192.168.0.1 instead of 192.168.0.2
>>>>
>>>> Maybe this does not have to do with IPTables even since it works with
>>>> an IP, but I thought I would ask here.  I do not have an internal DNS
>>>> server.
>>>>
>>>> Here are the rules that I have:
>>>>
>>>> IPTABLES -t nat -A PREROUTING -d 1.1.1.2 -p tcp -j DNAT
>>>> --to-destination 192.168.0.2
>>>> IPTABLES -t nat -A POSTROUTING -d 192.168.0.2 -j SNAT --to-destination 1.1.1.2
>>>>
>>>> Any suggestions would be appreciated.
>>>> Thanks.
>>>
>>>
>>> I ended up finishing my setup on my new filter server.  I had not
>>> messed with this problem and wanted to wait until I got it into place.
>>>  I am back to it now.  I appreciate the suggestions so far.  I am
>>> getting ready to setup an internal DNS server, but until I do, I would
>>> like to get the IPTABLES working.
>>>
>>> Here are the IPTABLE rules that I have in place:
>>>
>>> $IPTABLES -t nat -A PREROUTING -d 1.1.1.2 -p tcp -j DNAT
>>> --to-destination 192.168.0.2
>>> $IPTABLES -t nat -A POSTROUTING -d 192.168.0.2 -s 192.168.0.0/16 -j
>>> SNAT --to-source 1.1.1.2
>>> $IPTABLES -t nat -A POSTROUTING -o eth0 -j SNAT --to-source 1.1.1.1
>>>
>>> Here is quick breakdown
>>> ifcfg-eth0 = 1.1.1.1  #public IP of the main Squid/IPTABLES box
>>> ifcfg-eth0:0 = 1.1.1.2   #Virtual IP which I want to forward on to the
>>> other webserver box: example.org
>>> example.org resolves to 1.1.1.2 fine
>>> ifcfg-eth1 = 192.168.1.1  #private IP of the main Squid/IPTABLES box
>>> 192.168.1.2  #Is the private IP that I want forward on to the other
>>> webserver box: example.org
>>>
>>> My IPTABLES are on my Squid box.  I have just played some more and
>>> found that if I take the proxy settings out of my browser and type in
>>> example.org in the URL, it works fine.
>>>
>>> If I leave the proxy settings in and type in example.org then it comes
>>> back to the main Squid box address of 192.168.1.1.
>>>
>>> Any idea why that would matter?  I do drop port 80 and port 3128 so
>>> that the proxy cannot be gone around.  For testing purposes though, I
>>> took those two drops out and it is still doing it.
>>>
>>> I'll get a copy of my IPTABLE rules and post also.  Just thought I
>>> would post this first and see if someone had an idea of what I might
>>> be looking for.
>>
>>
>> It just dawned on me that this may be pulling from the Squid cache so
>> I'll wait until after school and clear that.  Maybe my IP rules are
>> correct now since it is working without going through the proxy.
>
>
> I just wiped my Squid cache and that was not it.  I have even put in a
> very, very simple set of rules that I will post below.  example.org is
> pointed to the 1.1.1.2 IP address.
>
> If I go to example.org (private = 192.168.0.2/public = 1.1.1.2)
> without the proxy settings in the browser to point to my Squid box
> (192.168.0.1) then it resolves fine.
>
> If I go to example.org with the proxy settings in my browser to point
> to my Squid box then it takes me to the webserver on 192.168.0.1
> (which is my squid box and has the IPTABLES on it).
>
> I guess I am not understanding why it would make any difference if I
> am directed through the proxy or not since everything goes through
> this box one way or another.  Here is the simple IPTABLES that I used
> to test with.
>
> Thanks for any info.
>
> #!/bin/sh
> EXT_IP="1.1.1.0/24"
> EXT_IFACE="eth0"
> EXT_BROADCAST="1.1.1.255"
>
> INT_IP="192.168.0.1"
> INT_IP_RANGE="192.168.0.0/16"
> INT_IFACE="eth1"
>
> LO_IFACE="lo"
> LO_IP="127.0.0.1"
>
> IPTABLES="/sbin/iptables"
>
> /sbin/depmod -a
>
> /sbin/modprobe ip_tables
> /sbin/modprobe ip_conntrack
> /sbin/modprobe iptable_filter
> /sbin/modprobe iptable_mangle
> /sbin/modprobe iptable_nat
> /sbin/modprobe ipt_LOG
> /sbin/modprobe ipt_limit
> /sbin/modprobe ipt_state
>
> #Non required modules
> /sbin/modprobe ipt_owner
> /sbin/modprobe ipt_REJECT
> #/sbin/modprobe ipt_MASQUERADE
> #/sbin/modprobe ip_conntrack_ftp
> #/sbin/modprobe ip_conntrack_irc
> #/sbin/modprobe ip_nat_ftp
> #/sbin/modprobe ip_nat_irc
>
> echo "1" > /proc/sys/net/ipv4/ip_forward
>
> #Create default policies and FLUSH the chains
> $IPTABLES -P INPUT ACCEPT
> $IPTABLES -F INPUT
> $IPTABLES -P OUTPUT ACCEPT
> $IPTABLES -F OUTPUT
> $IPTABLES -P FORWARD ACCEPT
> $IPTABLES -F FORWARD
>
> $IPTABLES -F
> $IPTABLES -t nat -F
> $IPTABLES -t mangle -F
>
> #Allow the local network
>
> $IPTABLES -t nat -A PREROUTING -d 1.1.1.2 -p tcp -j DNAT
> --to-destination 192.168.0.2
> $IPTABLES -t nat -A POSTROUTING -d 192.168.0.2 -s 192.168.0.0/16 -j
> SNAT --to-source 1.1.1.2
> $IPTABLES -t nat -A POSTROUTING -o eth0 -j SNAT --to-source 1.1.1.1
>

I am not sure if this thinking is correct or not, but here is what I
did.  I got to looking at:
$IPTABLES -t nat -A POSTROUTING -d 192.168.0.2 -s 192.168.0.0/16 -j
SNAT --to-source 1.1.1.2

Since the browsers are pointed to the proxy at 192.168.0.1, I thought
that maybe once it comes from the squid box that maybe it is using the
public IP from eth0 instead of the private from eth1?  I don't know
how all that works technically so I just removed the -s 192.168.0.0/16
in case it was trying to come from the public side which is
1.1.1.0/24.

As I said, not really sure if that is correct thinking or not, but now
it works fine.


-- 
Scott Mayo
Mayo's Pioneer Seeds
