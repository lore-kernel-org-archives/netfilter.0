From: Julien Vehent <julien@linuxwall.info>
Subject: Re: Userland Netfilter
Date: Thu, 30 Oct 2008 18:52:28 +0100
Message-ID: <166fef934704cc25bd539e4c412b36c3@localhost>
References: <4909d7a5.0fba720a.690e.70fc@mx.google.com> <1225385229.5690.33.camel@roken.inl.fr>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="=_ce43f93a674da23bdd7dafa6e459f1af"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1225385229.5690.33.camel@roken.inl.fr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Gilad Benjamini <gilad.benjamini@gmail.com>
Cc: netfilter@vger.kernel.org

--=_ce43f93a674da23bdd7dafa6e459f1af
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="UTF-8"

On Thu, 30 Oct 2008 17:47:09 +0100, Sebastien Tricaud <stricaud@inl.fr>
wrote:
> On Thu, 2008-10-30 at 08:49 -0700, Gilad Benjamini wrote:
>> I need to create a userland simulation for filtering packets.
>> I remember running into a userland netfilter, but can't seem to find it.
>> Any
>> pointers or info would be appreciated.
>> Another option is to feed the packets into tun/tap devices, and let the
>> real
>> netfilter do the job. Performance, of course, is not a concern in my
>> case.
>> Does that sound reasonable ? Tun/tap seems to be an almost dead project.
>> Will it work in newer distributions ?
>> 
> 
> Hello Gilad,
> 
> I highly recommend you to use Pierre easy bindings, so that you can
> write your simulation in either Perl or Python :
> 
> http://software.inl.fr/trac/wiki/nfqueue-bindings
> 

Hi There,

Processing packets in perl or python ? Even if performances are not an
issue, you may want to be able to do something on the packet before the
user dies, no ?... :)

Just kidding, in fact, I found the regular netfilter queue library very
easy and convenient to use in C (see the code attached). And the
performances have nothing to be ashamed of...

http://netfilter.org/projects/libnetfilter_queue/downloads.html

Regards,
Julien

> 
> Regards,
> Sebastien Tricaud.
> 
> 
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

-- 
www.linuxwall.info
--=_ce43f93a674da23bdd7dafa6e459f1af
Content-Transfer-Encoding: base64
Content-Type: text/plain;
 name="netfilter_queue.c"; 
Content-Disposition: attachment;
 filename="netfilter_queue.c"; 

LyohIG5ldGZpbHRlcl9xdWV1ZS5jCiAqCiBcYnJpZWYgdGVzdCBmaWxlCiAqCiBcY29kZSBnY2Mg
LW8gbmV0ZmlsdGVyX3F1ZXVlIG5ldGZpbHRlcl9xdWV1ZS5jIC1sbmV0ZmlsdGVyX3F1ZXVlCiAq
CiAqLwojaW5jbHVkZSA8c3RkaW8uaD4KI2luY2x1ZGUgPHN0ZGxpYi5oPgojaW5jbHVkZSA8dW5p
c3RkLmg+CiNpbmNsdWRlIDxuZXRpbmV0L2luLmg+CiNpbmNsdWRlIDxsaW51eC9uZXRmaWx0ZXIu
aD4JCS8qIGZvciBORl9BQ0NFUFQgKi8KCiNpbmNsdWRlIDxsaWJuZXRmaWx0ZXJfcXVldWUvbGli
bmV0ZmlsdGVyX3F1ZXVlLmg+CgovKiByZXR1cm5zIHBhY2tldCBpZCAqLwpzdGF0aWMgdV9pbnQz
Ml90IHByaW50X3BrdCAoc3RydWN0IG5mcV9kYXRhICp0YikKewoJaW50IGlkID0gMDsKCXN0cnVj
dCBuZnFubF9tc2dfcGFja2V0X2hkciAqcGg7Cgl1X2ludDMyX3QgbWFyayxpZmk7CglpbnQgcmV0
OwoJY2hhciAqZGF0YTsKCglwaCA9IG5mcV9nZXRfbXNnX3BhY2tldF9oZHIodGIpOwoJaWYgKHBo
KXsKCQlpZCA9IG50b2hsKHBoLT5wYWNrZXRfaWQpOwoJCXByaW50ZigiaHdfcHJvdG9jb2w9MHgl
MDR4IGhvb2s9JXUgaWQ9JXUgIiwKCQkJbnRvaHMocGgtPmh3X3Byb3RvY29sKSwgcGgtPmhvb2ss
IGlkKTsKCX0KCgltYXJrID0gbmZxX2dldF9uZm1hcmsodGIpOwoJaWYgKG1hcmspCgkJcHJpbnRm
KCJtYXJrPSV1ICIsIG1hcmspOwoKCWlmaSA9IG5mcV9nZXRfaW5kZXYodGIpOwoJaWYgKGlmaSkK
CQlwcmludGYoImluZGV2PSV1ICIsIGlmaSk7CgoJaWZpID0gbmZxX2dldF9vdXRkZXYodGIpOwoJ
aWYgKGlmaSkKCQlwcmludGYoIm91dGRldj0ldSAiLCBpZmkpOwoKCXJldCA9IG5mcV9nZXRfcGF5
bG9hZCh0YiwgJmRhdGEpOwoJaWYgKHJldCA+PSAwKQoJCXByaW50ZigicGF5bG9hZF9sZW49JWQg
IiwgcmV0KTsKCglmcHV0YygnXG4nLCBzdGRvdXQpOwoKCXJldHVybiBpZDsKfQoKCnN0YXRpYyBp
bnQgY2Ioc3RydWN0IG5mcV9xX2hhbmRsZSAqcWgsIHN0cnVjdCBuZmdlbm1zZyAqbmZtc2csCgkg
ICAgICBzdHJ1Y3QgbmZxX2RhdGEgKm5mYSwgdm9pZCAqZGF0YSkKewoJdV9pbnQzMl90IGlkID0g
cHJpbnRfcGt0KG5mYSk7CglwcmludGYoImVudGVyaW5nIGNhbGxiYWNrXG4iKTsKCXJldHVybiBu
ZnFfc2V0X3ZlcmRpY3QocWgsIGlkLCBORl9BQ0NFUFQsIDAsIE5VTEwpOwp9CgppbnQgbWFpbihp
bnQgYXJnYywgY2hhciAqKmFyZ3YpCnsKCXN0cnVjdCBuZnFfaGFuZGxlICpoOwoJc3RydWN0IG5m
cV9xX2hhbmRsZSAqcWg7CglzdHJ1Y3QgbmZubF9oYW5kbGUgKm5oOwoJaW50IGZkOwoJaW50IHJ2
OwoJY2hhciBidWZbNDA5Nl07CgoJcHJpbnRmKCJvcGVuaW5nIGxpYnJhcnkgaGFuZGxlXG4iKTsK
CWggPSBuZnFfb3BlbigpOwoJaWYgKCFoKSB7CgkJZnByaW50ZihzdGRlcnIsICJlcnJvciBkdXJp
bmcgbmZxX29wZW4oKVxuIik7CgkJZXhpdCgxKTsKCX0KCglwcmludGYoInVuYmluZGluZyBleGlz
dGluZyBuZl9xdWV1ZSBoYW5kbGVyIGZvciBBRl9JTkVUIChpZiBhbnkpXG4iKTsKCWlmIChuZnFf
dW5iaW5kX3BmKGgsIEFGX0lORVQpIDwgMCkgewoJCWZwcmludGYoc3RkZXJyLCAiZXJyb3IgZHVy
aW5nIG5mcV91bmJpbmRfcGYoKVxuIik7CgkJZXhpdCgxKTsKCX0KCglwcmludGYoImJpbmRpbmcg
bmZuZXRsaW5rX3F1ZXVlIGFzIG5mX3F1ZXVlIGhhbmRsZXIgZm9yIEFGX0lORVRcbiIpOwoJaWYg
KG5mcV9iaW5kX3BmKGgsIEFGX0lORVQpIDwgMCkgewoJCWZwcmludGYoc3RkZXJyLCAiZXJyb3Ig
ZHVyaW5nIG5mcV9iaW5kX3BmKClcbiIpOwoJCWV4aXQoMSk7Cgl9CgoJcHJpbnRmKCJiaW5kaW5n
IHRoaXMgc29ja2V0IHRvIHF1ZXVlICcwJ1xuIik7CglxaCA9IG5mcV9jcmVhdGVfcXVldWUoaCwg
IDAsICZjYiwgTlVMTCk7CglpZiAoIXFoKSB7CgkJZnByaW50ZihzdGRlcnIsICJlcnJvciBkdXJp
bmcgbmZxX2NyZWF0ZV9xdWV1ZSgpXG4iKTsKCQlleGl0KDEpOwoJfQoKCXByaW50Zigic2V0dGlu
ZyBjb3B5X3BhY2tldCBtb2RlXG4iKTsKCWlmIChuZnFfc2V0X21vZGUocWgsIE5GUU5MX0NPUFlf
UEFDS0VULCAweGZmZmYpIDwgMCkgewoJCWZwcmludGYoc3RkZXJyLCAiY2FuJ3Qgc2V0IHBhY2tl
dF9jb3B5IG1vZGVcbiIpOwoJCWV4aXQoMSk7Cgl9CgoJbmggPSBuZnFfbmZubGgoaCk7CglmZCA9
IG5mbmxfZmQobmgpOwoKCXdoaWxlICgocnYgPSByZWN2KGZkLCBidWYsIHNpemVvZihidWYpLCAw
KSkgJiYgcnYgPj0gMCkgewoJCXByaW50ZigicGt0IHJlY2VpdmVkXG4iKTsKCQluZnFfaGFuZGxl
X3BhY2tldChoLCBidWYsIHJ2KTsKCX0KCglwcmludGYoInVuYmluZGluZyBmcm9tIHF1ZXVlIDBc
biIpOwoJbmZxX2Rlc3Ryb3lfcXVldWUocWgpOwoKI2lmZGVmIElOU0FORQoJLyogbm9ybWFsbHks
IGFwcGxpY2F0aW9ucyBTSE9VTEQgTk9UIGlzc3VlIHRoaXMgY29tbWFuZCwgc2luY2UKCSAqIGl0
IGRldGFjaGVzIG90aGVyIHByb2dyYW1zL3NvY2tldHMgZnJvbSBBRl9JTkVULCB0b28gISAqLwoJ
cHJpbnRmKCJ1bmJpbmRpbmcgZnJvbSBBRl9JTkVUXG4iKTsKCW5mcV91bmJpbmRfcGYoaCwgQUZf
SU5FVCk7CiNlbmRpZgoKCXByaW50ZigiY2xvc2luZyBsaWJyYXJ5IGhhbmRsZVxuIik7CgluZnFf
Y2xvc2UoaCk7CgoJZXhpdCgwKTsKfQo=
--=_ce43f93a674da23bdd7dafa6e459f1af--

