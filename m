From: Walther@gehag-dsk.de
Subject: Re: Fwd: Re: FreeS/WAN + static NAT + 2 machines
Date: Tue, 24 Sep 2002 17:28:04 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OF97101FEC.E6B99807-ONC1256C3E.005480B2-C1256C3E.0054FC9A@GEHAG-DSK.DE>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Transfer-Encoding: 7bit
To: Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: netfilter@lists.netfilter.org

hey Antony,

i got this setup work. 

these are the changes i made to my setup:

iptables -t nat -A POSTROUTING -o $EXT -s 172.16.2.121 -j SNAT --to 
<external_freeswan_ip>
iptables -t nat -A PREROUTING -i $EXT -d <external_freeswan_ip> -j DNAT 
--to 172.16.2.121
iptables -A FORWARD -p 50 -s 172.16.2.121 -j ACCEPT
iptables -A FORWARD -p 50 -d 172.16.2.121 -j ACCEPT
iptables -A FORWARD -p 51 -s 172.16.2.121 -j ACCEPT
iptables -A FORWARD -p 51 -d 172.16.2.121 -j ACCEPT
iptables -A FORWARD -s 172.16.2.121 -p udp --sport 500 -j ACCEPT
iptables -A FORWARD -d 172.16.2.121 -p udp --dport 500 -j ACCEPT

this works fine for me. i can browse the internal http, ping all 
workstations and server and check mails with Lotus Notes.

but i cannot mount any Windows or SAMBA share. do you know something about 
this???

Best Regards,
MfG.

Stefan Walther
stefan_walther@gehag-dsk.de
dienst.: +4930/89786448
Funk: +49172/3943961
http://www.gehag-dsk.de

-------------------------------------------------------------- 
Linux/UNIX is like an Indian Tipi:
No Windows, no Gates and Apache inside.

Outgoing Mail is certified mistake-free. 
Examined by DOGMATIC infallibility system. 
Version 6.04




Antony Stone <Antony@Soft-Solutions.co.uk>
Sent by: netfilter-admin@lists.netfilter.org
23.09.2002 18:04

 
        To:     netfilter <netfilter@lists.netfilter.org>
        cc: 
        Subject:        Fwd: Re: FreeS/WAN + static NAT + 2 machines


----------  Forwarded Message  ----------

Subject: Re: FreeS/WAN + static NAT + 2 machines
Date: Mon, 23 Sep 2002 16:57:41 +0100
From: Antony Stone <Antony@Soft-Solutions.co.uk>
To: nefilter@lists.netfilter.org

On Monday 23 September 2002 4:51 pm, Walther@gehag-dsk.de wrote:
> > I'm intrigued to know what quantity of data you're trying to shovel
> > through FreeS/WAN that you find the performance of the machine a
> > limitation.   Please tell me your link bandwidth and a rough spec of 
the
> > machine/s you're using.
>
> I have a 2MBit with about 15 official IP's.

What type / speed CPU on the FreeS/WAN box ?
How much memory ?
What load average does it generate ?

I'm surprised you are experiencing performance problems with less than
2Mbits/sec through FreeS/WAN.

> i will install the testmachine on wednesday in the DMZ, and will try 
again
> with the modes. i rechecked my rules and in my test-environment it works
> now (with NAT).

What did you change ?

> i will tell you on wednesday if it works or not, coz there is no way to
> test it before this date.

Okay.

Antony.

--

Having been asked to provide a reference for this man,
I can confidently state that you will be very lucky indeed
if you can get him to work for you.

-------------------------------------------------------





