From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: what are the possible chain policies?
Date: Sat, 29 Mar 2003 15:31:01 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200303291531.01216.netfilter@newkirk.us>
References: <Pine.LNX.4.44.0303291426440.7401-100000@dell>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0303291426440.7401-100000@dell>
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
To: "Robert P. J. Day" <rpjday@mindspring.com>, iptables mailing list <netfilter@lists.netfilter.org>

On Saturday 29 March 2003 02:29 pm, Robert P. J. Day wrote:
>   i was just summarizing the behavior of iptables and i'm puzzled
> by a contardiction between the man page and oskar's tutorial.
>
>   regarding possible chain policies, oskar lists DROP, ACCEPT
> and REJECT.
>
>   the man page, however, suggests all of ACCEPT, DROP, QUEUE
> or RETURN, which seems a bit odd.
>
>   since i've only used DROP or ACCEPT until now, i'm not sure
> what the right answer is.
>
>   anyone?

Well, try them... ;^)

I am only able to set DROP or ACCEPT.  Any other policy I try to set=20
replies with "iptables: Bad policy name".  This is with v1.2.5 and=20
v1.2.6a.

j


