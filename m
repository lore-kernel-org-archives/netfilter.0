From: Martijn Klingens <mklingens@ism.nl>
Subject: Re: NEW vs INVALID
Date: Tue, 1 Oct 2002 12:33:50 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210011034.24616.mklingens@ism.nl>
References: <m2elbb4w7h.fsf@pcwi1068.uni-muenster.de> <1033399610.1633.38.camel@elendil> <m23crr4gu0.fsf@pcwi1068.uni-muenster.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <m23crr4gu0.fsf@pcwi1068.uni-muenster.de>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

On Monday 30 September 2002 17:50, Jens Lechtenb=F6rger wrote:
> In fact, I had a similar command, but this again allows
> SYN+FIN-packets.
>
> What I am doing now is
>
>  "--state NEW --tcp-flags SYN,ACK,FIN,RST SYN"...

This makes quite some sense, but it makes me wonder what the use is of the =

'--syn' option. Also, does that mean I have to update my firewall script if=
 I=20
want to achieve tighter security? I guess so :(
--=20
Martijn



