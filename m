From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: SNAT static vs. dynamic ip = pppoe
Date: Sun, 1 Dec 2002 01:11:42 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200212010111.42946.netfilter@newkirk.us>
References: <001e01c298dc$0a32e590$0a0110ac@nebuchadnezza>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001e01c298dc$0a32e590$0a0110ac@nebuchadnezza>
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
To: Tim Rodriguez <twr@bellsouth.net>, iptables-list <netfilter@lists.samba.org>

On Saturday 30 November 2002 08:50 pm, Tim Rodriguez wrote:
> Ok, I have loaded roaming peguin pppoe client for my DSL connection and=
 I
> need to alter my rules script to allow connections out the ppp0 interfa=
ce
> that rp-pppoe client creates. If my understanding is correct, (please f=
eel
> free to make constructive suggestions), if you have a dynamically assig=
ned
> ip address, it is better to use MASQUERADE.

Necessary, if the IP changes very often.

> Example: iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
>
> This due to the fact that MASQUERADE will obtain the presently assigned
> dynamic ip address and assigning it to every single packet going out
> through ppp0....correct? So no matter what ip address is dynamically
> assigned by my ISP I will always have a connection to the Internet via
> MASQUERADE...correct?

That's the idea.

> If I have a static ip address, (and I do), it is better to use SNAT.
>
> Example: iptables -t nat -A POSTROUTING -o ppp0 -j SNAT --to 1.2.3.4
>
> This will make matters more efficient due to the fact that SNAT
> automatically assigns the --to 1.2.3.4 ip address to every packet witho=
ut
> the overhead of having to obtained the ip address. Is this correct so f=
ar?

Precisely.

> Now, I have had some problems with my ISP in then getting it right with=
 my
> account statically assigning my ip address...I have had the experience
> where my ip address has changed in the past, as if I my account where s=
et
> for dynamically assigned ip address. I have called then and they
> "supposedly" have fixed this. My ip address has recently stayed static.
>
> To avoid future inabilities to access the Internet and knowing that my =
ISP
> has, in the past, bungle my account; would it be a safer bet to use
> MASQUERADE even though at the moment my ip address seems to be staying
> static? They may have finally gotten my account right.

Safer, probably, but likely unnecessary.  I am technically on a dynamic I=
P=20
with my ADSL, although it rarely changes unless the ADSL modem is reset. =
 I=20
have found the following to work well for me, and probably would be quite=
=20
suitable for your situation.

# PPPIP set to the IP of EXTIF, assumes it remains unchanged until
# reboot (or firewall restart) but is not truly static
PPPIP=3D$(/sbin/ifconfig "$EXTIF" | grep inet | cut -d":" -f 2 | cut -d" =
" -f 1)
# If PPPIP is different from the IP in our SNAT, issue warning
if !($IPTABLES -t nat -L | grep SNAT | cut -d":" -f 2 | grep -q $PPPIP)
then echo "IP has changed to "$PPPIP", Please issue restart."
fi

The only part you would need is the PPPIP assignment, which extracts the=20
current IP from "ifconfig ppp0".  (EXTIF=3D"ppp0" earlier in my script)  =
The=20
remainder is useful for me because my firewall is a fully parameterized=20
script, so each time I call it (ie service firewall list, or actually "fw=
=20
list" since I have a shell alias set up) it checks the setting and notifi=
es=20
me if the IP has changed from what my current rules use.

> Your comments, construtive suggestions, remarks and confirmations about=
 my
> thinking will be gratefully appreciated, as always.
>
> Sincerely,
> Tim Rodriguez
> Network Security Student

j



