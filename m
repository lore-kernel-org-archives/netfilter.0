From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: Possible bug for delete specific rule w/ RedHat 8.0, Kernel 2.4.18, Iptables 1.2.6a
Date: Thu, 17 Oct 2002 22:18:23 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210172218.23813.netfilter@newkirk.us>
References: <PFEPIPDMGMFEOIBPJIIEMEBBCEAA.dpaul@gmx.net>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <PFEPIPDMGMFEOIBPJIIEMEBBCEAA.dpaul@gmx.net>
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
To: Daniel Paul <dpaul@gmx.net>, netfilter@lists.netfilter.org

On Monday 14 October 2002 07:05 am, Daniel Paul wrote:
> Hello,
>
> I have problems deleting a rule from any chain by specifying the rule
> itself, for example:
>
> iptables -A FORWARD -p tcp -s $NET_IN --sport 1024: -d 0/0 --dport smtp=
 -j
> ACCEPT
>
> and then
>
> iptables -D FORWARD -p tcp -s $NET_IN --sport 1024: -d 0/0 --dport smtp=
 -j
> ACCEPT
>
> gives me a "Bad rule: Does matching rule exist in chain" error. Btw, th=
e
> variables used
> here are of course defined.

Are you doing all this in the same script?  If you define NET_IN in a scr=
ipt,=20
use it to add the rule, then end the script and try to delete from anothe=
r=20
script or command line then you would have a problem, since $NET_IN only=20
would be defined within the original script.  If you redefine NET_IN in=20
another script to expand to the same thing, it should work, but if it is=20
something dymanic (MY_DYN_IP, IE) then the redefinition could quite easil=
y=20
end up being different from the original rule.  If you manually expand NE=
T_IN=20
(or whatever symbols used) and use that in the deletion it should work.=20

Of course if this is all in the same script (which doesn't make much sens=
e)=20
then this isn't applicable.

j

