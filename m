From: gazoxtapod <gazoxtapod@embarqmail.com>
Subject: Re: Can't override filter section OUTPUT DROP / INPUT DROP Policy
Date: Fri, 25 Aug 2017 20:03:43 +0000
Message-ID: <59A0829F.3020409@embarqmail.com>
References: <59A0313C.1020409@embarqmail.com> <84281c34-08f4-2979-ad33-78d8bec77c39@wagsky.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; d=embarqmail.com; s=ctl201402; c=relaxed/simple;
        q=dns/txt; i=@embarqmail.com; t=1503691424;
        h=From:Subject:Date:To:MIME-Version:Content-Type;
        bh=o/DvWG6juqUbJSVo4WegcBHMdBU=;
        b=A/oJwBGFwnHzkS3ZvY1XWGXmJEYvxWurA71Q8pQZ/laA86qBYWYRdP0aJ5eVEW8c
        oYMiS+wY87XX9fgwj48vh+Se7XcvZWMfna6qPi9+3PJp0pO+aBRTuHjm38dxjMa3
        6i+AwDjpFoua3cWFsXD1md73wk6g2vXkmeJFIEAleHknNTdIzUmlGWem/83gT470
        j0TUSdfK6sZCjlxd/4m7TmplULCJyP5vgNoKmoJn0e9atX/u0Q/KnDjh8ghPip9u
        ofBoNsfz/KyycXZgaZnkUBN8iVOrvuPoZkHpx3q0w1aClHR/n3zQ0v/nI1s34/WN
        sbh5vLjLjt2IkvS8wQBOFw==;
In-Reply-To: <84281c34-08f4-2979-ad33-78d8bec77c39@wagsky.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

System TOPOLOGY:

       LAN         Static IP    _________
Desktop ----------------------|         |
                               |         |     _________
Tablet ) ) ) ) ) \       DHCP |         |    |         |
                  WiFi AP -----| LinkSys | ?? |  ZyXEL  |
Cell Phone ) ) ) /            | BEFSX41 |----| PK5100Z |---- ISP DSL
                        DHCP   | Router  |    |  Modem  |
Desktop ----------------------|         |    |_________|
                        DHCP   |         |
RPi2 -------------------------|_________|

I am strong in hardware and test software, but VERY weak in networking. 
  Everything WORKS just fine right now.  I am just paranoid about 
leaving a device available continuously for connection to the Internet 
if I don't have to.  My desktop system doesn't even have a hard/SSD 
drive ... it is a Linux Mint LiveMedia system running from ROM SD or USB 
flash drive, and it is powered down or disconnected from the Internet 
when not in use.  Before I do any secure transactions, I reboot a virgin 
system.

I have seen a lot of demand for a "DSL Usage Monitor" due to data caps 
imposed by ISPs.  I looked for a solution because my wife wants 
streaming TV, but didn't find anything worthwhile.  I pulled the Pi out 
of my "Junk Box" when I came up with this idea.  The RPi2 appears to be 
a great solution ... cheap ... only a cheap LCD display (20x4) required 
... wired or WiFi ... and it works GREAT:

PYTHON REQUESTS CODE:   Courtesy of "Roger Shruber" #Python
=====================  Payload is the login arguments strings
s = requests.Session()
resp = s.post(login_url, data=payload)
rawout = s.get(data_url)
rawdata = str(rawout.text)
print rawdata              <-- parse this data!

That's how EASY it is!  I want to keep it as simple and plug-and-play as 
possible.  If using the same modem, the only things that have to be 
loaded are the account arguments.  Why complicate elegant simplicity?  I 
plan to publish the results as a template for a DIY project for others 
who are worried about data caps.  Plug it in and watch it!

However, why not make it as bullet-proof as possible, IF IT DOESN'T 
COMPLICATE THINGS ... beyond all recognition.  Hence, IF the Pi firewall 
can be configured to block all extraneous access, let's DO IT!  I'm just 
to dumb and stubborn to think that it can't be done, but then I've been 
wrong MANY times before.  I know NOTHING about VLANs, proxys, and d#!n 
little about iptables.

So, thanks for your input, but no, I'm not putting more hardware into 
the system and I really don't want to change the topology and I don't 
want to mess with the router.  I just need help in tweaking the firewall 
rules, or convincing me that it really can't be done.  Hey, that's what 
the iptables are for, isn't it ... controlling access to fit the needs 
of the system?

This is excruciatingly simple, but halfway close:
  . . sudo iptables -P INPUT DROP        <--  P:Policy
  . . sudo iptables -P OUTPUT ACCEPT

So I'm really hoping for an answer: Why doesn't the table in my op work?

I sincerely do thank everyone for their patient pondering of this case.
Blessings in abundance, all the best, & ENJOY!
Art

On 08/25/2017 04:12 PM, netfilter@allycomm.com wrote:
> Without knowing the network topology you're using, suggesting an
> approach can be challenging.
> With the right topology, your firewall rules can become nearly "trivial"
>
> I would suggest either a second physical
> interface (a USB Ethernet dongle) or a VLAN to easily segregate traffic
>
> Approach 1 -- Provide staticroute to modem  ...
>
> Approach 2 -- Bridge to VLAN  ...
>
> Approach 4 -- Proxy connections to the modem  ...
>
>
> On 8/25/17 7:16 AM, gazoxtapod wrote:
>> [...]
>> I'm trying to use the Pi2 as an appliance to monitor DSL Usage from my
>> DSL modem (192.168.0.1), which is between a (nearly default
>> configuration) firewall router for my LAN and the ISP.  The Pi2 box
>> project, when completed, is strictly an appliance that is a client to
>> the modem, reading date/time and DSL usage and error status, and
>> displaying this on an LCD display.
>>
>> * I need to allow the Pi2 to negotiate a DHCP request for an IP
>> address from the router on bootup. (This is the system default - no
>> need to do anything)
>> * I need to allow the Pi2 to make a periodic connection to the modem
>> and fetch data. (I do this with Python Requests - it works)
>> * I am trying to block all other types of incoming and outgoing
>> connections. This is what I can NOT do.
>>
> [...]
>
