From: "Samuel Jean" <sj-netfilter@cookinglinux.org>
Subject: Re: copying conntrack state tables between two machines
Date: Mon, 7 Feb 2005 16:05:56 -0500 (EST)
Message-ID: <27280.142.169.215.10.1107810356.squirrel@142.169.215.10>
References: <4207D072.6040600@telefonica.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <4207D072.6040600@telefonica.net>
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
To: srg <srgqwerty@telefonica.net>
Cc: netfilter@lists.netfilter.org

On Mon, February 7, 2005 3:32 pm, srg said:
> Hello:
>
> I am thinking about writing a small program in order to "copy" the
> connections table from one machine to another machine.
> The final purpose is configure the second machine as a "backup" machine
> with linux-ha and if the primary fails then the backup will assume the
> traffic WITHOUT LOOSING CONNECTIONS (the purpose is that from the point
> of view of the clients and servers before/after the linux machines do
> NOT need to reestablish the connections they have established before th=
e
> failure).
>
> What do you think that is the best way to do this?

Well, my first guess is you are looking for ct_sync, that's _the_
netfilter-ha currently developped by Kristzian KOVACS and Harald Welte.

Take a look at :
http://svn.netfilter.org/cgi-bin/viewcvs.cgi/trunk/netfilter-ha/

Perhaps you'll get interested in giving some help on there.
(Instead of reinventing the wheel)

>
> In the other hand... It is possible to do the same with IKE SA & IPSEC
> SA (using pluto + kernel 2.6 built in ipsec) ?

I don't know anything about it.

>
> Thanks and best regards
>
>
Have a good day!

Samuel


