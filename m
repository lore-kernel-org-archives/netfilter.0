From: Lopsch <lopsch@lopsch.com>
Subject: [Fwd: Re: questions about chain traversal, new ascii diagram]
Date: Thu, 06 Jan 2005 22:11:17 +0100
Message-ID: <41DDA975.1010607@lopsch.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig9C170FDF7DE68EDD50481967"
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: Netfilter-Mailinglist <netfilter@lists.netfilter.org>

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig9C170FDF7DE68EDD50481967
Content-Type: multipart/mixed; boundary="------------080902090602000906080403"

This is a multi-part message in MIME format.
--------------080902090602000906080403
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit

Curby . schrieb:
> ----Original Message Follows----
>
>> http://joerg.fruehbrodt.bei.t-online.de/pics/abb3_netfilter_ablaufdiagramm.jpg
>>
>>
>> What about the mangle decisions, do you also want to include them :D?
>
>
> It looks reasonable, but if this is true then the article I mentioned
> was wrong.  Perhaps there should be a disclaimer by the link on the
> netfilter documentation page?
>
> Does anyone know the answers to my other questions? Specifically, is it
> due to style or technical reasons that people don't filter traffic in
> PREROUTING, and instead put the same rules in both FORWARD and INPUT?
>
> I think you were probably just being facetious, but I wouldn't mind
> knowing when the mangle chains come into play.  If we have to jump to
> them explicitly though, then I'll just RTFM. =)
>
> Thanks again!
>
> --Curby
>
>
>
They are traversed before the other ones e.g.

PREROUTING mangle -> PREROUTING nat -> FORWARD mangle -> FORWARD filter
-> POSTROUTING mangle -> POSTROUTING nat

PREROUTING mangle -> PREROUTING nat -> INPUT mangle -> INPUT FILTER ->
local process

local process -> OUTPUT mangle -> OUTPUT nat -> OUTPUT filter ->
POSTROUTING mangle -> POSTROUTING nat

Greets

--

PGP-ID 0xF8EAF138


--------------080902090602000906080403
Content-Type: application/pgp-signature;
 name="signature.asc"
Content-Transfer-Encoding: base64
Content-Disposition: inline;
 filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0NClZlcnNpb246IEdudVBHIHYxLjIuMS1u
cjEgKFdpbmRvd3MgWFApDQoNCmlRSVZBd1VCUWQycFB5WGUwTHQ0WjRGcEFRS1VhQkFBbDR1
VDRsSjFlZjl5VE8zK1lReS9DKzhZeEF4RnJXWGoNCkhCSFhETSs5MFVWM2lEUmVDdTZ2OUlw
Z0JTNGlQdGtQa3NYUDVFMnB6QmpzSXZiRW1UclFMcCtDeTVXNEtVQ1kNClBxWHRKZHhwR25C
d0ZTdjlpbDlZSTUyTEQrMVNFOTZPaXZKRk14dHhsZlhKSm9qTG8yT3ZjZ1dJTmZrWm5DWGEN
ClQyR0V3VnczTFlERG5DRU1tRVFNWEFkVWJDQ2tRT08zQTM2S3VJNGxHaCtqS3hlTDdidjFM
M24rRnNPWHZLOW0NCitLVk5BM3lTeXY2YXV4c2lOYzhxNjBkVVVmREtqbWdnWTFCNGtnRkRB
QzR1TWlYdTZ6b0tpZUVHNzd1TUJaRkQNCnplcTJob3daS09YREhDT2NiL1haVnlYQjhIdTcy
ZUdDZHluSXB2V2VIWUE0QUpNUm1zelh5QkE4bUwrKzFMcnkNCjJYUys3Y2Y5bExHUzFmOU1N
VndIWkhSYWlIc3NJcEdCR3VBdlIzSzg5Qkx4cWo0RFVvQ240Z2R5TXU4RFdHVjINCkt0MWFK
QnAwMTBVODZMZTQ3bXNTcE5ZZTk2alUzMWJMVFRMSUlsSHBCR3RYR29jZWgxZHlvOFdoVjJG
WXNnaDUNCjJ1MmtlcWtXYkIwNTJEdGhHaGduaGdscXVNUldxcU5QenRJM09Ca1R2amtrdU1o
YXp6emg0RDBJVkVyWUhqSWsNCmxtRitEVFdDd3FkZnNuUXJPVWVyYWh4UEd5b3JIa05LOVFW
WnYvcnlxN1VkM1B2WjNOWCswNzBycEtEK2xnTzQNCmFSTEZuNFpIRllibU10R1pRcVROakFz
a29Wd0cyS2J3SWNOTUI1bTdJbVRCM3VnMFQrTzE4M1BHRjBBY1hPWTcNCkpVeXZTK1FnNnFN
PQ0KPUd0RTkNCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQ0KDQo=
--------------080902090602000906080403--

--------------enig9C170FDF7DE68EDD50481967
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1-nr1 (Windows XP)

iQIVAwUBQd2pdSXe0Lt4Z4FpAQIZiQ//dBQeK0J7dKhzw0c0LaUEXbn0OIoMusF0
xkWsCVsI7KDAcFFEIVuFx++UR6/8gjX5QZiOITwbc/NZKSl//7VmJH8HtbxRY11q
ShO1mq4DskzeN1QKSS0iJpOy9n/ixrYCg82kT22dbfWeSfI+bJu/FthsjaxVR8s7
zKM0qb9d3fwrnUveTv9X63FnwL+nz2EkNfG1WagV9cVnkCozwTWkstAVNISn/KCF
RcXrtZrTJ7X2ty+9NonvfycVNB6RY+K4kWagjBW+fPupMwBoEvUChrx/5vjtY4pD
cdXrK0hU3rtamK2hxU7XNJnjrNLcEajlyFXaqJ45bZKspRss42ukGA0WkxhQpCh7
77aQaaL6kBymchYemw6fhRiztHyGOvKys0RdgPrBTV6jH52u/1VXDtQSQF/psoCF
d/Ec3T5xwb+lWKceJebfdKOnE1IooETqInW8xx0O/WgXrdFehSngX/du73TDIHyv
v058gKPqX6F32HgMhq4E+RvXqXfBgqPdF+T3pzNQZnF5ONJfv87b8pA3ZzCTCYqx
SYj5wGkVM+SX3DoPyUT7xwr7yrCS+hHXfzSZigeuKs6phXdCo33FzjEFfhwdyuld
pNLIOSfLEDEb9BysjkiSM0j+cFGQRV52vMikvD6bbBAk8pBnKAiAwR/7s43nWHOm
0UorgS4q25M=
=pMVz
-----END PGP SIGNATURE-----

--------------enig9C170FDF7DE68EDD50481967--

