From: Vladimir Ondrus <vladimir.ondrus@gmail.com>
Subject: Fwd: conntrack full with TIME_WAIT on tcp passive close site
Date: Tue, 7 May 2013 12:41:23 +0200
Message-ID: <CA+WDh741Lhv2v-Hu+on_2cSkb_iNpU99H8a_WWPCrrnSfD1RSA@mail.gmail.com>
References: <CA+WDh75vQ1yPeM8KMPhs4yKgK0apeVUvmvTPUxFjCgcKp6P0qg@mail.gmail.com>
	<alpine.DEB.2.00.1305062326060.15721@blackhole.kfki.hu>
	<CA+WDh76tvpAT1Zb8NAGEbGrVBhb+W7V0DnF7Dp21dZw0sx+9uw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:in-reply-to:references:date:message-id
         :subject:from:to:content-type;
        bh=kWSC2+QiqxZb1rhnolbvOUrYjPh0czjZw5cqPmQ8LZM=;
        b=DS2G7SAIMEe++eRtzYn1gsEg+oA4Vd8UnrLxRB46rLgUFYIYkvSKGaQWpZRD8qj5iL
         2QbpZBC7MZT2VUL1B3+D+MQhyU7blGTbXMDTh5w/Svt7hBcFrFWou0lFcjS8uONYaSgZ
         e1oA6f8m71DTdMMuiwVKkcaAsAN43FY9HsC4/PMOyiUDZyOKF4BG4TrMw3WCoDgSSnqP
         1uMXsis8O914MbXNvsX/3kP/ZEekr3Fu6BpxsxTfcSXjM0LSub20gGj+0SDQkkV2M+lV
         n3LqsuPDZI+GyGeNYSPYvddWyYQfREPdR8QFOsAJlOQu/n0+x4wt3weAq7q/GpiFIsvr
         Xv+Q==
In-Reply-To: <CA+WDh76tvpAT1Zb8NAGEbGrVBhb+W7V0DnF7Dp21dZw0sx+9uw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

lets have an example
1.
###
# server
###
suf-pgw:~ # netcat -l -p 10001


###
# client
###
suf-ins:/tmp/vlado # netcat 219.1.90.101 10001
^C punt!


2.Client close TCP session
###
# server
###
suf-pgw:~ # netstat -n | grep 10001
suf-pgw:~ # cat /proc/1/net/nf_conntrack | grep 10001
ipv4     2 tcp      6 104 TIME_WAIT src=219.1.90.100 dst=219.1.90.101
sport=59410 dport=10001 packets=4 bytes=216 src=219.1.90.101
dst=219.1.90.100 sport=10001 dport=59410 packets=2 bytes=112 [ASSURED]
mark=0 zone=0 use=2
suf-pgw:~ #

###
# client
###
suf-ins:/tmp/vlado # netstat -n | grep 10001
tcp        0      0 219.1.90.100:59410      219.1.90.101:10001      TIME_WAIT
suf-ins:/tmp/vlado # cat /proc/1/net/nf_conntrack | grep 10001
ipv4     2 tcp      6 88 TIME_WAIT src=219.1.90.100 dst=219.1.90.101
sport=59410 dport=10001 packets=4 bytes=216 src=219.1.90.101
dst=219.1.90.100 sport=10001 dport=59410 packets=2 bytes=112 [ASSURED]
mark=0 zone=0 use=2
suf-ins:/tmp/vlado #

Kernel tcp stack has TIME_WAIT only on client side -> output from netstat
Why conntrack has TIME_WAIT state on both sides ? -> nf_conntrack listing

Regards,
Vladimir Ondrus

2013/5/6 Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>:
> On Mon, 6 May 2013, Vladimir Ondrus wrote:
>
>> We have a setup with many tcp connections, which are after short time
>> activelly closed from remote site. However we have our nf_conntrack
>> table full with connections in TIME_WAIT state. Output from netstat
>> shows no connection in TIME_WAIT state, which we think is correct,
>> because we are passive close site, so connection should not go through
>> TIME_WAIT state.
>>
>> Why tcp connection in conntrack table goes through TIME_WAIT, even we
>> are pasive close site in tcp?
>
> Conntrack reflects the state of the communicating party which sent the
> last packet, processed by conntrack. In this case it's in the TIME_WAIT
> state.
>
> Best regards,
> Jozsef
> -
> E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
> PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
> Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
>           H-1525 Budapest 114, POB. 49, Hungar
