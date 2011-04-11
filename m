From: =?ISO-8859-1?Q?Usu=E1rio_do_Sistema?= <maiconlp@ig.com.br>
Subject: Re: iptables - external IP address on internal interface?
Date: Mon, 11 Apr 2011 11:42:49 -0300
Message-ID: <BANLkTiknG4uVSkGGHsU1kLfY-m15Ww5+UA@mail.gmail.com>
References: <054F5B1BB94BD943B243C3B39B4F568D016E42CE@victory.Erudine.local>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <054F5B1BB94BD943B243C3B39B4F568D016E42CE@victory.Erudine.local>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Tony Rogers <Tony.Rogers@erudine.com>
Cc: netfilter@vger.kernel.org

Tony, I think your case it's normal because there is no an NAT for
packages from Internet to your Inside Network.

for exmplo, when a user , inside your network, accesses Internet there
is a NAT only for out when the packages returns ( from Internet )
there is no a NAT so you always will see return packages from Internet
on your inside network.the packages from Internet arrives on user
machine with an public IP address.


bye.














2011/4/11 Tony Rogers <Tony.Rogers@erudine.com>:
>
> I have a question for the iptables experts out there.
>
> I previously asked this question on this forum here.
>
> But no satisfactory answer was given.
>
> I have an iptables firewall, where *eth0* is the *internal interface*=
,
> and _eth1 is the external interface_. eth1 is connected directly to t=
he
> internet, and this box is also a NAT router.
>
> I am seeing traffic sourced from external IP addresses on eth0 (inter=
nal
> interface) - how can this be? (see logs below)
>
> Is there a rule I can add to prevent this?
>
> ---- log entries below -------------
>
> Logged 663 packets on interface eth0
> =A0 From 74.217.240.81 - 181 packets to
> tcp(2666,2674,2683,2685,2689,2694,2700,2704,2796,2799,2801,2806,2811,=
285
> 2,2860,2863,2868,2876,2877,2882,2886,2887,2892,2920,2926,2930,2942,29=
48,
> 3251,3253,3261,3268,3274,3286,3290,3293,3295,3300,3380,3425,3461,3559=
,36
> 21,3659,3686,3711)
> =A0 From 74.217.240.83 - 14 packets to tcp(1572)
> =A0 From 212.118.226.90 - 174 packets to
> tcp(2365,2382,2462,2467,2479,2485,2522,2539,2550,2570,2599,2604,2610,=
262
> 7,2637,2642,2668,2684,2686,2690,2696,2701,2743,2751,2763,2783,2802,28=
07,
> 2813,2861,2875,2884,2893,2921,2941,2957,2969,2986,3015,3041,3045,3051=
,31
> 95,3240,3241,3252,3254,3269,3287,3301)
> =A0 From 212.118.226.91 - 271 packets to
> tcp(1408,1444,1484,1506,1521,1528,2300,2356,2364,2384,2460,2466,2470,=
248
> 4,2523,2538,2544,2569,2575,2598,2601,2626,2643,2647,2742,2744,2753,27=
57,
> 2762,2766,2773,2781,2784,2789,2950,2954,2956,3005,3013,3017,3027,3032=
,30
> 40,3044,3050,3194,3202,3211,3228,3235,3239,3305,3467,3494,3506,3526,3=
536
> ,3719,3727,3813)
> =A0 From 212.118.226.93 - 23 packets to tcp(1419,1495,4362,4385,4416)
>
> =A0Logged 632 packets on interface eth1
> =A0 From 1.112.169.252 - 2 packets to tcp(445)
> =A0 From 2.201.14.207 - 3 packets to tcp(445)
> =A0 From 14.96.161.61 - 2 packets to tcp(445)
> =A0 From 17.172.237.52 - 2 packets to tcp(49641)
> <snip>
>
> ------------------------
> This email was scanned by BitDefender.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
