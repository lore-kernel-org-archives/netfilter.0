From: Tommy McNeely <Tommy.McNeely@Sun.COM>
Subject: Re: OT: curious about eth0/eth1
Date: Wed, 08 Jan 2003 09:27:57 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <88830000.1042043277@leverage>
References: <6620000.1041983993@leverage>
 <200301072247.24369.netfilter@newkirk.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <200301072247.24369.netfilter@newkirk.us>
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
To: netfilter@newkirk.us, netfilter@lists.netfilter.org

Joel,

You pose an interesting case, one to which I had certainly not thought of, 
but as my "firewall" is generally the DHCP server for the internal network 
(among other things) it pretty much has to have a static IP configured for 
eth0.

On a side note... the case you speak of is easily averted by using 
different cards :)

[root@pickles root]# cat /etc/modules.conf
alias parport_lowlevel parport_pc
alias eth0 3c59x
alias eth1 eepro100
alias eth2 tulip


anyhow.. I am glad folks are responding.. I think its an interesting topic 
:)

Tommy



--On Tuesday, January 07, 2003 10:47:24 PM -0500 Joel Newkirk 
<netfilter@newkirk.us> wrote:

> On Tuesday 07 January 2003 06:59 pm, Tommy McNeely wrote:
>> I am curious about why people choose to make a certain interface
>> internal or external...
>
>> I notice several people pick eth0 as their outside interface, and
>> sorta "oh yea" the rest of the inside network is on eth1.  I know the
>> linux kernel could really care less what they are called, its mostly a
>> "neatness" thing I guess... Also it seems like that leaves your box
>> open to attack from the time it installs (if you do a NET based
>> install) till the time you get around to actually putting a firewall
>> on it.
>
> Why would this in particular leave a box exposed?
>
> I think that the main reason for 'some one way, some the other' is random
> chance.  However, consider this scenario:
>
> You have two NICs, eth0 and eth1. The connections on one you trust (-i
> eth0 -j ACCEPT), the other you don't.  One of them fails, or the board
> works loose from it's socket, or something, so that upon booting the
> machine you only have one interface.  No matter which board fails, the
> remaining board would be eth0.  If eth0 is your 'trusted' internal
> network in normal conditions, and it fails, then suddenly the untrusted
> network is operating under the trusted network's rules.  However, the IP
> assignment (if static!) would remain that of the trusted network, so as
> long as eth0 is configured with a static IP this shouldn't present a
> risk.  If, however, both are dynamic, (say DHCP assigned) then this
> would qualify as a security hole, possibly a huge one.  To be fair, this
> is probably a very rare intersection of situations, but if eth0 is the
> untrusted network, then any failure would be an annoyance, not a risk.
>
> j
>
>
>



--
Tommy McNeely         --        Tommy.McNeely@Sun.COM
Sun Microsystems - IT Ops - Broomfield Campus Support
Phone:  x50888 / 303-464-4888  --  Fax:  720-566-3168


