From: "Samuel Jean" <sj-netfilter@cookinglinux.org>
Subject: Re: -j ULOG
Date: Thu, 27 Jan 2005 16:00:12 -0500 (EST)
Message-ID: <14338.142.169.215.10.1106859612.squirrel@142.169.215.10>
References: <1106856472.14748.10.camel@localhost.localdomain> 
	<9326.142.169.215.10.1106857751.squirrel@142.169.215.10>
	<1106857486.14748.23.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1106857486.14748.23.camel@localhost.localdomain>
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
To: Mohammad Khan <mkhan@lextranet.com>
Cc: netfilter@lists.netfilter.org

On Thu, January 27, 2005 3:24 pm, Mohammad Khan said:
> On Thu, 2005-01-27 at 15:29, Samuel Jean wrote:
>> On Thu, January 27, 2005 3:07 pm, Mohammad Khan said:
>> > Hello list:
>> >
>> > For -j ULOG, where the logs output to, by default.
>> > Where can I read more documentation to configure ULOG.
>>
>> http://gnumonks.org/projects/project_details?p_id=3D1
>
>
> I see a missing link for source rpm
> another link to download source in bz2.

Can't tell.

>
> How this source is related to iptables?
> I already have iptables installed. and my iptables does not through any
> error for -j ULOG. I haven't installed ulogd yet. So, where are my log
> going?

They are going nowhere as they are thrown on a netlink socket without
anything listening to.

> Do I need to install ulogd to write log to mysql database?

Yes, ULOG rely on the userspace daemon ulogd to write the logs.
That's ulogd to write via syslog, on a file, to a mysql database or
any other back-end supported by ulogd.

>
> Thanks,
> Mohammad
>
Have a good day,

Samuel


