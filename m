From: "Samuel Jean" <sj-netfilter@cookinglinux.org>
Subject: Re: Iptables fails on -m state --state!
Date: Thu, 17 Feb 2005 12:36:14 -0500 (EST)
Message-ID: <49063.142.169.215.10.1108661774.squirrel@142.169.215.10>
References: <4214DD69.50903@fastwebnet.it>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <4214DD69.50903@fastwebnet.it>
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
To: Marco <marco.nicoloso@fastwebnet.it>
Cc: netfilter@lists.netfilter.org

On Thu, February 17, 2005 1:07 pm, Marco said:
> Hi there,
>
> even if the corresponding module is built into the kernel and loaded,
> iptables fails (No chain/target/match with that name, or something like
> that).
>
> What can I do?

Please show us the output of :

cat /proc/net/ip_tables_matches | grep state

And show us the rule you did input.

>
> Thanks
>
> Marco Nicoloso
>
>

Best regards,
Samuel


