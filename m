From: Alessandro Vesely <vesely@tana.it>
Subject: Re: libnetfilter_queue: mark-value byte ordering? --oops, pls discard
 previous copy
Date: Mon, 10 May 2010 12:51:05 +0200
Message-ID: <4BE7E519.7080600@tana.it>
References: <4BE5B9CA.5090606@meta-dynamic.com> <4BE6AC04.5000504@tana.it> <4BE72DD8.1000509@netfilter.org> <4BE76C66.6070701@meta-dynamic.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=_north-15191-1273488665-0001-2"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tana.it; s=test;
	t=1273488665; bh=rQ/DO/iAy4xWre14y+r4HXxnHAI6ccMA1GAOhcA3D+U=;
	l=3173;
	h=Message-ID:Date:From:Mime-Version:To:CC:References:In-Reply-To;
	b=CELJBCVPrjGExEtqd8G9QOUoPtLeBAbU9etO+aytbbeQTnGlF6Ci1s8uzvgCpQAxk
	 xy8hRZ+RUsVjEZcF/cJ0dHZYh10SfxDZ8DGtf3h4UtnrUuRfK71n7aOy9bDxjV8AGm
	 zshtgtuNEjj13PtbtCUghvSyjftkLQO4/KLGK78c=
In-Reply-To: <4BE76C66.6070701@meta-dynamic.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: David F <netfilter@meta-dynamic.com>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, netfilter <netfilter@vger.kernel.org>, Eric Leblond <eleblond@edenwall.com>

This is a MIME-formatted message.  If you see this text it means that your
E-mail software does not support MIME-formatted messages.

--=_north-15191-1273488665-0001-2
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

David F writes:
> Pablo Neira Ayuso wrote:
>>
>> I have applied the following patch. I think that, at least, new users
>> will not hit this problem again. I'm very sorry that this was not fixed
>> before. Let me know if you are OK with it, we're still in time to revert
>> the patch attached.

Waiting one version before deprecating might allow smoother changing.

> For what it's worth, I had previously prepared this patch which just
> clarifies the documentation on this parameter.  I think it still has
> value since I also added some missing return-value docs and changed the
> descriptions of a few parameters that I had found to be confusing.

Good work. Is the (current) generated doc available? I've found an 
older version in http://www.nufw.org/doc/libnetfilter_queue/

I attach a patch aimed at fixing the example, which is confusing, 
since rv can simultaneously be != 0 and >= 0 only if it is > 0. I 
haven't resisted an attempt at enumerating verdicts, though.


--=_north-15191-1273488665-0001-2
Content-Type: text/plain; name="libnetfilter_queue17.patch"; charset=iso-8859-1
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="libnetfilter_queue17.patch"

LS0tIGxpYm5ldGZpbHRlcl9xdWV1ZS0wLjAuMTcvc3JjL2xpYm5ldGZpbHRlcl9xdWV1ZS5v
cmlnaW5hbC5jCTIwMDktMDItMTcgMjA6NTU6MjMuMDAwMDAwMDAwICswMTAwCisrKyBsaWJu
ZXRmaWx0ZXJfcXVldWUtMC4wLjE3L3NyYy9saWJuZXRmaWx0ZXJfcXVldWUuYwkyMDEwLTA1
LTEwIDEyOjI1OjMzLjAwMDAwMDAwMCArMDIwMApAQCAtMjA3LDEzICsyMDcsMjIgQEAKICAq
IFx2ZXJiYXRpbQogCWZkID0gbmZxX2ZkKGgpOwogCi0Jd2hpbGUgKChydiA9IHJlY3YoZmQs
IGJ1Ziwgc2l6ZW9mKGJ1ZiksIDApKSAmJiBydiA+PSAwKSB7CisJd2hpbGUgKChydiA9IHJl
Y3YoZmQsIGJ1Ziwgc2l6ZW9mKGJ1ZiksIDApKSA+PSAwKSB7CiAJCXByaW50ZigicGt0IHJl
Y2VpdmVkXG4iKTsKIAkJbmZxX2hhbmRsZV9wYWNrZXQoaCwgYnVmLCBydik7CiAJfQogXGVu
ZHZlcmJhdGltCiAgKiBXaGVuIHRoZSBkZWNpc2lvbiBvbiBhIHBhY2tldCBoYXMgYmVlbiBj
aG9vc2VkLCB0aGUgdmVyZGljdCBoYXMgdG8gYmUgZ2l2ZW4KLSAqIGJ5IGNhbGxpbmcgbmZx
X3NldF92ZXJkaWN0KCkgb3IgbmZxX3NldF92ZXJkaWN0X21hcmsoKS4KKyAqIGJ5IGNhbGxp
bmcgbmZxX3NldF92ZXJkaWN0KCkgb3IgbmZxX3NldF92ZXJkaWN0X21hcmsoKS4gVGhlIHZl
cmRpY3QKKyAqIGRldGVybWluZXMgdGhlIGRlc3Rpbnkgb2YgdGhlIHBhY2tldCBhcyBmb2xs
b3dzOgorICoKKyAqICAgLSBORl9EUk9QIGRpc2NhcmRlZCB0aGUgcGFja2V0CisgKiAgIC0g
TkZfQUNDRVBUIHRoZSBwYWNrZXQgcGFzc2VzLCBjb250aW51ZSBpdGVyYXRpb25zCisgKiAg
IC0gTkZfU1RPTEVOIGdvbmUgYXdheQorICogICAtIE5GX1FVRVVFIGluamVjdCB0aGUgcGFj
a2V0IGludG8gYSBkaWZmZXJlbnQgcXVldWUKKyAqICAgICAodGhlIHRhcmdldCBxdWV1ZSBu
dW1iZXIgaXMgaW4gdGhlIGhpZ2ggMTYgYml0cyBvZiB0aGUgdmVyZGljdCkKKyAqICAgLSBO
Rl9SRVBFQVQgaXRlcmF0ZSB0aGUgc2FtZSBjeWNsZSBvbmNlIG1vcmUKKyAqICAgLSBORl9T
VE9QIGFjY2VwdCwgYnV0IGRvbid0IGNvbnRpbnVlIGl0ZXJhdGlvbnMKICAqCiAgKiBEYXRh
IGFuZCBpbmZvcm1hdGlvbiBhYm91dCB0aGUgcGFja2V0IGNhbiBiZSBmZXRjaCBieSB1c2lu
ZyBtZXNzYWdlIHBhcnNpbmcKICAqIGZ1bmN0aW9ucyAoU2VlIFxsaW5rIFBhcnNpbmcgXGVu
ZGxpbmspLgo=
--=_north-15191-1273488665-0001-2--
