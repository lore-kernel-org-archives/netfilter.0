From: "Jonathan Villa" <jvilla@e37.net>
Subject: Re: allow range syntax - perplexed
Date: Tue, 15 Jun 2004 14:27:25 -0500 (CDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1929.64.2.245.108.1087327645.squirrel@64.2.245.108>
References: <1613.64.2.245.108.1087318849.squirrel@64.2.245.108>
    <1087322336.2054.12.camel@localhost>
    <1846.64.2.245.108.1087324894.squirrel@64.2.245.108>
    <200406152004.45544.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200406152004.45544.Antony@Soft-Solutions.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

> On Tuesday 15 June 2004 7:41 pm, Jonathan Villa wrote:
>
>> I have more information now.
>>
>> Here is the background:
>> A machine running MySQL is to be locked down for access only to a sele=
ct
>> group of people working from home and people at the office, hence the
>> xx.xx.xx.0
>
> Is the MySQL machine on the same subnet as the office people trying to
> access
> it, or is there a firewall in between, with the MySQL on a DMZ network?

Sad to say, but there is no firewall.  Machines are open to the world,
hence the xxx.xxx.xxx.xxx everywhere.


> If it's the latter, are you sure your office machines aren't being
> masqueraded
> in some way by the firewall when they try to access the MySQL server, s=
o
> that
> it sees an address on the firewall instead of the real address of the
> clients?
>
>> I've noticed that the script works fine for anyone who is not on the
>> network but for those who are, well the rules block access to them all
>> the
>> time.
>
> I suggest you add a LOGging rule at the bottom of the INPUT chain and s=
ee
> what
> source address the packets which are not being ACCEPTed are coming from=
.

Good point.  Since I am fairly new to iptables, I usually carry my book
with me, unfortunately, I don't have it today.  But I will implement lots
of logging to help once I figure out how to :)


> Regards,
>
> Antony.
>
>


