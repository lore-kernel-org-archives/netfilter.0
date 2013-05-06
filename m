From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: conntrack full with TIME_WAIT on tcp passive close site
Date: Mon, 6 May 2013 23:32:58 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1305062326060.15721@blackhole.kfki.hu>
References: <CA+WDh75vQ1yPeM8KMPhs4yKgK0apeVUvmvTPUxFjCgcKp6P0qg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CA+WDh75vQ1yPeM8KMPhs4yKgK0apeVUvmvTPUxFjCgcKp6P0qg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vladimir Ondrus <vladimir.ondrus@gmail.com>
Cc: netfilter@vger.kernel.org

On Mon, 6 May 2013, Vladimir Ondrus wrote:

> We have a setup with many tcp connections, which are after short time 
> activelly closed from remote site. However we have our nf_conntrack 
> table full with connections in TIME_WAIT state. Output from netstat 
> shows no connection in TIME_WAIT state, which we think is correct, 
> because we are passive close site, so connection should not go through 
> TIME_WAIT state.
> 
> Why tcp connection in conntrack table goes through TIME_WAIT, even we
> are pasive close site in tcp?

Conntrack reflects the state of the communicating party which sent the 
last packet, processed by conntrack. In this case it's in the TIME_WAIT 
state.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
