From: "" <kfm@plushkava.net>
Subject: Re: HELP rules nftables conntrack works
Date: Fri, 18 Sep 2020 03:22:54 +0100
Message-ID: <55d85ce8-150d-10da-5fc3-2c7819c24632@plushkava.net>
References: <CALtjan=mRON-wNz1Mevfs4JqF9uDDXxrXrSBY1G7DWAu3an8yQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------B2747926F260C93117F6B9CA"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=subject:to:references:cc:from:message-id:date:mime-version
        :in-reply-to:content-type; s=fm3; bh=CFxm3hzeukSoI7zglv4hzwWt3pM
        EuO7GoKdSUQXigF0=; b=nWxLxlQ94hBoUMeFNTkZFHye4PpdskpCoBXOyLFuTgg
        Ghx/g2OwACAti9xZihwzyDhsglSldsf8MA7BRmt10FyzQHdIj9qrzANusHRBd77s
        dchpncq99cCZR7ffotNTpAiOsJwlw3RYGae/876CoDGQtrEULXXIDPWlJw3vGSkk
        GpuD3TT/igmy/xEezt4y3ZRqNCWh3FuYHBtisn/bntjb6ERugTWREfmqyzrM/887
        uHXtQFC49wLTTGciA3I1/f6c4Jat9P2GuIiqaJypuc03tcaqy0sUwzpjvaqiTaJv
        8LtgtUKgRvcr+3v/cBjYsqq7rP+9f/YDJCM3HcMdZJQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=CFxm3h
        zeukSoI7zglv4hzwWt3pMEuO7GoKdSUQXigF0=; b=Ii1N/2HDJurTs4lo1/jC7Y
        dg9gyVJovTAaoe8eOsBcmW3cJ3pZFZ2GNN82okNJYdWPMXO/uWOdldAFIpVU4BYy
        KwmtmetWnsaOOHlPT2R1QFJGI5Ckq9EYkvZYgBH/Fx9/S4vp7bDygekTUuVyF30O
        72hZf8mfF0BJhTXnsjwGEKr8ljmTvxsVfF8fGeMmBfCS9TPby1NJOxCPzU+6T2WB
        +2xq1Wg3w74eGzyq0UN6LBv72NSpbnj0Au6p/4Xv/ayboytmAlk3lVWmUidYIx2d
        atEN0wSGKXlbb6QL6xcwdr2nqBgLdRtn0XGlQOZXGFpBvX7lPwlEADsS63wqVO9A
        ==
In-Reply-To: <CALtjan=mRON-wNz1Mevfs4JqF9uDDXxrXrSBY1G7DWAu3an8yQ@mail.gmail.com>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
To: netfilter <netfilter@vger.kernel.org>
Cc: =?UTF-8?Q?Luis_Mario_Niedas_Hern=c3=a1ndez?= <lmniedas@gmail.com>

This is a multi-part message in MIME format.
--------------B2747926F260C93117F6B9CA
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit

On 17/09/2020 19:56, Luis Mario Niedas Hernández wrote:
> Hola. Necesito que me ayuden a comprender como funciona conntrack, sus
> estados y como estos estan relacionados con las reglas en nftables.
> Voy a mostrarles mi nftables.conf para que me puedan entender.
> Hello. I need help to understand how works conntrack, it's state and
> how this one is related with the rules in nftables. I will show you my
> nftables.conf just so you can understand me.
> 
> #!/usr/sbin/nft -f
> 
> flush ruleset
> 
> table inet filter {
>      chain input {
>          type filter hook input priority 0; policy accept;
>          iifname "lo" accept
>          iifname "ens18" ip saddr 192.168.1.0/24 tcp dport ssh counter
> packets 21512 bytes 1833976 accept
>          iifname "ens18" ip saddr 192.168.1.0/24 tcp dport 3128 counter
> packets 1781072 bytes 216353018 accept
>          iifname "ens19" ip saddr 201.220.211.68 tcp sport 3128 counter
> packets 2995294 bytes 3960634157 accept
>          iifname "ens19" udp sport domain counter packets 33955 bytes
> 3076365 accept
>          iifname "ens19" tcp sport domain counter packets 0 bytes 0 accept
>          iifname "ens19" tcp sport http counter packets 41966 bytes
> 68096526 accept
>          iifname "ens19" tcp sport https counter packets 10348 bytes
> 6399161 accept
>          icmp type { echo-reply, echo-request } counter packets 408
> bytes 24692 limit rate 1/second accept
>          icmp type { echo-reply, echo-request } counter packets 0 bytes 0 drop
>          iifname "ens18" ip saddr 192.168.1.0/24 udp dport ntp counter
> packets 229 bytes 17404 accept
>          iifname "ens19" ip saddr 201.220.222.146 udp sport ntp counter
> packets 197 bytes 14972 accept
>          iifname "ens19" ip saddr 201.220.222.91 tcp sport {
> xmpp-client, 5223 } counter packets 0 bytes 0 accept
>      }
> 
>      chain forward {
>          type filter hook forward priority 0; policy drop;
>      }
> 
>      chain output {
>          type filter hook output priority 0; policy accept;
>          oifname "lo" accept
>          oifname "ens18" ip saddr 192.168.1.0/24 tcp sport ssh counter
> packets 16396 bytes 2435939 accept
>          oifname "ens18" ip daddr 192.168.1.0/24 tcp sport 3128 counter
> packets 2469407 bytes 4127574258 accept
>          oifname "ens19" ip daddr 201.220.211.68 tcp dport 3128 counter
> packets 2082185 bytes 250047659 accept
>          oifname "ens19" tcp dport domain counter packets 0 bytes 0 accept
>          oifname "ens19" udp dport domain counter packets 34127 bytes
> 2295099 accept
>          oifname "ens19" tcp dport http counter packets 27180 bytes
> 1721552 accept
>          oifname "ens19" tcp dport https counter packets 10387 bytes
> 2430969 accept
>          icmp type { echo-reply, echo-request } counter packets 410
> bytes 24808 limit rate 1/second accept
>          icmp type { echo-reply, echo-request } counter packets 0 bytes 0 drop
>          oifname "ens18" ip daddr 192.168.1.0/24 udp sport ntp counter
> packets 229 bytes 17404 accept
>          oifname "ens19" ip daddr 201.220.222.146 udp dport ntp counter
> packets 201 bytes 15204 accept
>          oifname "ens19" ip daddr 201.220.222.91 tcp dport {
> xmpp-client, 5223 } counter packets 0 bytes 0 accept
>      }
> }
> 
> table ip nat {
>      chain postrouting {
>          type nat hook postrouting priority 100; policy accept;
>          oifname "ens19" ip saddr 192.168.1.1 udp dport 53 counter
> packets 0 bytes 0  snat to 10.16.10.11
> 
>      }
> }
> 
> Yo deseo permitir solo las conexiones que se hagan por el puerto ssh
> que vengan desde mi red local (192.168.1.0) hacia mi
> firewall(192.168.1.3). Entiendo que el primer paquete que mi servidor
> vea, lo pondrá como NEW y que cuando mi servidor responda, se
> establecerá la conexión, y entonces el conntrack actualizará la
> conexión establecida.
> 
> I  want to allow only the connection made by my lan
> network(192.168.1.0) against to my firewall(192.168.1.3). I understand
> that the first packet that my firewall sees, it's tagged  like a NEW
> connection and when my server replies, then the connection will be
> tagged like established.
> 
> Mi duda sería: cómo implementar la reglas utilizando conntrack?
> debería de sustituir esta regla en la cadena input :
> My dude will: How i can implement the rules using contrack states? I
> should replace the following rule in the input chain
> 
> iifname "ens18" ip saddr 192.168.1.0/24 tcp dport ssh counter packets
> 21512 bytes 1833976 accept
> por::
> for  :
> 
> iifname "ens18" ip saddr 192.168.1.0/24 tcp dport ssh  ct state new,
> established counter packets 21512 bytes 1833976 accept
> 
> o solo esta:
> or only this one:
> 
> iifname "ens18" ip saddr 192.168.1.0/24 tcp dport ssh  ct state new
> counter packets 21512 bytes 1833976 accept
> 
> y en la cadena output entonces modificar esta regla:
> and  in the output chain then i should modify this one rule:
> 
> oifname "ens18" ip saddr 192.168.1.0/24 tcp sport ssh counter packets
> 16396 bytes 2435939 accept
> por esta:
> for this one:
> 
> oifname "ens18" ip saddr 192.168.1.0/24 tcp sport ssh  ct state
> established counter packets 16396 bytes 2435939 accept
> 
> La verdad no entiendo como implementar las reglas utilizando los
> estados del conntrack, he leído este link
> https://www.frozentux.net/iptables-tutorial/iptables-tutorial.html#STATEMACHINE
> y entiendo los estados de conntrack pero no sé como utilixzarlos. Pido
> disculpas por el tiempo que vayan a dedicar a ayudarme. Espero poder
> algún día devolver la ayuda recibida. Saludos.
> 
> Truly, I don't understand how I can make my rules using the contrack
> states. I read this link:
> https://www.frozentux.net/iptables-tutorial/iptables-tutorial.html#STATEMACHINE
> and i understand the conntrack states concept, but i don't know how to
> use it.I apologize for the time you are spending helping me. I hope
> one day to return the help received. Regards
> 

The first thing that you should understand is that your sample ruleset 
performs almost no ingress (input) filtering at all. The reason for this 
is that the input chain has a policy of accept. Almost all of the rules 
are of no consequence, because the packet would eventually be accepted 
anyway. Only the rate-limiting ICMP rules are an exception.

Composing a stateful ruleset that utilizes the conntrack system is quite 
easy. For an input-hooking chain, a common approach is to allow all 
packets matching "established" and "related" to pass. Next, you match 
the "new" state to facilitate the opening of any new connections, based 
on your needs. Finally, you drop any packets that have not otherwise 
matched the preceding rules.

I have attached a stateful ruleset that you may use as a template. To 
keep it as simple as possible, it is written in such a way that it only 
performs IPv4 filtering. Nevertheless, it should give you some idea of 
how to proceed.

-- 
Kerin Millar

--------------B2747926F260C93117F6B9CA
Content-Type: text/plain; charset=UTF-8; x-mac-type="0"; x-mac-creator="0";
 name="nft-stateful-ruleset.txt"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="nft-stateful-ruleset.txt"

IyEvdXNyL3NiaW4vbmZ0IC1mCgpmbHVzaCBydWxlc2V0Cgp0YWJsZSBpcCBmaWx0ZXIgewoJ
Y2hhaW4gaW5wdXQgewoJCSMgRHJvcCBieSBkZWZhdWx0LCBvdGhlcndpc2UgdGhlIHJ1bGVz
IGJlbG93IHdpbGwgYmUgdXNlbGVzcy4KCQl0eXBlIGZpbHRlciBob29rIGlucHV0IHByaW9y
aXR5IDA7IHBvbGljeSBkcm9wOwoKCQkjIE5ldmVyIGJsb2NrIGxvCgkJaWlmbmFtZSAibG8i
IGFjY2VwdAoKCQkjIEFsbG93IHBhY2tldHMgcmVsYXRlZCB0byBhbiBleGlzdGluZyBmbG93
IG9yIHZhbGlkIHN0YXRlIHRvIHBhc3MuCgkJY3Qgc3RhdGUgZXN0YWJsaXNoZWQscmVsYXRl
ZCBhY2NlcHQKCgkJIyBGb3IgcGFja2V0cyB0aGF0IHdvdWxkIGVzdGFibGlzaCBhIG5ldyBz
dGF0ZSwganVtcCB0byBhbm90aGVyIGNoYWluCgkJIyBiYXNlZCBvbiB0aGUgcHJvdG9jb2wu
IFRoaXMgaXMgYSBzdHlsaXN0aWMgY2hvaWNlLCBpbnRlbmRlZCB0byBrZWVwCgkJIyB0aGUg
aW5wdXQgY2hhaW4gc2hvcnQgYW5kIGVhc3kgdG8gdW5kZXJzdGFuZCwgYW5kIHRvIGF2b2lk
IGhhdmluZwoJCSMgdG8gcmVwZWF0ZWRseSBtYXRjaCB0aGUgIm5ldyIgc3RhdGUgaW4gdGhl
IHJlbWFpbmluZyBydWxlcy4KCQljdCBzdGF0ZSBuZXcgbWV0YSBsNHByb3RvIHZtYXAgewoJ
CQl0Y3AgIDoganVtcCBpbl90Y3AsCgkJCXVkcCAgOiBqdW1wIGluX3VkcCwKCQkJaWNtcCA6
IGp1bXAgaW5faWNtcAoJCX0KCX0KCgljaGFpbiBpbl90Y3AgewoJCSMgRGVmaW5lIHlvdXIg
b3BlbiBUQ1Agc2VydmljZXMgaGVyZS4gSWYgeW91IG5lZWQgdG8gZmlsdGVyIGJ5CgkJIyBp
aWZuYW1lIGFuZC9vciBzYWRkciB0aGVuIGZlZWwgZnJlZSB0byBkbyBzby4KCQl0Y3AgZHBv
cnQgeyAyMiwgNTMsIDgwLCA0NDMgfSBhY2NlcHQKCX0KCgljaGFpbiBpbl91ZHAgewoJCSMg
RGVmaW5lIHlvdXIgb3BlbiBVRFAgc2VydmljZXMgaGVyZS4gSWYgeW91IG5lZWQgdG8gZmls
dGVyIGJ5CgkJIyBpaWZuYW1lIGFuZC9vciBzYWRkciB0aGVuIGZlZWwgZnJlZSB0byBkbyBz
by4KCQl1ZHAgZHBvcnQgeyA1MyB9IGFjY2VwdAoJfQoKCWNoYWluIGluX2ljbXAgewoJCSMg
QWxsb3cgcGluZy4gRm9yIElQdjQsIHRoZSBlc3RhYmxpc2hlZC9yZWxhdGVkIHJ1bGUgaW4g
dGhlCgkJIyBpbnB1dCBjaGFpbiB3aWxsIGFsbG93IG90aGVyIG5lY2Vzc2FyeSBJQ01QIHBh
Y2tldHMgdG8gcGFzcy4KCQlpY21wIHR5cGUgZWNoby1yZXF1ZXN0IGFjY2VwdAoJfQoKCWNo
YWluIGZvcndhcmQgewoJCSMgRHJvcCwgYmVjYXVzZSBubyBwYWNrZXQgZm9yd2FyZGluZyBp
cyBleHBlY3RlZCBmb3IgdGhpcyBob3N0LgoJCXR5cGUgZmlsdGVyIGhvb2sgZm9yd2FyZCBw
cmlvcml0eSAwOyBwb2xpY3kgZHJvcDsKCX0KCgljaGFpbiBvdXRwdXQgewoJCSMgRG8gTk9U
IGZpbHRlciBvdXRwdXQgdW5sZXNzIHlvdSBoYXZlIGEgdmVyeSBnb29kIHJlYXNvbiEgSW4g
ZmFjdCwKCQkjIHRoaXMgY2hhaW4gZG9lcyBub3QgbmVlZCB0byBleGlzdC4KCQl0eXBlIGZp
bHRlciBob29rIG91dHB1dCBwcmlvcml0eSAwOyBwb2xpY3kgYWNjZXB0OwoJfQp9Cg==
--------------B2747926F260C93117F6B9CA--
