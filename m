From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: what it is the better masquerade or SNAT
Date: Fri, 29 Nov 2002 21:10:37 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200211292110.37445.netfilter@newkirk.us>
References: <web-110040@gecyt.cu>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <web-110040@gecyt.cu>
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
To: Administrador de Red <admin@gecyt.cu>, netfilter@lists.netfilter.org

On Friday 29 November 2002 04:32 pm, Administrador de Red wrote:
> I has a Ip public true, I want to do a firewall, but i don
> know wich I kind Should i use, masquerade or SNAT?,
> someone can i help?.
>
> thanks very well.

MASQUERADE is only necessary if the IP is dynamic, with SNAT you must spe=
cify=20
the IP address to use.  MASQ will work in the same situations as SNAT, bu=
t=20
incurs more overhead because netfilter will check the IP of the outbound=20
interface every time.

In my own setup, my IP is technically dynamic, but in reality it stays st=
atic=20
for minimum several days, usually until I manually reset the ADSL modem, =
so I=20
use SNAT.  The rare times this is a problem I simply restart my firewall=20
script, which clips the current IP from a "ifconfig ppp0" and builds rule=
s=20
with it.

I can get away with this because usually only myself and my 8-year-old=20
actually use the machines on my network, so if my IP changes it wouldn't=20
create any real problems except that he couldn't connect to disney.com or=
=20
wherever... :^)  ("DADDY!! I can't get to lego.com!"..."service firewall=20
restart"..."Try now...")

j


