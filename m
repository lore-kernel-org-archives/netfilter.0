From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: How filter IP address if it *changes* often?? (think dhcp)
Date: Fri, 28 Mar 2003 10:11:36 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200303281011.36468.netfilter@newkirk.us>
References: <20030327200056.A18916@spawar.navy.mil> <Pine.LNX.4.53.0303272314530.4873@gypsy> <20030327222617.A19911@spawar.navy.mil>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030327222617.A19911@spawar.navy.mil>
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
To: seberino@spawar.navy.mil, Steve Mickeler <steve@warning.ca>
Cc: netfilter@lists.netfilter.org

On Friday 28 March 2003 01:26 am, seberino@spawar.navy.mil wrote:
> Steve
>
> Thanks for the email.  Let me rerephrase my question.
> Perhaps I wasn't clear....
>
> How can you have a rule on your INPUT chain that
> only allows your local box's IP address if "local box IP address" can
> change without notice due to your DSL ISP's decision?

Have a cron job that compares the output from ifconfig for the given=20
interface with the output from "iptables -n -L INPUT".  If they differ,=20
then the job can delete the current rule and insert a new one.

I wrote something similar for my system to adapt to a slow-changing IP on=
=20
my DSL and update my SNAT rule and a text file with the new IP.

It's unusual, however, to actually need to use your own IP in the INPUT=20
chain, as the only destination IP's that should appear there are those=20
of the box itself, either public (internet) private (lan) or localhost=20
(127.0.0.1 typically) and those three situations can usually be=20
determined by matching interface instead of IP.  Normally the only time=20
you'd need to match the IP in INPUT from the internet is when you have=20
multiple public IP's, and usually in such cases they are static.  (but=20
not always, granted)

j


