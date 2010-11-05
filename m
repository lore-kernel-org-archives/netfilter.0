From: Alessandro Vesely <vesely@tana.it>
Subject: Re: libnetfilter_queue exiting on big tcp sessions
Date: Fri, 05 Nov 2010 12:09:15 +0100
Message-ID: <4CD3E5DB.2000704@tana.it>
References: <AANLkTimmr4MVCOwgxea9KoGB1BjomBchJ7oAgpnt2WyZ@mail.gmail.com> <4CD1AB54.5080603@netfilter.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=_north-29057-1288955356-0001-2"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tana.it; s=test;
	t=1288955356; bh=RZgm5cDF7z2jRBLYdxYLVjS1ymH/bymmsDCr8Ig5Mbk=;
	l=2510;
	h=Message-ID:Date:From:Mime-Version:To:References:In-Reply-To;
	b=TTjcydkhg+eDOaySyRM9VuJR5enV39/ciFJ67MdHoE9Yu3vmGJfT0HloRlpSqQVYr
	 Xwxqe6RoHriM+ejRbK78zUHxphobBt55Dt7DDVJWB4U6XAdSA66Olt+2Pt1Ikm31w1
	 6GlcGnemvrEHfMEDkmKm1kOhJSis50hQaShhU/uM=
In-Reply-To: <4CD1AB54.5080603@netfilter.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

This is a MIME-formatted message.  If you see this text it means that your
E-mail software does not support MIME-formatted messages.

--=_north-29057-1288955356-0001-2
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

On 03/Nov/10 19:35, Pablo Neira Ayuso wrote:
> On 02/11/10 16:46, Rajkumar S wrote:
>>  I am using utils/nfqnl_test.c as my test program
>
> Please, see:
>
> http://git.netfilter.org/cgi-bin/gitweb.cgi?p=libnetfilter_queue.git;a=commitdiff;h=37791b0eb98c00098a6410f6dedfdce92fc88f3e;hp=c4692e02d4fc804f7aa31f407d7d2f31861753bc

Thanks for the improved docs!

For older kernels, would it also help setting something like
-A INPUT -m limit --limit 10/second -j NFQUEUE --queue-num 0?

Would you please also amend nfqnl_test.c?  From this thread I grasp 
that packets that overflowed the queue are still received/ 
transmitted, but am unable to do better than the attached (untested) 
patch.

--=_north-29057-1288955356-0001-2
Content-Type: text/plain; name="nfqnl_test.patch.txt"; charset=iso-8859-1
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="nfqnl_test.patch.txt"

LS0tIG5mcW5sX3Rlc3Qub3JpZ2luYWwuYwkyMDA5LTAyLTE3IDIwOjI3OjI4LjAwMDAwMDAw
MCArMDEwMAorKysgbmZxbmxfdGVzdC5jCTIwMTAtMTEtMDUgMTE6MjQ6MjYuMDAwMDAwMDAw
ICswMTAwCkBAIC04LDYgKzgsOCBAQAogCiAjaW5jbHVkZSA8bGlibmV0ZmlsdGVyX3F1ZXVl
L2xpYm5ldGZpbHRlcl9xdWV1ZS5oPgogCisjaW5jbHVkZSA8ZXJybm8uaD4KKwogLyogcmV0
dXJucyBwYWNrZXQgaWQgKi8KIHN0YXRpYyB1X2ludDMyX3QgcHJpbnRfcGt0IChzdHJ1Y3Qg
bmZxX2RhdGEgKnRiKQogewpAQCAtMTE1LDkgKzExNywyMSBAQAogCiAJZmQgPSBuZnFfZmQo
aCk7CiAKLQl3aGlsZSAoKHJ2ID0gcmVjdihmZCwgYnVmLCBzaXplb2YoYnVmKSwgMCkpICYm
IHJ2ID49IDApIHsKLQkJcHJpbnRmKCJwa3QgcmVjZWl2ZWRcbiIpOwotCQluZnFfaGFuZGxl
X3BhY2tldChoLCBidWYsIHJ2KTsKKwlmb3IgKDs7KSB7CisJCWlmICgocnYgPSByZWN2KGZk
LCBidWYsIHNpemVvZihidWYpLCAwKSkgPj0gMCkgeworCQkJcHJpbnRmKCJwa3QgcmVjZWl2
ZWRcbiIpOworCQkJbmZxX2hhbmRsZV9wYWNrZXQoaCwgYnVmLCBydik7CisJCQljb250aW51
ZTsKKwkJfQorCQkvKiBpZiB0aGUgY29tcHV0ZXIgaXMgc2xvd2VyIHRoYW4gdGhlIG5ldHdv
cmsgdGhlIGJ1ZmZlcgorCQkqIG1heSBmaWxsIHVwLiBEZXBlbmRpbmcgb24gdGhlIGFwcGxp
Y2F0aW9uLCB0aGlzIGVycm9yCisJCSogbWF5IGJlIGlnbm9yZWQgKi8JCQorCQlpZiAoZXJy
bm8gPT0gRU5PQlVGUykgeworCQkJcHJpbnRmKCJwa3QgbG9zdCEhXG4iKTsKKwkJCWNvbnRp
bnVlOworCQl9CisJCXByaW50ZigicmVjdiBmYWlsZWQ6IGVycm5vPSVkICglcylcbiIsCisJ
CQllcnJubywgc3RyZXJyb3IoZXJybm8pKTsKIAl9CiAKIAlwcmludGYoInVuYmluZGluZyBm
cm9tIHF1ZXVlIDBcbiIpOwo=
--=_north-29057-1288955356-0001-2--
