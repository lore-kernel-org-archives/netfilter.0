From: Gregory Ray <gregr@seekmobileinteractive.com>
Subject: Re: Using IPTables to route both dynamic local address and static 
	addresses provided by ISP?
Date: Mon, 7 Sep 2009 09:51:20 -0700
Message-ID: <2b4d96e00909070951r2c2003f0of1c916b34877da0f@mail.gmail.com>
References: <2b4d96e00909061414v270d580i56e1613d75886f4@mail.gmail.com>
	 <4AA4D2EC.4030801@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4AA4D2EC.4030801@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

Yes, sorry for the confusion and my newbness, I am using a linux box
(Ubuntu distro) as a DHCP server. I have eth0 to internet via pppoe
(high speed fiber).

The second option sounds best since I already have the public
addresses assigned to the server but I don't know what to assign to it
for a gateway.

The ISP provided us with 8 or 10 (I forget exactly how many) public
IPs. I have the servers (two of them) plugged directly into the switch
(which is plugged into the linux box). I then have multiple wireless
routers also plugged into the switch to provide internet access over
wifi to different parts of the building (around 20 workstations in
total).

On Mon, Sep 7, 2009 at 2:31 AM, Pascal
Hambourg<pascal.mail@plouf.fr.eu.org> wrote:
> Hello,
>
> Gregory Ray a =E9crit :
>> I am running iptables as a dhcp router from a pppoe connection
>
> Iptables is neither a router nor a DHCP server. Do you mean "I am
> running a Linux box working as a DHCP server and as a router" ?
>
>> can I have it route the standard local ips to the
>> workstations but also have my other servers utilize the static ips
>> available in the block from my isp?
>
> Sure. I suppose that the privante addresses are masqueraded with the
> PPPoE public address. For the public static block, you have two optio=
ns.
>
> 1) Assign private addresses to the servers and use DNAT+SNAT to creat=
e
> 1:1 mapppings with public addresses from the static block.
>
> 2) Assign public addresses from the static block to the servers.
>
> Are the servers and workstations on the same LAN ?
> What is the size of the public static block and how many public serve=
rs
> do you have ?
>



--=20
Gregory Ray
CTO, Seek Mobile Interactive, Inc.

---

This e-mail message, including any attachments, is for the sole use of
the intended recipient(s) and may contain information that is
confidential and protected by law from unauthorized disclosure. Any
unauthorized review, use, disclosure or distribution is prohibited. If
you are not the intended recipient, please contact the sender by reply
e-mail and destroy all copies of the original message.
