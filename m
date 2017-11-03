From: Arturo Borrero Gonzalez <arturo@netfilter.org>
Subject: Re: Traffic shaping with nftables maps and tc
Date: Fri, 3 Nov 2017 17:01:26 +0100
Message-ID: <CAOkSjBjC9WBUvn0GFHfneJJmA9-03gH3ZjBj590WuUOLrzCiRg@mail.gmail.com>
References: <62018f4d1c124ef84a7bd2281b1b2dcc@spoje.net> <392d67152072ea965fd56fbe6efefab7@spoje.net>
 <CAOkSjBh8H2tn6noj9BrbGcwdk4nnjZxm-4TiTVyhm+jciSYCew@mail.gmail.com> <79baac2c7d201c134a2852cca86b5bce@spoje.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="94eb2c0a22fcd11d1d055d16384b"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <79baac2c7d201c134a2852cca86b5bce@spoje.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Tomas Mudrunka <mudrunka@spoje.net>
Cc: Netfilter Users Mailing list <netfilter@vger.kernel.org>

--94eb2c0a22fcd11d1d055d16384b
Content-Type: text/plain; charset="UTF-8"

On 3 November 2017 at 13:37, Tomas Mudrunka <mudrunka@spoje.net> wrote:
>> Try this:
>> meta priority set ip daddr map { 1.1.1.2 : 2:2222, 1.1.1.3 : 3:3333 }
>
>
> Thank you, that looks promising. However is there way to name this map, so i
> can dynamicaly edit it? I've checked nft describe:

It seems there is some issue with the parser.

Could you please test the attached patch? It is quick and dirty, not
even compiled tested.
Hope there aren't shift/reduce errors from bison.

--94eb2c0a22fcd11d1d055d16384b
Content-Type: text/x-patch; charset="US-ASCII"; name="x.patch"
Content-Disposition: attachment; filename="x.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_j9k37qyi0

cGFyc2VyOiBhbGxvdyBjbGFzc2lkIGFzIHNldCBrZXkKCkZyb206IEFydHVybyBCb3JyZXJvIEdv
bnphbGV6IDxhcnR1cm9AbmV0ZmlsdGVyLm9yZz4KCkFsbG93IFRDIGNsYXNzaWQgYXMgc2V0IGtl
eS4KClNpZ25lZC1vZmYtYnk6IEFydHVybyBCb3JyZXJvIEdvbnphbGV6IDxhcnR1cm9AbmV0Zmls
dGVyLm9yZz4KLS0tCiBzcmMvcGFyc2VyX2Jpc29uLnkgfCAgICAxICsKIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL3NyYy9wYXJzZXJfYmlzb24ueSBiL3NyYy9w
YXJzZXJfYmlzb24ueQppbmRleCA3MDE2ZjViLi4yOTE4ODc1IDEwMDY0NAotLS0gYS9zcmMvcGFy
c2VyX2Jpc29uLnkKKysrIGIvc3JjL3BhcnNlcl9iaXNvbi55CkBAIC0xNTQ1LDYgKzE1NDUsNyBA
QCB0eXBlX2lkZW50aWZpZXIJCToJU1RSSU5HCXsgJCQgPSAkMTsgfQogCQkJfAlNQVJLCXsgJCQg
PSB4c3RyZHVwKCJtYXJrIik7IH0KIAkJCXwJRFNDUAl7ICQkID0geHN0cmR1cCgiZHNjcCIpOyB9
CiAJCQl8CUVDTgl7ICQkID0geHN0cmR1cCgiZWNuIik7IH0KKwkJCXwJQ0xBU1NJRCB7ICQkID0g
eHN0cmR1cCgiY2xhc3NpZCIpOyB9CiAJCQk7CiAKIGhvb2tfc3BlYwkJOglUWVBFCQlTVFJJTkcJ
CUhPT0sJCVNUUklORwkJZGV2X3NwZWMJUFJJT1JJVFkJcHJpb19zcGVjCg==
--94eb2c0a22fcd11d1d055d16384b--
