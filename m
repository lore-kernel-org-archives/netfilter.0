From: "Jonathan Villa" <jonathan@innovativesource.net>
Subject: Re: Forward to DMZ addresses
Date: Mon, 22 Aug 2005 09:25:47 -0500 (CDT)
Message-ID: <59148.206.166.83.50.1124720747.squirrel@mail.innovativesource.net>
References: <57933.67.53.150.63.1123957195.squirrel@mail.innovativesource.net>	<430028A8.3090508@riverviewtech.net>	<22055.206.166.83.50.1124208942.squirrel@mail.innovativesource.net>	<4302D0F1.8030005@riverviewtech.net>	<19817.206.166.83.50.1124294643.squirrel@mail.innovativesource.net>	<43042660.7090405@riverviewtech.net>	<39173.206.166.83.50.1124389983.squirrel@mail.innovativesource.net>	<4304E651.1050807@riverviewtech.net>	<60615.206.166.83.50.1124398805.squirrel@mail.innovativesource.net>	<4305765F.8030600@riverviewtech.net>
	<39244.206.166.83.50.1124477852.squirrel@mail.innovativesource.net>
	<43065E41.7080407@riverviewtech.net>
	<56203.38.119.239.226.1124559049.squirrel@mail.innovativesource.net>
	<4307AC7A.40109@riverviewtech.net>
Reply-To: jonathan@innovativesource.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4307AC7A.40109@riverviewtech.net>
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
To: netfilter <netfilter@lists.netfilter.org>

>> I guess "exactly" =3D a setup similar to what I've seen commercial
>> firewall
>> products do, e.g. Sonicwall or Watchguard Firefox.  They have 3 NICS o=
n
>> the back, 1. connected to the T1 router, 2. connected to the LAN switc=
h,
>> 3. connected to the DMZ switch.  and rules are managed from the
>> Sonicwall
>> box itself... who knows what they're doing in the background... when w=
e
>> setup DMZ boxen, we connect them to the DMZ switch, assign them static
>> addresses from our IP pool, create a rule allowing access, and off we
>> go.
>> When shopping around for firewall products, I've also noticed that som=
e
>> specs say 3 NICS for DMZ/WAN/LAN connections sometimes more NICS (don'=
t
>> know why).  I'm trying to mimic this...  perhaps they have some heavy
>> routing rules in the back, something that would I need to learn...
>
> I have never used any of these ""commercial products as I have always b=
een
> able to get Linux to do what I wanted it to do.  That or I have changed
> what I want to so that it fits with in what Linux can do, though I don'=
t
> think this is very likely.
>
>> It's funny that you've just described exactly what I want to do...
>
> Hmm, maybe bridging is exactly what you want to do then and you just ar=
e
> not aware of it.

Perhaps. I'm going to start looking into this.

>> I currently have 3 nics, one connected to the DMZ switch, one connecte=
d
>> to
>> the LAN switch, and the third to the T1 router (via the VLAN switch
>> which
>> I plan to remove in September)
>
> If you want these three physical networks to have the same (logical)
> subnet then you will not be able to connect them via routing with out
> doing some much more complex routing via DNAT/SNATing on a couple of
> different routers connected to them.  Sure you could use UML routers an=
d
> do all of this with one box the this gets EXTREMELY complex for little
> gain.
>
>>>act like two completely independent routers that
>>>know nothing about the other unless your traffic comes in or goes a
>>>specific pair of interfaces.
>>
>> Yes!
>
> Ok, this seems a bit silly to me but if this is the way that you want t=
o
> go I'll be glad to help you.

That would be great!

>The question that I do ask you is do you
> want a fourth physical interface or could it be a logical interface on =
the
> network?  If it could be a logical interface that is connected to the
> other interfaces via a bridge then that may be a bit better.  But this =
is
> up for discussion.

I have one PCI slot left, it's currently being used by a SCSI card which
I'm not using.  I can replace it with a NIC.  I currently have 2 built-in
NICS plus one in the first PCI slot.  I logical interface is fine also.=20
It saves me from having to take the machine off of the rack.

>> all in all, all the information you've provided to me now makes sense.=
..
>> and it gives me a very good starting point for more Googling...
>
> *nod*  Information is a good thing.
>
 I know I will definitely need some help, but before I ask for, I'll need
to do some reading up on bridging so at least I understand any examples
given to me (starting with the previous one you gave).


