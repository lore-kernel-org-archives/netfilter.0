From: Tommy McNeely <Tommy.McNeely@Sun.COM>
Subject: Re: Subject: Re: OT: curious about eth0/eth1
Date: Wed, 08 Jan 2003 16:36:15 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <38490000.1042068975@leverage>
References: <3E1CB1E0.1060708@aut.ac.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <3E1CB1E0.1060708@aut.ac.nz>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org



--On Thursday, January 09, 2003 12:18:56 PM +1300 Ian Batterbee 
<ian.batterbee@aut.ac.nz> wrote:

>> On a side note... the case you speak of is easily averted by using
>> different cards :)
>>
>> [root@pickles root]# cat /etc/modules.conf
>> alias parport_lowlevel parport_pc
>> alias eth0 3c59x
>> alias eth1 eepro100
>> alias eth2 tulip
>
>
> I'm probably missing something here, but how does that help ?  The
> problem is that if that the eth0 module fails to load for whatever
> reason, then the card that would normally be eth1 would be known as eth0.
>
> If you provide aliases... all that means is that you can do
>
> modprobe eth0
> modprobe eth1
>
> but ... as far as I understand it, those module aliases names have no
> link to the name the kernel allocates to the interface, so if eth0
> failed, it would load eth1 (aliased to eepro100), and the eepro100 would
> be known as eth0 to the kernel.
>
> Or is there some kludgy relationship between module alias names and
> interface names ?
>


I assumed there was a relationship... I can't really test that from here.. 
but um.. I assume it would load eth1 as eepro100 ?? if you compile your 
network devices into the kernel, then you may hafta get a little trickier

Tommy

PS: why doesn't my mail client treat this as a list like redhat's ?


>
>



--
Tommy McNeely         --        Tommy.McNeely@Sun.COM
Sun Microsystems - IT Ops - Broomfield Campus Support
Phone:  x50888 / 303-464-4888  --  Fax:  720-566-3168


