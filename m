From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: I have the script with the rules, what now?
Date: Tue, 23 Mar 2004 09:10:27 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF567923A@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: Andrew Schulman <andrex@alumni.utexas.net>, netfilter@lists.netfilter.org

Don't forget to also place the following line at the beginning of the
file:
#!/bin/bash


Andrew Schulman wrote:
>> Hi everyone,
>>=20
>> I am a newbie, and I am probably asking a silly question, but anyway!
>>=20
>> I have 3 network cards (2 for internal networks and the other one to
>> Internet), and I have already started with my ruleset and have made a
>> script, based on the scripts I have found in several HOWTOs and
>> tutorials.=20
>>=20
>> My question is: how do I execute this script now?
>=20
> At a command prompt,
>=20
> chmod u+x script
> ./script
>=20
> Saioa, it sounds to me as though you need to learn some Unix/Linux
> fundamentals, in order to tackle the other problems that will surely
> come up when you're building a firewall.  I suggest that you get a
> good book about Unix or Linux, and read it.  For an introductory
> book, lots of people like Running Linux, from O'Reilly.  For an
> intermediate book, Unix Power Tools, also from O'Reilly, is terrific.
>=20
> Good luck,
> Andrew.

