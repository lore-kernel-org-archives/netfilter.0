From: "Kevin Smith" <ksmith@perfht.com>
Subject: Patch Problem.
Date: Wed, 16 Apr 2003 09:17:27 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <NGBBLGFEALDADHNDAAFFGEHHDJAA.ksmith@perfht.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_0005_01C303F9.003020C0"
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
To: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------=_NextPart_000_0005_01C303F9.003020C0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Not 100% sure if this is the correct forum, but I did get the patch from the
site :)
I Just Upgraded my RH7.2 Kernel to 2.4.20, all went well until it rebooted.
It reaches Grub, I choose the proper version, it displays the registers then
reboots.  I've been able to boot from an older kernel so I believe it is the
kernel itself. I am still troubleshooting this but would appreciate a few
suggestions on where to look. BTW the Only patches I put in it have to do
with NAT.
My next trick will be recompiling it with no patches (im hoping this does
the same thing as the only reason Im doing this is the patches), 
Thanks,
Kev

------=_NextPart_000_0005_01C303F9.003020C0
Content-Type: application/ms-tnef;
	name="winmail.dat"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="winmail.dat"

eJ8+IhsNAQaQCAAEAAAAAAABAAEAAQeQBgAIAAAA5AQAAAAAAADoAAEIgAcAGAAAAElQTS5NaWNy
b3NvZnQgTWFpbC5Ob3RlADEIAQ2ABAACAAAAAgACAAEGgAMADgAAANMHBAAQAAkAEQAAAAMACwEB
A5AGALwGAAAlAAAACwACAAEAAAALACMAAAAAAAMAJgAAAAAACwApAAAAAAADADYAAAAAAB4AcAAB
AAAAEAAAAFBhdGNoIFByb2JsZW0uIAACAXEAAQAAABYAAAABwwQahmeagpsjb+oR17ZiAKDJ2dlL
AAACAR0MAQAAABcAAABTTVRQOktTTUlUSEBQRVJGSFQuQ09NAAALAAEOAAAAAEAABg4A7nt2GgTD
AQIBCg4BAAAAGAAAAAAAAAALkP4K2R7WEbZUAKDJ2dlLwoAAAAsAHw4BAAAAAgEJEAEAAAByAgAA
bgIAAPwCAABMWkZ1Y2v2swMACgByY3BnMTI1FjIA+Atgbg4QMDMzTwH3AqQD4wIAY2gKwHOwZXQw
IAcTAoB9CoGSdgiQd2sLgGQ0DGDeYwBQCwMLtQewbwVAD0CQMCUgcwhwZSAGkPggdGgEABSgBCAU
4BSQGwWhCXBjBUACEHJ1bRAsIGJ1BUBJIGRwaWQgZxEwFVMKsHRfEOAWEANhFVMAkHQUkDqOKQqi
CoAW0Ep1cwVAMlUOAHJhAQAXEG15gQfwSDcuMiBLBJECZQMgdG8gMi403RrQMBZwB0ADIHcJ8AVA
uxxgHDF1AjADERiwIAlw9wbgE+AJgC4WwB1yANAVcPUEIEcWQGIWcBbQEOAdwJcRIBdkA2BwBJAg
dgSQXwCQAiAWcB1hFvBzC1F5+xVECXBnBAAYwBEQFVIDoO0dlHMeEBbAJyCAFoAJ4f8cEAJgH7Eb
gB2yGAQDkQbw6QSBIGsbFHMbgBbQI/D+bAiQI8EdYRU1JfUYsBEg/GxmHhEcEBhAGbADEBtR9wNg
HwAkYHMfcR0gDyAU1N0WkncIYCWgHBBwIBAFkLsHMBjBYRYQB9EUYGcXMP8pEQIgBCACIBxQFXAU
gRtxiQkAb2seEEJUVxVTeE9ubBqAF7MHkRbQcL8WoQuAHVIQ8CPBG3FkG4BHA/AU4AewQVQuGRRN
mxqAGzB4F1EFEGNrMQHPHDEj8B2BBaBtcAMQKjLbHWExE24bgC8mKAdwMFD/IDAqNzDgB5EYYyjg
H7IqMn5hFUQCIC7xHmEmYAOgSd8YQDDgKjcVNS8lKRZwGRTCVBDwbmtzLBkUGwAWdhkUEeEAPLAA
AAsAAYAIIAYAAAAAAMAAAAAAAABGAAAAAAOFAAAAAAAAAwADgAggBgAAAAAAwAAAAAAAAEYAAAAA
EIUAAAAAAAADAAeACCAGAAAAAADAAAAAAAAARgAAAABShQAAJ2oBAB4ACYAIIAYAAAAAAMAAAAAA
AABGAAAAAFSFAAABAAAABAAAADkuMAAeAAqACCAGAAAAAADAAAAAAAAARgAAAAA2hQAAAQAAAAEA
AAAAAAAAHgALgAggBgAAAAAAwAAAAAAAAEYAAAAAN4UAAAEAAAABAAAAAAAAAB4ADIAIIAYAAAAA
AMAAAAAAAABGAAAAADiFAAABAAAAAQAAAAAAAAALAA2ACCAGAAAAAADAAAAAAAAARgAAAACChQAA
AQAAAAsAOoAIIAYAAAAAAMAAAAAAAABGAAAAAA6FAAAAAAAAAwA8gAggBgAAAAAAwAAAAAAAAEYA
AAAAEYUAAAAAAAADAD2ACCAGAAAAAADAAAAAAAAARgAAAAAYhQAAAAAAAAsAUoAIIAYAAAAAAMAA
AAAAAABGAAAAAAaFAAAAAAAAAwBTgAggBgAAAAAAwAAAAAAAAEYAAAAAAYUAAAAAAAACAfgPAQAA
ABAAAAALkP4K2R7WEbZUAKDJ2dlLAgH6DwEAAAAQAAAAC5D+Ctke1hG2VACgydnZSwIB+w8BAAAA
ggAAAAAAAAA4obsQBeUQGqG7CAArKlbCAABQU1RQUlguRExMAAAAAAAAAABOSVRB+b+4AQCqADfZ
bgAAAEM6XFdJTkRPV1NcTG9jYWwgU2V0dGluZ3NcQXBwbGljYXRpb24gRGF0YVxNaWNyb3NvZnRc
T3V0bG9va1xvdXRsb29rLnBzdAAAAAMA/g8FAAAAAwANNP03AAACAX8AAQAAADEAAAA8TkdCQkxH
RkVBTERBREhOREFBRkZHRUhIREpBQS5rc21pdGhAcGVyZmh0LmNvbT4AAAAAAwAGEL5SMpoDAAcQ
7QEAAAMAEBAAAAAAAwAREAAAAAAeAAgQAQAAAGUAAABOT1QxMDAlU1VSRUlGVEhJU0lTVEhFQ09S
UkVDVEZPUlVNLEJVVElESURHRVRUSEVQQVRDSEZST01USEVTSVRFOilJSlVTVFVQR1JBREVETVlS
SDcyS0VSTkVMVE8yNDIwLEFMAAAAAMJx

------=_NextPart_000_0005_01C303F9.003020C0--


