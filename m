From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Fwd: Re: limit HTTP-GET requests per IP
Date: Fri, 30 Jan 2004 16:45:34 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401301645.34669.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

Here's another suggestion whcih somebody sent me.

----------  Forwarded Message  ----------

Subject: Re: limit HTTP-GET requests per IP
Date: Fri, 30 Jan 2004 13:02:59 -0300
From: Mart=EDn <martin@familia-fiumara.com.ar>
To: Antony Stone <Antony@Soft-Solutions.co.uk>

You can use an apache module, called mod_throttle (from snert.com if I
remember ...)

En Fri, 30 Jan 2004 15:23:31 +0000, Antony Stone

<Antony@Soft-Solutions.co.uk> escribi=F3:
> On Friday 30 January 2004 1:00 pm, Nikolai Dahlem wrote:
>> Hi,
>>
>> I got a problem. Various people are stupidly trying to mirror my
>> webserver
>> (wget and the like), which puts heavy load on it, due to the dynamic
>> generation of pages. Is there a way to specify a limit on requests per
>> second on an ip basis ?
>
> I suggest you install Squid in Accelerator mode in front of the server
> and use
> the delay pools facility to limit bandwidth to groups of users.
>
> Antony.

--=20
How I want a drink, alcoholic of course, after the heavy chapters involvi=
ng=20
quantum mechanics.

 - 3.14159265358979

                                                     Please reply to the =
list;
                                                           please don't C=
C me.


