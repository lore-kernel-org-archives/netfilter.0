From: <bmcdowell@coxhealthplans.com>
Subject: RE: Redirect to Honeypot?
Date: Wed, 19 Nov 2003 12:32:46 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7A3B4AA360FDEF448F3390421FC8D73101131A0F@coxhpexg.coxhp.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----_=_NextPart_001_01C3AECB.8754E1B0"
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
To: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------_=_NextPart_001_01C3AECB.8754E1B0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


Thanks for all the off-list interest.  I just thought I'd add one side =
note about Nessus.  It took over 48 hours to scan 6 ip's (with one of =
them running a real webserver), never correctly identified the host =
OS'es I have, and failed to produce the same results twice.

Thanks,

Bob

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of
bmcdowell@coxhealthplans.com
Sent: Friday, November 14, 2003 10:25 AM
To: netfilter@lists.netfilter.org
Subject: RE: Redirect to Honeypot?



For the curious, this is what I think I'm going to stick with for now:

	  Brouter --- DMZ
		|
	    (NAT)=09
		|
 	 (Decoy Box) --- 25% TARPIT, 25% DROP
		|
 	 (Random HoneyPot) --- (One real W2K server, One real Linux, 10 =
emulated Honeyd devices)


Just as I had drop rules before, I now have DNAT rules first.  E.g.

	iptables -t nat -A PREROUTING -p tcp -d (webserver) --dport ! 80 -j =
DNAT --to (decoy box)
	iptables -A FORWARD -p tcp -d (webserver) --dport ! 80 -j (LOG/DROP)

Just to muddy the waters a bit, I added the TTL patch to the box =
distributing packets to my honeypots. E.g.

	iptables -t mangle -A POSTROUTING -j TTL --ttl-inc 2

That makes TTL's from the NAT'ed boxes and the real boxes have the same =
value...

Now when I aim Nmap at my webserver, for example, it takes an average of =
18 minutes to return results (against just that one server).  Once it =
even crashed, after 13 or so minutes of scanning.  I couldn't get it to =
run again after that (on my Windows laptop) until I rebooted.  Those =
results that are returned are wildly inaccurate, and are different each =
time the scan is run.  OS detection is amusing - it generally returns as =
Unknown, but sometimes picks something interesting.

While all this scanning is going on, my webserver still happily serves =
up pages to the attack box.

Clearly this is going to need more work to if I'd ever like to get it =
out of test.  If I find anything truely interesting, I'll pass it along. =
 If anyone has any comments/questions/concerns please don't hesitate to =
send them my way.

Thanks,

Bob

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of
bmcdowell@coxhealthplans.com
Sent: Tuesday, November 11, 2003 2:58 PM
To: netfilter@lists.netfilter.org
Subject: Redirect to Honeypot?



Does anyone on the list have a recomendation as to how one might use
iptables to redirect traffic to a honeypot?  I have a few ideas, but
I'd really like to hear from someone who has a solution they like (or
even an idea they like).  Thanks in advance.

To clarify just a bit:

I'd like to be able to redirect packets instead of dropping them.=20
I'd also like to be able to do this as a catch-all rule at the end of
my input and forward chains.  The overall idea is to combine randomly
dropping packets, tarpitting, and live honeypot responses (from
different OS'es) in an effort to utterly stump recon efforts.  In my
head, I have visions of Linux boxes reporting they're running IIS 5
and Crays running (x app), etc.

In my testing so far, I've found that combining randomly dropping
packets and tarpitting to be extremely effective at slowing normal
NMap scans.  In some cases, scan time was increased to well over two
hours.  Now I'd like to introduce live ports into that mix.  This
way, a positive hit on a live port would not necessarily have to be
one of my production boxes.  In fact, it probably isn't...

Thanks again,

Bob


------_=_NextPart_001_01C3AECB.8754E1B0
Content-Type: application/ms-tnef;
	name="winmail.dat"
Content-Transfer-Encoding: base64

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
ARewA/C7JsEhwHK4gBgAfDRNfZH/JJLwlZgi4bHr8SgAJJOSw/9sINcChcCuIivTvKIjdC2w/m/x
JSQSH5F8gtq6HxEsNd/qs2My1wJuY3biaaFAjcL/yGBPBLBhKyEIsa7x6sOmUv/XMQhopEGI4SGy
KBFZISzg/9jwKPF6ZNtSTwQltXCRLCR/lLN40/CkK4DcgH+DLCFi++BxKQFziRF7nR1VgvOxzwUT
CX0WQAAeADUQAQAAAD4AAAA8N0EzQjRBQTM2MEZERUY0NDhGMzM5MDQyMUZDOEQ3MzEwMTEzMUEw
RkBjb3hocGV4Zy5jb3hocC5jb20+AAAAHgBCEAEAAAA+AAAAPDdBM0I0QUEzNjBGREVGNDQ4RjMz
OTA0MjFGQzhENzMxMDExMEVCRTlAY294aHBleGcuY294aHAuY29tPgAAAAMAgBD/////HwDzEAEA
AABEAAAAUgBFACUAMwBBACAAUgBlAGQAaQByAGUAYwB0ACAAdABvACAASABvAG4AZQB5AHAAbwB0
ACUAMwBGAC4ARQBNAEwAAAALAPYQAAAAAEAABzBcf1KHy67DAUAACDCkVmqHy67DAQMA3j+vbwAA
AwDxPwkEAAAeAPg/AQAAAA0AAABCb2IgTWNEb3dlbGwAAAAAAgH5PwEAAABcAAAAAAAAANynQMjA
QhAatLkIACsv4YIBAAAAAAAAAC9PPUNIUC9PVT1GSVJTVCBBRE1JTklTVFJBVElWRSBHUk9VUC9D
Tj1SRUNJUElFTlRTL0NOPUJNQ0RPV0VMTAAeAPo/AQAAABUAAABTeXN0ZW0gQWRtaW5pc3RyYXRv
cgAAAAACAfs/AQAAAB4AAAAAAAAA3KdAyMBCEBq0uQgAKy/hggEAAAAAAAAALgAAAAMA/T/kBAAA
AwAZQAAAAAADABpAAAAAAB4AMEABAAAACgAAAEJNQ0RPV0VMTAAAAB4AMUABAAAACgAAAEJNQ0RP
V0VMTAAAAB4AOEABAAAACgAAAEJNQ0RPV0VMTAAAAB4AOUABAAAAAgAAAC4AAAADAAlZAQAAAAMA
AW4gAAAACwBVgQggBgAAAAAAwAAAAAAAAEYAAAAADoUAAAAAAAADAG2BCCAGAAAAAADAAAAAAAAA
RgAAAABShQAAc3kBAB4AboEIIAYAAAAAAMAAAAAAAABGAAAAAFSFAAABAAAABAAAADkuMAADALGB
CCAGAAAAAADAAAAAAAAARgAAAAABhQAAAAAAAAsAtoEIIAYAAAAAAMAAAAAAAABGAAAAAAOFAAAA
AAAAAwC7gQggBgAAAAAAwAAAAAAAAEYAAAAAEYUAAAAAAAADAMCBCCAGAAAAAADAAAAAAAAARgAA
AAAQhQAAAAAAAAMAx4EIIAYAAAAAAMAAAAAAAABGAAAAABiFAAAAAAAACwDbgQggBgAAAAAAwAAA
AAAAAEYAAAAABoUAAAAAAAALACkAAAAAAAsAIwAAAAAAAwAGEAOA8+kDAAcQ4AoAAAMAEBAAAAAA
AwAREAAAAAAeAAgQAQAAAGUAAABUSEFOS1NGT1JBTExUSEVPRkYtTElTVElOVEVSRVNUSUpVU1RU
SE9VR0hUSURBRERPTkVTSURFTk9URUFCT1VUTkVTU1VTSVRUT09LT1ZFUjQ4SE9VUlNUT1NDQU42
SVBTKFdJAAAAAAIBfwABAAAAPgAAADw3QTNCNEFBMzYwRkRFRjQ0OEYzMzkwNDIxRkM4RDczMTAx
MTMxQTBGQGNveGhwZXhnLmNveGhwLmNvbT4AAABHiA==

------_=_NextPart_001_01C3AECB.8754E1B0--

