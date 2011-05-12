From: Alessandro Vesely <vesely@tana.it>
Subject: Re: NFQUEUE the plot is growing...
Date: Thu, 12 May 2011 20:03:25 +0200
Message-ID: <4DCC20ED.4080203@tana.it>
References: <1304489658.32272.19.camel@compot-mob>	 <4DC19739.2040008@tana.it> <1304533951.25221.8.camel@hakkenden>	 <4DC26A0A.8050402@tana.it> <1304587479.6402.3.camel@compot-mob>	 <4DCAC715.3090206@tana.it> <1305193207.9902.8.camel@compot-mob>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=_north-26894-1305223406-0001-2"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tana.it; s=test;
	t=1305223406; bh=5kEi+vjoPtEo0OpL9cGAf3z2XeB9WGFI4QhrXoJQqP8=;
	l=7040;
	h=Message-ID:Date:From:Mime-Version:To:CC:References:In-Reply-To;
	b=XocKOUM+AVFsPJLWBWRReBBaDzAoi67UKpVBpnlzE0BvcPHXGtIc7S8DhzAkQ2DVp
	 71sS4pPEIkuGucqgKlJRhpKYr/QcYcmi0knYCQqkEo6fcnEP2GtkDiP6V5ffAa2Iec
	 t/fPOfuodoZaHG88F34tW9YU9Th4DU1R79t9kx7k=
In-Reply-To: <1305193207.9902.8.camel@compot-mob>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: nowhere <nowhere@hakkenden.ath.cx>
Cc: netfilter@vger.kernel.org

This is a MIME-formatted message.  If you see this text it means that your
E-mail software does not support MIME-formatted messages.

--=_north-26894-1305223406-0001-2
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On 12/May/11 11:40, nowhere wrote:
>> It seems enough to avoid delaying the call to nfq_set_verdict for the
>> first packet of a burst.  For a shot in the dark, packets seem to get
>> lost if they arrive between the first one and the corresponding call
>> to nfq_set_verdict.  Indeed, setting a fixed real_delay of 0.2, with
>> ping -i 0.2 it looses no packets, with ping -i 0.19 it looses just the
>> second one, with ping -i 0.09 icmp_reqs #2 and #3.
>> 
>> No error is returned, whether NETLINK_NO_ENOBUFS is set or not.
> 
> Well, seems like this is the case. If nfqueue becomes empty, first
> enqueued packet must not be delayed.

I retract, possibly I've been too hasty blaming nfnetlink queue.  I
made a simple variation of nfqnl_test.c --which I attach.  It just
accepts the previous packet id.  The "last" packet is obviously always
lost.  Because of this bug(?), I also loose the second packet of a
sequence of pings, no matter the speed.

However, if I "ping -c 1" using two terminal windows, I correctly
receive all odd ids in one window and even ones in the other (except
last pkt).  In this case, I delay every packet.  Also, if I run a
sequence from a window, and, immediately after it starts, run a single
ping using the other window, then both the single ping and the
sequence (except last pkt) go correctly through.

I don't understand how come the kernel+filter system can distinguish
between a second packet coming as part of a sequence and a second
packet coming asynchronously, given that packets are not inspected.
Nice puzzle, isn't it?


NB, I used iptables -t mangle -A POSTROUTING -p icmp -d 172.25.197.158
-j NFQUEUE --queue-num 13, as in
http://www.spinics.net/lists/netfilter/msg50829.html

--=_north-26894-1305223406-0001-2
Content-Type: text/plain; name="main2.c"; charset=iso-8859-1
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="main2.c"

LyoKCiQgcGluZyAtYyA4IDE3Mi4yNS4xOTcuMTU4ClBJTkcgMTcyLjI1LjE5Ny4xNTggKDE3
Mi4yNS4xOTcuMTU4KSA1Nig4NCkgYnl0ZXMgb2YgZGF0YS4KNjQgYnl0ZXMgZnJvbSAxNzIu
MjUuMTk3LjE1ODogaWNtcF9yZXE9MSB0dGw9MTI4IHRpbWU9MTAxMCBtcwo2NCBieXRlcyBm
cm9tIDE3Mi4yNS4xOTcuMTU4OiBpY21wX3JlcT0zIHR0bD0xMjggdGltZT0xMDAwIG1zCjY0
IGJ5dGVzIGZyb20gMTcyLjI1LjE5Ny4xNTg6IGljbXBfcmVxPTQgdHRsPTEyOCB0aW1lPTEw
MDAgbXMKNjQgYnl0ZXMgZnJvbSAxNzIuMjUuMTk3LjE1ODogaWNtcF9yZXE9NSB0dGw9MTI4
IHRpbWU9OTk5IG1zCjY0IGJ5dGVzIGZyb20gMTcyLjI1LjE5Ny4xNTg6IGljbXBfcmVxPTYg
dHRsPTEyOCB0aW1lPTEwMDAgbXMKNjQgYnl0ZXMgZnJvbSAxNzIuMjUuMTk3LjE1ODogaWNt
cF9yZXE9NyB0dGw9MTI4IHRpbWU9MTAxMCBtcwoKLS0tIDE3Mi4yNS4xOTcuMTU4IHBpbmcg
c3RhdGlzdGljcyAtLS0KOCBwYWNrZXRzIHRyYW5zbWl0dGVkLCA2IHJlY2VpdmVkLCAyNSUg
cGFja2V0IGxvc3MsIHRpbWUgNzAyMG1zCnJ0dCBtaW4vYXZnL21heC9tZGV2ID0gOTk5LjQ1
Mi8xMDAzLjU3NC8xMDEwLjYzMy80Ljg4MyBtcywgcGlwZSAyCgoKIyBncmVwIC1FIF4gKjEz
IC9wcm9jL25ldC9uZXRmaWx0ZXIvbmZuZXRsaW5rX3F1ZXVlCiAgIDEzICAxMzU4NCAgICAg
MSAxICAgICAwICAgICAwICAgICAwICAgICAgICA4ICAxCgogICBecXVldWVfbnVtLAogICAg
ICAgXnBlZXJfcGlkLAogICAgICAgICAgICAgICAgIF5xdWV1ZV90b3RhbCwKICAgICAgICAg
ICAgICAgICAgIF5jb3B5X21vZGUsCiAgICAgICAgICAgICAgICAgICAgICAgICAgXmNvcHlf
cmFuZ2UsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBecXVldWVfZHJvcHBlZCwK
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBecXVldWVfdXNlcl9kcm9w
cGVkLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXmlk
X3NlcXVlbmNlLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIF4xCiovCgoKCiNpbmNsdWRlIDxzdGRpby5oPgojaW5jbHVkZSA8c3RkbGliLmg+
CiNpbmNsdWRlIDxzdHJpbmcuaD4KI2luY2x1ZGUgPHVuaXN0ZC5oPgojaW5jbHVkZSA8bmV0
aW5ldC9pbi5oPgojaW5jbHVkZSA8bGludXgvdHlwZXMuaD4KI2luY2x1ZGUgPGxpbnV4L25l
dGZpbHRlci5oPgkJLyogZm9yIE5GX0FDQ0VQVCAqLwoKI2luY2x1ZGUgPGxpYm5ldGZpbHRl
cl9xdWV1ZS9saWJuZXRmaWx0ZXJfcXVldWUuaD4KCiNpbmNsdWRlIDxlcnJuby5oPgoKc3Ry
dWN0IHBhY2tldF9kYXRhCnsKCXVfaW50MzJfdCBpZCwgZ29vZDsKfTsKCnN0YXRpYyBpbnQg
Y2Ioc3RydWN0IG5mcV9xX2hhbmRsZSAqcWgsIHN0cnVjdCBuZmdlbm1zZyAqbnUsCgkgICAg
ICBzdHJ1Y3QgbmZxX2RhdGEgKm5mYSwgdm9pZCAqZGF0YSkKewoJc3RydWN0IHBhY2tldF9k
YXRhICpwZCA9IChzdHJ1Y3QgcGFja2V0X2RhdGEqKWRhdGE7CglzdHJ1Y3QgbmZxbmxfbXNn
X3BhY2tldF9oZHIgKnBoID0gbmZxX2dldF9tc2dfcGFja2V0X2hkcihuZmEpOwoJCglpZiAo
cGQgJiYgcGgpCgl7CgkJaWYgKHBkLT5nb29kKSAvLyBzaW5jZSBsYXN0IHRpbWUKCQkJbmZx
X3NldF92ZXJkaWN0KHFoLCBwZC0+aWQsIE5GX0FDQ0VQVCwgMCwgTlVMTCk7CgoJCXBkLT5p
ZCA9IG50b2hsKHBoLT5wYWNrZXRfaWQpOwoJCXBkLT5nb29kID0gMTsKCQlwcmludGYoInJl
Y2VpdmVkIHBhY2tldCAlZFxuIiwgcGQtPmlkKTsKCX0KCQoJcmV0dXJuIDA7CgoJKHZvaWQp
bnU7Cn0KCmludCBtYWluKCkKewoJc3RydWN0IG5mcV9oYW5kbGUgKmg7CglzdHJ1Y3QgbmZx
X3FfaGFuZGxlICpxaDsKCXN0cnVjdCBwYWNrZXRfZGF0YSBwZDsKCWludCBmZDsKCWludCBy
djsKCWNoYXIgYnVmWzQwOTZdIF9fYXR0cmlidXRlX18gKChhbGlnbmVkKSk7CgoJcHJpbnRm
KCJvcGVuaW5nIGxpYnJhcnkgaGFuZGxlXG4iKTsKCWggPSBuZnFfb3BlbigpOwoJaWYgKCFo
KSB7CgkJZnByaW50ZihzdGRlcnIsICJlcnJvciBkdXJpbmcgbmZxX29wZW4oKVxuIik7CgkJ
ZXhpdCgxKTsKCX0KCglwcmludGYoInVuYmluZGluZyBleGlzdGluZyBuZl9xdWV1ZSBoYW5k
bGVyIGZvciBBRl9JTkVUIChpZiBhbnkpXG4iKTsKCWlmIChuZnFfdW5iaW5kX3BmKGgsIEFG
X0lORVQpIDwgMCkgewoJCWZwcmludGYoc3RkZXJyLCAiZXJyb3IgZHVyaW5nIG5mcV91bmJp
bmRfcGYoKVxuIik7CgkJZXhpdCgxKTsKCX0KCglwcmludGYoImJpbmRpbmcgbmZuZXRsaW5r
X3F1ZXVlIGFzIG5mX3F1ZXVlIGhhbmRsZXIgZm9yIEFGX0lORVRcbiIpOwoJaWYgKG5mcV9i
aW5kX3BmKGgsIEFGX0lORVQpIDwgMCkgewoJCWZwcmludGYoc3RkZXJyLCAiZXJyb3IgZHVy
aW5nIG5mcV9iaW5kX3BmKClcbiIpOwoJCWV4aXQoMSk7Cgl9CgoJcGQuZ29vZCA9IDA7Cglx
aCA9IG5mcV9jcmVhdGVfcXVldWUoaCwgIDEzIC8qIDwtLXF1ZXVlIG51bWJlciBoZXJlICov
LCAmY2IsICZwZCk7CglpZiAoIXFoKSB7CgkJZnByaW50ZihzdGRlcnIsICJlcnJvciBkdXJp
bmcgbmZxX2NyZWF0ZV9xdWV1ZSgpXG4iKTsKCQlleGl0KDEpOwoJfQoKCWlmIChuZnFfc2V0
X21vZGUocWgsIE5GUU5MX0NPUFlfTUVUQSwgMCkgPCAwKSB7CgkJZnByaW50ZihzdGRlcnIs
ICJjYW4ndCBzZXQgcGFja2V0X2NvcHkgbW9kZVxuIik7CgkJZXhpdCgxKTsKCX0KCglmZCA9
IG5mcV9mZChoKTsKCglmb3IgKDs7KSB7CgkJaWYgKChydiA9IHJlY3YoZmQsIGJ1Ziwgc2l6
ZW9mKGJ1ZiksIDApKSA+PSAwKSB7CgkJCW5mcV9oYW5kbGVfcGFja2V0KGgsIGJ1ZiwgcnYp
OwoJCQljb250aW51ZTsKCQl9CgkJLyogaWYgdGhlIGNvbXB1dGVyIGlzIHNsb3dlciB0aGFu
IHRoZSBuZXR3b3JrIHRoZSBidWZmZXIKCQkqIG1heSBmaWxsIHVwLiBEZXBlbmRpbmcgb24g
dGhlIGFwcGxpY2F0aW9uLCB0aGlzIGVycm9yCgkJKiBtYXkgYmUgaWdub3JlZCAqLwkJCgkJ
aWYgKGVycm5vID09IEVOT0JVRlMpIHsKCQkJcHJpbnRmKCJwa3QgbG9zdCEhXG4iKTsKCQkJ
Y29udGludWU7CgkJfQoJCXByaW50ZigicmVjdiBmYWlsZWQ6IGVycm5vPSVkICglcylcbiIs
CgkJCWVycm5vLCBzdHJlcnJvcihlcnJubykpOwoJfQoKCXByaW50ZigidW5iaW5kaW5nIGZy
b20gcXVldWUgMFxuIik7CgluZnFfZGVzdHJveV9xdWV1ZShxaCk7CgojaWZkZWYgSU5TQU5F
CgkvKiBub3JtYWxseSwgYXBwbGljYXRpb25zIFNIT1VMRCBOT1QgaXNzdWUgdGhpcyBjb21t
YW5kLCBzaW5jZQoJICogaXQgZGV0YWNoZXMgb3RoZXIgcHJvZ3JhbXMvc29ja2V0cyBmcm9t
IEFGX0lORVQsIHRvbyAhICovCglwcmludGYoInVuYmluZGluZyBmcm9tIEFGX0lORVRcbiIp
OwoJbmZxX3VuYmluZF9wZihoLCBBRl9JTkVUKTsKI2VuZGlmCgoJcHJpbnRmKCJjbG9zaW5n
IGxpYnJhcnkgaGFuZGxlXG4iKTsKCW5mcV9jbG9zZShoKTsKCglleGl0KDApOwp9Cg==
--=_north-26894-1305223406-0001-2--
