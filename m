From: Myles Uyema <mlists@uyema.net>
Subject: Re: iptables multiple clients internal network warcraft3
Date: Sun, 11 May 2003 20:27:37 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0305112026100.8400-200000@marx.gruntwerk.net>
References: <000001c317c0$a94de540$0200a8c0@knighthawk>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="-1463805952-604524489-1052710057=:8400"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000001c317c0$a94de540$0200a8c0@knighthawk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Thomas Stian Bergheim <bjartebe@eunet.no>
Cc: netfilter@lists.netfilter.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.
  Send mail to mime@docserver.cac.washington.edu for more info.

---1463805952-604524489-1052710057=:8400
Content-Type: TEXT/PLAIN; charset=US-ASCII

Hi Thomas, please try out this script.  I've tested it so far with 
Starcraft, two computers joining the same game.  Let me know how things 
go.


On Sun, 11 May 2003, Thomas Stian Bergheim wrote:

Hi!
 
I'm playing warcraft behind a firewall (iptables) which runs on redhat8.
 
It works fine for me, but other clients on my internal network
(192.168.0.x) can't join me.
I guess this is because the packets they reply with have a different
source adress. So the solution should be fairly simple using iptables.. 
But I've tried many things, with no luck...
 
My server has two eths, one for the dsl connection, the other one for
the local network.
 
Anyone got a working setup with this or anything?
 
Thanks,
 

---1463805952-604524489-1052710057=:8400
Content-Type: TEXT/plain; name="starcraft-iptables.txt"
Content-Transfer-Encoding: BASE64
Content-ID: <Pine.LNX.4.44.0305112027370.8400@marx.gruntwerk.net>
Content-Description: starcraft IPtables script
Content-Disposition: attachment; filename="starcraft-iptables.txt"

IyEvYmluL2Jhc2gNCiMgV3JpdHRlbiBieSBNeWxlcyBVeWVtYTsga2hpc2Fu
dGggYXQgdXllbWEgZDB0IG5ldA0KIw0KIyBUaGlzIGlzIGEgc2NyaXB0IHRv
IGFsbG93IFN0YXJjcmFmdCBnYW1lcyB0byBiZSBob3N0ZWQgYmVoaW5kDQoj
IGEgTGludXggSVBUYWJsZXMgZmlyZXdhbGwuDQojIFRlc3RlZCB3aXRoIFN0
YXJjcmFmdCBhbmQgMiBtYWNoaW5lcyBiZWhpbmQgdGhlIGZpcmV3YWxsLg0K
IyBUaGlzIG1heSB3b3JrIGZvciBvdGhlciBCYXR0bGUuTmV0IFJUUyBnYW1l
cyBhcyB3ZWxsLi4uIFlNTVYNCg0KIyBNeSBJbnRlcm5ldCBJUCBhZGRyZXNz
DQpDQUJMRUlQPTEyLjkzLjMzLjU4DQoNCiMgTXkgUFJJVkFURSBMQU4gTmV0
d29yaw0KIyBUaGlzIHNjcmlwdCBhc3N1bWVzIENsYXNzIEMgbmV0d29yaw0K
UFJJVkxBTj0xOTIuMTY4LjUNCg0KIyBCYXR0bGUuTmV0IHBvcnQgdXN1YWxs
eSA2MTEyDQpCTkVUUE9SVD02MTEyDQoNCiMgRW50ZXIgdGhlIGxhc3QgZG90
dGVkIHF1YWQgSVAgYWRkcmVzcyBvZiBlYWNoIFBDDQojIFdlJ3JlIGFzc3Vt
aW5nIGFsbCB0aGUgUENzIGFyZSBpbiBhIENsYXNzIEMgcHJpdmF0ZSBMQU4N
CiMgQWxzbywgaWYgeW91IGhhdmUgbW9yZSB0aGFuIDcgUENzLCB3aHkgZG8g
eW91IHdhbnQgdG8gZ2V0IG9uIEJhdHRsZS5uZXQ/DQojIFNvIGlmIG15IElQ
IGFkZHJlc3MgaXMgMTkyLjE2OC41LjUsIFBDMT01DQpQQzE9NQ0KUEMyPTk4
DQpQQzM9DQpQQzQ9DQpQQzU9DQpQQzY9DQpQQzc9DQpQQzg9DQoNCmV4cG9y
dCBDQUJMRUlQIFBSSVZMQU4NCmV4cG9ydCBQQzEgUEMyIFBDMyBQQzQgUEM1
IFBDNiBQQzcgUEM4DQoNCmNhc2UgIiQxIiBpbg0KICAgc3RhcnQpDQogICAg
ICBpcHRhYmxlcyAtdCBuYXQgLUYgU0MtT1VUIHx8IGlwdGFibGVzIC10IG5h
dCAtTiBTQy1PVVQNCiAgICAgIGlwdGFibGVzIC10IG5hdCAtRiBTQy1JTiB8
fCBpcHRhYmxlcyAtdCBuYXQgLU4gU0MtSU4NCg0KICAgICAgaXB0YWJsZXMg
LXQgbmF0IC1JIFBPU1RST1VUSU5HIC1wIHVkcCAtcyAke1BSSVZMQU59LjAv
MjQgLS1zcG9ydCAkQk5FVFBPUlQgLWogU0MtT1VUDQoNCiAgICAgIGZvciBp
IGluICRQQzEgJFBDMiAkUEMzICRQQzQgJFBDNSAkUEM2ICRQQzcgJFBDOA0K
ICAgICAgICAgZG8NCiAgICAgICAgICAgIGlmIFsgJGkgLWd0IDAgXSA7IHRo
ZW4NCiAgICAgICAgICAgICAgIGlwdGFibGVzIC10IG5hdCAtSSBTQy1PVVQg
LXMgJHtQUklWTEFOfS4ke2l9IC1wIHVkcCAtaiBTTkFUIC0tdG8gJHtDQUJM
RUlQfTokKCg5MDAwKyRpKSkNCiAgICAgICAgICAgICAgIGlwdGFibGVzIC10
IG5hdCAtSSBQUkVST1VUSU5HIC1wIHVkcCAtLWRwb3J0ICQoKDkwMDArJGkp
KSAtaiBTQy1JTg0KCSAgICAgICBpcHRhYmxlcyAtdCBuYXQgLUkgU0MtSU4g
LWQgJHtDQUJMRUlQfSAtcCB1ZHAgLS1kcG9ydCAkKCg5MDAwKyRpKSkgLWog
RE5BVCAtLXRvICR7UFJJVkxBTn0uJHtpfToke0JORVRQT1JUfQ0KICAgICAg
ICAgICAgZmkNCgkgZG9uZQ0KICAgICAgOzsNCg0KICAgc3RvcCkNCiAgICAg
IGlwdGFibGVzIC10IG5hdCAtRiBTQy1PVVQgfHwgZXhpdCAwDQogICAgICBp
cHRhYmxlcyAtdCBuYXQgLUYgU0MtSU4gfHwgZXhpdCAwDQogICAgICBpcHRh
YmxlcyAtdCBuYXQgLUQgUE9TVFJPVVRJTkcgLXAgdWRwIC1zICR7UFJJVkxB
Tn0uMC8yNCAtLXNwb3J0ICRCTkVUUE9SVCAtaiBTQy1PVVQNCg0KICAgICAg
Zm9yIGkgaW4gJFBDMSAkUEMyICRQQzMgJFBDNCAkUEM1ICRQQzYgJFBDNyAk
UEM4DQogICAgICAgICBkbw0KICAgICAgICAgICAgaWYgWyAkaSAtZ3QgMCBd
IDsgdGhlbg0KICAgICAgICAgICAgICAgaXB0YWJsZXMgLXQgbmF0IC1EIFBS
RVJPVVRJTkcgLXAgdWRwIC0tZHBvcnQgJCgoOTAwMCskaSkpIC1qIFNDLUlO
DQogICAgICAgICAgICBmaQ0KICAgICAgICAgZG9uZQ0KICAgICAgaXB0YWJs
ZXMgLXQgbmF0IC1YIFNDLU9VVA0KICAgICAgaXB0YWJsZXMgLXQgbmF0IC1Y
IFNDLUlODQogICAgICA7Ow0KDQogICAqKQ0KICAgICAgZWNobyAiVXNhZ2U6
ICQwIHtzdGFydHxzdG9wfSINCiAgICAgIDs7DQplc2FjDQo=
---1463805952-604524489-1052710057=:8400--

