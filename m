From: "Catalin(ux aka Dino) BOIE" <util@deuroconsult.ro>
Subject: Re: Compiling sch_tbf.c in user space
Date: Fri, 18 Feb 2005 09:25:25 +0200 (EET)
Message-ID: <Pine.LNX.4.62.0502180852140.22548@webhosting.rdsbv.ro>
References: <20050217212013.96729.qmail@web50408.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="-1646943047-597496953-1108710733=:22548"
In-Reply-To: <20050217212013.96729.qmail@web50408.mail.yahoo.com>
Content-ID: <Pine.LNX.4.62.0502180925190.22548@webhosting.rdsbv.ro>
Sender: lartc-admin@mailman.ds9a.nl
Errors-To: lartc-admin@mailman.ds9a.nl
List-Help: <mailto:lartc-request@mailman.ds9a.nl?subject=help>
List-Post: <mailto:lartc@mailman.ds9a.nl>
List-Subscribe: <http://mailman.ds9a.nl/mailman/listinfo/lartc>,
	<mailto:lartc-request@mailman.ds9a.nl?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://mailman.ds9a.nl/mailman/listinfo/lartc>,
	<mailto:lartc-request@mailman.ds9a.nl?subject=unsubscribe>
List-Archive: <http://mailman.ds9a.nl/pipermail/lartc/>
To: vinay mathew <vinaymathew80@yahoo.com>
Cc: netfilter@lists.netfilter.org, lartc@mailman.ds9a.nl

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1646943047-597496953-1108710733=:22548
Content-Type: TEXT/PLAIN; charset="iso-8859-1"; format="flowed"
Content-Transfer-Encoding: quoted-printable
Content-ID: <Pine.LNX.4.62.0502180925191.22548@webhosting.rdsbv.ro>

> I have already looked at netem and am using that for
> modelling parameters like delay, jitter etc.
> But the situation for bandwidth modelling is not there
> in netem.The reason im doin it in user space is that i
> need to route all packets coming into the system
> through a single tbf.Using the kernel and tc system
> the tbf is attached to a particular interface and
> hence i do not have a common tbf for all interfaces.I
> want a common tbf to shape all the traffic before
> sending the packets out on the respective interfaces.I
> have just come across the idea of using IMQ devices
> for this task.I believ it is possible for the packets
> coming in from different interfaces to be passed thro
> a common tbf attached to an IMQ before sending them
> out on the final interfaces.Im just not sure if the
> packets routed to thro to the imq are again routed to
> the correct interface finally.Do u have any idea on
> this one.I would greatly appreciate any help on this.
> thanx in advance

You can take a look at Jamal's actions, especialy redirect.
I didn't use IMQ, sorry.

http://lwn.net/Articles/121407/

>>
>>> idea we came up with was to route packets from
>>> different hosts to user space using Netfilter and
>> then
>>> send them through a common tbf implemented in user
>>> space in order to model a simple bandwidth shaping
>>> scenario.
>>> Routing packets to user space has been easy using
>> the
>>> Netfitler hooks and libipq.
>>> My problem now is that i need to implement a tbf
>> in
>>> user space.I was thinking if its possible to
>> modify
>>> the sch_tbf.c code to make it work in user space
>> so
>>> that i can compile it as part of my user space
>> program
>>> that handles the packets sent to user space thro
>>> netfilter.Ive tried modifying this code a bit but
>> it
>>> gives me a huge number of errors when i try to
>> compile
>>> it as a simple C program in user space.
>>> If this is not possible does any one have a simple
>>> basic implementation of the token bucket filter
>> that i
>>> can use in my program to test this scenario or any
>>> other ideas on how to implement this tbf in user
>>> space.
>>> Thanx a million in advance.......and im sorry i
>> didnt
>>> know exactly where to post the query so thats why
>> i
>>> posted to both lists.
>>> thanx and kind regards
>>> vinay
>>>
>>>
>>>
>>>
>>> __________________________________
>>> Do you Yahoo!?
>>> Yahoo! Mail - You care about security. So do we.
>>> http://promotions.yahoo.com/new_mail
>>> _______________________________________________
>>> LARTC mailing list / LARTC@mailman.ds9a.nl
>>> http://mailman.ds9a.nl/mailman/listinfo/lartc
>> HOWTO: http://lartc.org/
>>>
>>
>> ---
>> Catalin(ux aka Dino) BOIE
>> catab at deuroconsult.ro
>> http://kernel.umbrella.ro/
>>
>
>
> =3D=3D=3D=3D=3D
> Vinay Mathew
> Technische Universit=E4t - Braunschweig,
> Zimmer 41215, Rebenring 64, 38106 Braunschweig,
> Deutschland.
> Ph No:+4917622086705
>
>
>
>
>
>
>
> __________________________________
> Do you Yahoo!?
> All your favorites on one personal page =96 Try My Yahoo!
> http://my.yahoo.com
>

---
Catalin(ux aka Dino) BOIE
catab at deuroconsult.ro
http://kernel.umbrella.ro/
---1646943047-597496953-1108710733=:22548--
_______________________________________________
LARTC mailing list / LARTC@mailman.ds9a.nl
http://mailman.ds9a.nl/mailman/listinfo/lartc HOWTO: http://lartc.org/
