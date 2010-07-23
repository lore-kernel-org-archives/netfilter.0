From: Padmalochan Moharana <padman.m@gmail.com>
Subject: Re: Regarding write send a packet to network that received in 
	NF_IP_PRE_ROUTING
Date: Fri, 23 Jul 2010 12:59:45 +0530
Message-ID: <AANLkTinw-mq4AKrqIqMzEitD0xUJkTxiT93Uey5TDK2r@mail.gmail.com>
References: <AANLkTilFBhfh-jBBaO4eJAzDw0gU_PhBEcEc1mdsUjjo@mail.gmail.com>
	<alpine.LSU.2.01.1007230923580.10737@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=001636d34573c10fe0048c08fff8
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type;
        bh=cADkj6j7HqiDsAc2uy7kBefcXJEtbE58Ql5sVZCFi/I=;
        b=XQ6hlrbidh8+i7KRq4stdMkXBwr66qSu0LEWVnKO3XyaN2jKyEBc41GQk7EPK2R3u2
         RdxhjPYl81NKfW1DY9cehLwlDH9mZyLnHgjaaVWSvVUO8kGZrsgpoMz2ziNvaLW6Btep
         Z/o/u9PHMw2Jvdm9EXcVgc6LdPt47sGb2TUak=
In-Reply-To: <alpine.LSU.2.01.1007230923580.10737@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

--001636d34573c10fe0048c08fff8
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,

Please get the source code for the issue. i have tried to update the
IP header of the received packet. So system should route that packet
to network. But system does not forward packet to network. is this
they way to forward a packet to network by updating the IP header. or
we need to update other parameter of the skbuff.

Thanks,
Padmalochan

On Fri, Jul 23, 2010 at 12:54 PM, Jan Engelhardt <jengelh@medozas.de> wrote=
:
>
> On Tuesday 2010-07-20 12:49, Padmalochan Moharana wrote:
>>i am facing problem during sending a packet that received in
>>NF_IP_PRE_ROUTNG hook to network again =A0.
>>After receive a packet i have update the source and destination IP.
>>then i have recalculate the checksum for IP and UDP layer. then i have
>>to send that packet to network by using below command.
>>
>> =A0 =A0 =A0 NF_HOOK(PF_INET, NF_IP_LOCAL_OUT, skb, NULL, skb->dev, dst_o=
utput);
>> =A0 =A0 =A0 ret =3D NF_STOLEN;
>> =A0 =A0 =A0 return ret;
>>
>>But after loading my module kernel hang when it receive any data from pee=
r.
>
> Without the code, nobody can tell.
>

--001636d34573c10fe0048c08fff8
Content-Type: application/octet-stream; name="forward.c"
Content-Disposition: attachment; filename="forward.c"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_gbypnqzl0

aW50IGZvcndhcmRfcGt0X3R4KHZvaWQgKnBrdCx1bnNpZ25lZCBpbnQgc3JjSVAsdW5zaWduZWQg
aW50IGRzdElQLGRzdF90ZWlkKQ0Kew0KDQojaWZkZWYgX19LRVJORUxfXw0KDQoNCglpbnQgcmV0
ID0gTkZfQUNDRVBUOw0KCXN0cnVjdCBza19idWZmICpza2I7DQoNCglzdHJ1Y3QgaXBoZHIgKmd0
cF9pcGg7DQoJc3RydWN0IHVkcGhkciAqZ3RwX3VkcGg7DQoJc3RydWN0IHVkcF9zdWRvX2hkciBz
dWRvOw0KCS8vDQoJdW5zaWduZWQgY2hhciAqZ3RwX2J1ZmYgPSAweDA7DQoJdW5zaWduZWQgaW50
IGd0cF9sZW5fdmFsdWUgPSAwOw0KDQoJc3RydWN0IHJ0YWJsZSAqcnQgPSBOVUxMOw0KCXN0cnVj
dCBuZXRfZGV2aWNlICpkZXY7DQoJaW50IGVyciA9IDAsIG1hZ2ljX251bSA9IDk5OTsNCgkNCglz
a2IgPSAoc3RydWN0IHNrX2J1ZmYgKikgcGt0Ow0KCQ0KCWR1bXAoc2tiLT5kYXRhLHNrYi0+bGVu
KTsNCgkNCglndHBfaXBoID0gKHN0cnVjdCBpcGhkciAqKSBza2ItPmRhdGE7DQoJZ3RwX3VkcGgg
PSAoc3RydWN0IHVkcGhkciAqKSAoc2tiLT5kYXRhICsgc2l6ZW9mKHN0cnVjdCBpcGhkcikpOw0K
CWd0cF9idWZmID0gc2tiLT5kYXRhICsgc2l6ZW9mKHN0cnVjdCBpcGhkcikgKyBVRFBfSERSX0xF
TjsNCgltZW1jcHkoJmd0cF9sZW5fdmFsdWUsICZndHBfYnVmZlsyXSwgMik7DQoNCg0KCS8vY2Fs
Y3VsYXRlIEdUUCBoZWFkZXIgbGVuZ3RoLg0KCWd0cF9oZHJfbGVuID0gbnRvaHMoZ3RwX2xlbl92
YWx1ZSkrIDg7DQoJLy91cGRhdGUgZGVzdCBURUlEDQoJaW50IGRzdF90ZWlkID0gaHRvbmwoZ3Rw
X3R1bi0+ZHN0X3RlaWQpOw0KCW1lbWNweSgmZ3RwX2J1ZmZbNF0sICZkc3RfdGVpZCwgNCk7DQoN
CgkNCgkvL1VwZGF0ZSB0aGUgc3JjIGlwIGFuZCBkc3QgaXANCglzdWRvLnNyY19pcCA9IG5oX2h0
b25sKG5vZGUtPnNyY19pcCk7DQoJc3Vkby5kc3RfaXAgPSBuaF9odG9ubChub2RlLT5kc3RfaXAp
Ow0KCXN1ZG8ucHJvdG9jb2wgPSBodG9ucygxNyk7IC8vZm9yIHVkcA0KCXN1ZG8ubGVuZ3RoID0g
Z3RwX3VkcGgtPmxlbjsNCg0KCXNrYi0+bmguaXBoLT5zYWRkciA9IG5oX2h0b25sKHNyY0lQKTsN
Cglza2ItPm5oLmlwaC0+ZGFkZHIgPSBuaF9odG9ubChkc3RJUCk7IA0KDQoNCg0KCWd0cF9pcGgt
PmNoZWNrID0gMHgwOw0KCWd0cF9pcGgtPmNoZWNrID0gaXBfY2tzdW0oSVBfVjRfSERSX0xFTiwg
KHVuc2lnbmVkIHNob3J0ICopZ3RwX2lwaCk7DQoNCg0KCS8vZ3RwX3VkcGgtPmNoZWNrID0gMHgw
Ow0KCW1lbWNweSgmZ3RwX3VkcGhbNl0sIDAsIDIpOw0KCWd0cF91ZHBoLT5jaGVjayA9IChpbl8x
NmJpdF9ja3N1bSgoY2hhciAqKSAmc3VkbywgKGNoYXIgKikgZ3RwX3VkcGgsIChjaGFyICopIGd0
cF9idWZmLCBzaXplb2Yoc3RydWN0IHVkcF9zdWRvX2hkciksIFVEUF9IRFJfTEVOLCBndHBfaGRy
X2xlbikpOw0KCQ0KCQ0KCWRldiA9IGlwX2Rldl9maW5kKG5oX2h0b25sKHNyY0lQKSk7DQoJaWYg
KCFkZXYpDQoJew0KCQlwcmludGsoIkNhbid0IGdldCB0aGUgZGV2aWNlICEhIVxuIik7DQoJCXJl
dHVybiBORl9EUk9QOw0KCX0NCgkNCglzdHJ1Y3QgZmxvd2kgZmwgPSAJeyAvLy5vaWYgPSBkZXYt
PmlmaW5kZXgsDQoJCQkJCQkgIC5ubF91ID0geyAuaXA0X3UgPSB7IC5kYWRkciA9IG5oX2h0b25s
KGRzdElQKSwNCgkJCQkJCQkJICAuc2FkZHIgPSBuaF9odG9ubChzcmNJUCksDQoJCQkJCQkJCSAg
LnRvcyA9IDANCgkJCQkJCQkJfQ0KCQkJCQkJCX0NCgkJCQkJCX07DQoJZXJyID0gaXBfcm91dGVf
b3V0cHV0X2tleSgmcnQsICZmbCk7DQoNCglpZiAoZXJyKQ0KCXsNCgkJcHJpbnRrKCJFcnJvciBp
biBpcF9yb3V0ZV9vdXRwdXRfa2V5ICEhIVxuIik7DQoJCXJldHVybiBORl9EUk9QOw0KCX0NCglz
a2ItPnBrdF90eXBlID0gUEFDS0VUX09VVEdPSU5HOw0KCXNrYi0+ZGV2ID0gZGV2Ow0KCXNrYi0+
ZHN0ID0gJnJ0LT51LmRzdDsNCg0KCWR1bXAoc2tiLT5kYXRhLHNrYi0+bGVuKTsNCgkvL21hcmsg
dGhlIHNrYiBub3QgdG8gYmUgbW9kaWZpZWQNCgltZW1jcHkoJihza2ItPmNiKSwgJm1hZ2ljX251
bSwgNCk7DQogCS8vTkZfSE9PSyhQRl9JTkVULCBORl9JUF9MT0NBTF9PVVQsIHNrYiwgTlVMTCwg
ZGV2LCBkc3Rfb3V0cHV0KTsNCgkvL3JldHVybiBORl9TVE9MRU47DQoJcmV0dXJuIHJldDsNCg0K
I2VuZGlmDQoNCn0=
--001636d34573c10fe0048c08fff8--
