From: Bo Yang <struggle@mail.nankai.edu.cn>
Subject: Re: More question about ipset - protocol ?
Date: Mon, 16 Oct 2006 14:52:02 +0800
Message-ID: <360981767.23055@mail.nankai.edu.cn>
References: <360474234.15630@mail.nankai.edu.cn>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Message-ID: <45332C12.1070201@mail.nankai.edu.cn>
In-Reply-To: <360474234.15630@mail.nankai.edu.cn>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Cc: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1
 
Ming-Ching Tiew :
> I still have more questions with ipset, I noticed that in the
> portmap, there is no mentioned of protocol, whether should it be
> tcp or udp. Taking the example from the url :-
>
> http://ipset.netfilter.org/features.html
>
> iptables -A FORWARD -m set --set servers dst,dst -j ACCEPT iptables
> -A FORWARD -j DROP
>
> You notice that the ipmap 'server' binds to a portmap, but there is
>  no mentioned of protocol ( whether it should be tcp or udp ).
>
> Does it mean I have to specify the protocol in the iptables
> command, Shoudn't there be a way the protocol be mentioned in the
> binding somewhere  ?
Ip and the port can determine a package , why you need protocol ?
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (MingW32)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org
 
iD8DBQFFMysu7tZp58UCwyMRAlnVAKDWKKw8I3KYLzSUzJpqttopyFX0MgCg1z8I
bhvgoiUxyfrs/ht4HlXW/u0=
=HoXR
-----END PGP SIGNATURE-----


