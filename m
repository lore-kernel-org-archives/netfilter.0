From: Alex Satrapa <alex@lintelsys.com.au>
Subject: Re: Apply rules to 1 UDP port but port used as a socket: possible?
Date: Wed, 11 Feb 2004 14:00:16 +1100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40299AC0.80104@lintelsys.com.au>
References: <D4EF10CCEB2CE742BEEA9838C590B0E80113FA41@ftrdmel2.rd.francetelecom.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <D4EF10CCEB2CE742BEEA9838C590B0E80113FA41@ftrdmel2.rd.francetelecom.fr>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: zze-Proxy GRALL O ext FTRD/SVA/LAN <ograll.ext@rd.francetelecom.com>
Cc: netfilter@lists.netfilter.org

zze-Proxy GRALL O ext FTRD/SVA/LAN wrote:
> I'm trying to use a socket (on port 1727) to decode some proprietary UDP =

> packets. When I've decoded them I want to apply a DNAT rule (and then a=20
> SNAT  too) to this port using a filter on @IP:port source for all=20
> following packets=85

So do you have Machine F which is the firewall, and machines A, B and C whi=
ch are the ultimate destinations, and you want to have UDP packets from mac=
hine X (elsewhere) being sent to A, B or C  by F based on some information =
in the first packet F receives from a new host X? You could write your "mon=
itor" to set up new rules based on the first packets that arrive, with the =
remainder being "deflected" by the firewall rules.



