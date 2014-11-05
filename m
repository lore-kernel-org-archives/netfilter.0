From: Paul Robert Marino <prmarino1@gmail.com>
Subject: Re: Linux Firewall Active/Active
Date: Wed, 5 Nov 2014 17:43:39 -0500
Message-ID: <CAPJdpdBj2va5U_PZs_WSWe0XWX4jreSdMBEpOFO-_Fpi=EEKdA@mail.gmail.com>
References: <CADuigkVbB2nt5P6y-JCaW_bh6v_GhjL9BRBiHRyvA_yH81v4RA@mail.gmail.com>
	<CAOkSjBgMu_wdy0_oJ=yQqtYHeRz0yiTy1C-LO-qO3xiE0gPDCg@mail.gmail.com>
	<CAH_OBifYvkOK-RqS76ODT2En1r0bN99oU8cCQFJdDE7CGH67_g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=001a11c13068a0e2110507244fe2
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=9lzBBL/4YYkQ8xq/gR8Jxun88ofMTC6VUv4waHoaPpI=;
        b=eyBRiJmHqm/6YpsWt1sc3wcPu9NnJagHVhFSXzoMbaUUwraijGCBOix81/yWrY5CD6
         9R+CoeH+foa+4ObX62sPoTboyFqAR2x096oLCcpgFDp7lIkUBvONcmbjJsKHkR7yAHbZ
         4aQUtvy3KdlqyDysyoSrJhCXb/aLIo/UN8CLipl55BbfIVOdDXBDy9UvWfzPzZbaX+BQ
         4D3lM9neIxRw5v4ZK6mcRdjn6qDTkZbBsHDiENYosYErhz78yXnnlxIJHKwdsn6LHMqO
         TwRsHSeDzX+6TnTfV0Ggo28qVNhtOPNQhN/b87VPluME/8942Z/RGDYwWRsTQ3oP2fDc
         etvA==
In-Reply-To: <CAH_OBifYvkOK-RqS76ODT2En1r0bN99oU8cCQFJdDE7CGH67_g@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: shawn wilson <ag4ve.us@gmail.com>
Cc: Arturo Borrero Gonzalez <arturo.borrero.glez@gmail.com>, Ricardo Klein <klein.rfk@gmail.com>, netfilter <netfilter@vger.kernel.org>

--001a11c13068a0e2110507244fe2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

I've actually been doing this successfully with conntrakd, keepalived,
and quagga

Essentially I'm using quaga for OSPF and BGP externally with equal cost pat=
hs.

For conntrackd with FTFW and "DisableExternalCache On"

Do NOT use the howto's on the web or the examples that come with
conntrakd or keepalived for configuring keepalived they are outdated
and can cause major problems.
right now the only reliable documentation on keepalived is here
https://github.com/acassen/keepalived/blob/master/doc/keepalived.conf.SYNOP=
SIS
ignore any other docs you find on the web
Set both the instances in keepalived to "state BACKUP" and allow the
priority numbers to do ellections.

I do all of my VRRP heartbeats and syncing over dedicated bonded
interfaces. Short cables are better but a pair of fiber dedicated
cables to different rack rooms is acceptable. make sure you configure
keepalived not to monitor the croosover link or keepalived will thing
there is a FAULT when its peer is offline for say a reboot.

do not make the typical mistake of creating a new VRRP instance for
every vlan and connecting them in a sync group. that configuration can
have strange side effects. instead use one instance and specifiy the
the device the IP applies too under the hood keepalived is using
iproute2 and you can use its full add syntax. just truncate the "ip
addr add" portion of the command.

Also attached are two file which is a modified version oth the script
packaged in the examples which has been modified to work with
contrackd with "DisableExternalCache On" and a nice little upstream
router check script you can use in keepalived that uses fping.

I am planning to write a full howto on this in the near future as part
of HadrianWall project on git hub



On Wed, Nov 5, 2014 at 4:45 PM, shawn wilson <ag4ve.us@gmail.com> wrote:
> So I was thinking to use tc on the second box to delay the second
> packet and it should be dropped by the destination (really bad way to
> do it) but a quick google gives this:
> http://parkersamp.com/2010/03/howto-using-linux-as-a-simple-load-balancer=
-nat-router-firewall/#more-123
>
> That said, idk you can actually do what you want within linux (I'm
> pretty sure firewall vendors that support this either do it very badly
> or have custom code)
>
> On Wed, Nov 5, 2014 at 3:40 PM, Arturo Borrero Gonzalez
> <arturo.borrero.glez@gmail.com> wrote:
>> On 5 November 2014 20:15, Ricardo Klein <klein.rfk@gmail.com> wrote:
>>> Hi there,
>>>
>>> I need to build a scenario with 2 linux servers (probably CentOS7)
>>> acting as active/active firewall servers. What tools should I use?
>>> I saw some articles with:
>>>  - conntrackd + keepalived
>>>  - conntrackd + corosync + pacemaker
>>>
>>> But, what is the most used/stable?
>>>
>>
>> I would recommend Debian, corosync + pacemaker.
>>
>> I guess an active-passive cluster will do the job.
>>
>> Setting up an active-active firewall cluster is very difficult and
>> presents some challenges hard to face (like proper statefull filtering
>> in two nodes simultaneously, and a consistent ruleset management
>> between nodes of the cluster).
>>
>> --
>> Arturo Borrero Gonz=C3=A1lez
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--001a11c13068a0e2110507244fe2
Content-Type: application/x-sh; name="keepalived-conntrack-manager.sh"
Content-Disposition: attachment; filename="keepalived-conntrack-manager.sh"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_i2596clf0

IyEvYmluL3NoDQojIA0KIyAoQykgMjAwOCBieSBQYWJsbyBOZWlyYSBBeXVzbyA8cGFibG9AbmV0
ZmlsdGVyLm9yZz4NCiMNCiMgVGhpcyBzb2Z0d2FyZSBtYXkgYmUgdXNlZCBhbmQgZGlzdHJpYnV0
ZWQgYWNjb3JkaW5nIHRvIHRoZSB0ZXJtcw0KIyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExp
Y2Vuc2UsIGluY29ycG9yYXRlZCBoZXJlaW4gYnkgcmVmZXJlbmNlLg0KIw0KIyBEZXNjcmlwdGlv
bjoNCiMNCiMgVGhpcyBpcyB0aGUgc2NyaXB0IGZvciBwcmltYXJ5LWJhY2t1cCBzZXR1cHMgZm9y
IGtlZXBhbGl2ZWQNCiMgKGh0dHA6Ly93d3cua2VlcGFsaXZlZC5vcmcpLiBZb3UgbWF5IGFkYXB0
IGl0IHRvIG1ha2UgaXQgd29yayB3aXRoIG90aGVyDQojIGhpZ2gtYXZhaWxhYmlsaXR5IG1hbmFn
ZXJzLg0KIw0KIyBEbyBub3QgZm9yZ2V0IHRvIGluY2x1ZGUgdGhlIHJlcXVpcmVkIG1vZGlmaWNh
dGlvbnMgdG8geW91ciBrZWVwYWxpdmVkLmNvbmYNCiMgZmlsZSB0byBpbnZva2UgdGhpcyBzY3Jp
cHQgZHVyaW5nIGtlZXBhbGl2ZWQncyBzdGF0ZSB0cmFuc2l0aW9ucy4NCiMNCiMgQ29udHJpYnV0
aW9ucyB0byBpbXByb3ZlIHRoaXMgc2NyaXB0IGFyZSB3ZWxjb21lIDopLg0KIw0KDQpDT05OVFJB
Q0tEX0JJTj0nL3Vzci9zYmluL2Nvbm50cmFja2QnDQpDT05OVFJBQ0tEX0xPQ0s9Jy92YXIvbG9j
ay9jb25udHJhY2subG9jaycNCkNPTk5UUkFDS0RfQ09ORklHPScvZXRjL2Nvbm50cmFja2QvY29u
bnRyYWNrZC5jb25mJw0KQ09OTlRSQUNLRF9JTklUPScvZXRjL2luaXQuZC9jb25udHJhY2tkJw0K
U0NSSVBUTkFNRT0kKC9iaW4vYmFzZW5hbWUgJDApDQpMT0dHRVJfQklOPSIvYmluL2xvZ2dlciAt
dCAkU0NSSVBUTkFNRSAiDQpTTEVFUF9CSU49Jy9iaW4vc2xlZXAnDQpSTV9CSU49Jy9iaW4vcm0n
DQoNCmNhc2UgIiQxIiBpbg0KICBwcmltYXJ5KQ0KICAgICMNCiAgICAjIGlzIGNvbm50cmFja2Qg
cnVubmluZz8gcmVxdWVzdCBzb21lIHN0YXRpc3RpY3MgdG8gY2hlY2sgaXQNCiAgICAjDQogICAg
JENPTk5UUkFDS0RfQklOIC1DICRDT05OVFJBQ0tEX0NPTkZJRyAtcw0KICAgIGlmIFsgJD8gLWVx
IDEgXQ0KICAgIHRoZW4NCiAgICAgICAgIw0KICAgICAgICAjIHNvbWV0aGluZydzIHdyb25nLCBk
byB3ZSBoYXZlIGEgbG9jayBmaWxlPw0KICAgICAgICAjDQogICAgICAgIGlmIFsgLWYgJENPTk5U
UkFDS0RfTE9DSyBdDQogICAgICAgIHRoZW4NCiAgICAgICAgICAgICRMT0dHRVJfQklOICJXQVJO
SU5HOiBjb25udHJhY2tkIHdhcyBub3QgY2xlYW5seSBzdG9wcGVkLiINCiAgICAgICAgICAgICRM
T0dHRVJfQklOICJJZiB5b3Ugc3VzcGVjdCB0aGF0IGl0IGhhcyBjcmFzaGVkOiINCiAgICAgICAg
ICAgICRMT0dHRVJfQklOICIxKSBFbmFibGUgY29yZWR1bXBzIg0KICAgICAgICAgICAgJExPR0dF
Ul9CSU4gIjIpIFRyeSB0byByZXByb2R1Y2UgdGhlIHByb2JsZW0iDQogICAgICAgICAgICAkTE9H
R0VSX0JJTiAiMykgUG9zdCB0aGUgY29yZWR1bXAgdG8gbmV0ZmlsdGVyLWRldmVsQHZnZXIua2Vy
bmVsLm9yZyINCiAgICAgICAgICAgICRSTV9CSU4gLWYgJENPTk5UUkFDS0RfTE9DSw0KICAgICAg
ICBmaQ0KCSRMT0dHRVJfQklOICJhdGVtcHRpbmcgdG8gc3RhcnRpbmcgY29ubnRyYWNrZCINCiAg
ICAgICAgJENPTk5UUkFDS0RfSU5JVCBzdGFydA0KCSRTTEVFUF9CSU4gMQ0KCSRDT05OVFJBQ0tE
X0JJTiAtQyAkQ09OTlRSQUNLRF9DT05GSUcgLXMNCiAgICAgICAgaWYgWyAkPyAtZXEgMSBdDQog
ICAgICAgIHRoZW4NCiAgICAgICAgICAgICRMT0dHRVJfQklOICJFUlJPUjogY2Fubm90IGxhdW5j
aCBjb25udHJhY2tkIg0KICAgICAgICAgICAgZXhpdCAxDQogICAgICAgIGZpDQogICAgZmkNCiAg
ICA7Ow0KICBiYWNrdXApDQogICAgIw0KICAgICMgaXMgY29ubnRyYWNrZCBydW5uaW5nPyByZXF1
ZXN0IHNvbWUgc3RhdGlzdGljcyB0byBjaGVjayBpdA0KICAgICMNCiAgICAkQ09OTlRSQUNLRF9C
SU4gLUMgJENPTk5UUkFDS0RfQ09ORklHIC1zDQogICAgaWYgWyAkPyAtZXEgMSBdDQogICAgdGhl
bg0KICAgICAgICAjDQoJIyBzb21ldGhpbmcncyB3cm9uZywgZG8gd2UgaGF2ZSBhIGxvY2sgZmls
ZT8NCgkjDQogICAgCWlmIFsgLWYgJENPTk5UUkFDS0RfTE9DSyBdDQoJdGhlbg0KCSAgICAkTE9H
R0VSX0JJTiAiV0FSTklORzogY29ubnRyYWNrZCB3YXMgbm90IGNsZWFubHkgc3RvcHBlZC4iDQoJ
ICAgICRMT0dHRVJfQklOICJJZiB5b3Ugc3VzcGVjdCB0aGF0IGl0IGhhcyBjcmFzaGVkOiINCgkg
ICAgJExPR0dFUl9CSU4gIjEpIEVuYWJsZSBjb3JlZHVtcHMiDQoJICAgICRMT0dHRVJfQklOICIy
KSBUcnkgdG8gcmVwcm9kdWNlIHRoZSBwcm9ibGVtIg0KCSAgICAkTE9HR0VSX0JJTiAiMykgUG9z
dCB0aGUgY29yZWR1bXAgdG8gbmV0ZmlsdGVyLWRldmVsQHZnZXIua2VybmVsLm9yZyINCgkgICAg
JFJNX0JJTiAtZiAkQ09OTlRSQUNLRF9MT0NLDQoJZmkNCgkkQ09OTlRSQUNLRF9JTklUIHN0YXJ0
DQoJJFNMRUVQX0JJTiAxDQoJJENPTk5UUkFDS0RfQklOIC1DICRDT05OVFJBQ0tEX0NPTkZJRyAt
cw0KCWlmIFsgJD8gLWVxIDEgXQ0KCXRoZW4NCgkgICAgJExPR0dFUl9CSU4gIkVSUk9SOiBjYW5u
b3QgbGF1bmNoIGNvbm50cmFja2QiDQoJICAgIGV4aXQgMQ0KCWZpDQogICAgZmkNCiAgICAjDQog
ICAgIyBzaG9ydGVuIGtlcm5lbCBjb25udHJhY2sgdGltZXJzIHRvIHJlbW92ZSB0aGUgem9tYmll
IGVudHJpZXMuDQogICAgIw0KICAgICMkQ09OTlRSQUNLRF9CSU4gLUMgJENPTk5UUkFDS0RfQ09O
RklHIC10DQogICAgI2lmIFsgJD8gLWVxIDEgXQ0KICAgICN0aGVuDQogICAgIwlsb2dnZXIgIkVS
Uk9SOiBmYWlsZWQgdG8gaW52b2tlIGNvbm50cmFja2QgLXQiDQogICAgI2ZpDQoNCiAgICAjDQog
ICAgIyByZXF1ZXN0IHJlc3luY2hyb25pemF0aW9uIHdpdGggbWFzdGVyIGZpcmV3YWxsIHJlcGxp
Y2EgKGlmIGFueSkNCiAgICAjIE5vdGU6IHRoaXMgZG9lcyBub3RoaW5nIGluIHRoZSBhbGFybSBh
cHByb2FjaC4NCiAgICAjDQogICAgJENPTk5UUkFDS0RfQklOIC1DICRDT05OVFJBQ0tEX0NPTkZJ
RyAtbg0KICAgIGlmIFsgJD8gLWVxIDEgXQ0KICAgIHRoZW4NCiAgICAJJExPR0dFUl9CSU4gIkVS
Uk9SOiBmYWlsZWQgdG8gaW52b2tlIGNvbm50cmFja2QgLW4iDQogICAgZmkNCiAgICA7Ow0KICBm
YXVsdCkNCiAgICAjDQogICAgIyBzaG9ydGVuIGtlcm5lbCBjb25udHJhY2sgdGltZXJzIHRvIHJl
bW92ZSB0aGUgem9tYmllIGVudHJpZXMuDQogICAgIw0KICAgICMkQ09OTlRSQUNLRF9CSU4gLUMg
JENPTk5UUkFDS0RfQ09ORklHIC10DQogICAgI2lmIFsgJD8gLWVxIDEgXQ0KICAgICN0aGVuDQog
ICAgIwlsb2dnZXIgIkVSUk9SOiBmYWlsZWQgdG8gaW52b2tlIGNvbm50cmFja2QgLXQiDQogICAg
I2ZpDQogICAgOzsNCiAgKikNCiAgICAkTE9HR0VSX0JJTiAiRVJST1I6IHVua25vd24gc3RhdGUg
dHJhbnNpdGlvbiB0byBcIiQxXCIiDQogICAgZWNobyAiVXNhZ2U6ICRTQ1JJUFROQU1FIHtwcmlt
YXJ5fGJhY2t1cHxmYXVsdH0iDQogICAgZXhpdCAxDQogICAgOzsNCmVzYWMNCg0KZXhpdCAwDQo=
--001a11c13068a0e2110507244fe2
Content-Type: application/x-sh; name="fpingvrrpcheck.sh"
Content-Disposition: attachment; filename="fpingvrrpcheck.sh"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_i2598u0y1

IyEvYmluL2Jhc2gNCk9VVFBVVD1gL3Vzci9zYmluL2ZwaW5nIC11IC1CIDEuMCAkKmANClJFU1VM
VD0kPw0KaWYgWyAkUkVTVUxUID0gMCBdDQp0aGVuIA0KCWV4aXQgMA0KZWxzZQ0KCS9iaW4vZWNo
byAkT1VUUFVUIHwvYmluL2F3ayAne3ByaW50ICJmcGluZyBWUlJQIGNoZWNrIG9mIHRoZSBnYXRl
d2F5IGZhaWxlZCBvbiAiICQxfScgfC91c3IvYmluL2xvZ2dlciAtdCBWUlJQX1BJTkcNCglleGl0
IDENCmZpDQo=
--001a11c13068a0e2110507244fe2--
