From: "Piszcz, Justin Michael" <justin.piszcz@mitretek.org>
Subject: RE: track bandwith used
Date: Wed, 30 Jun 2004 09:32:39 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <2E314DE03538984BA5634F12115B3A4E62E7FE@email1.mitretek.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Peter Marshall <peter.marshall@caris.com>, netfilter <netfilter@lists.netfilter.org>

There are a plethora of ways to do this:

You can setup rules to watch the amount of bytes going through them
using ipacct w/iptables(1), or use something else, like my favorite,
vnstat.

MRTGFE (front-end) can also calculate bandwidth from MRTG's logs,
although it will not be as accurate as using vnstat or iptables rules.

Examples provided below:

$ vnstat-eth1
Database updated: Wed Jun 30 09:30:01 2004

        eth1

           received:         10,232 MB (68.0%)
        transmitted:          4,819 MB (32.0%)
              total:         15,052 MB

                        rx     |     tx     |  total
        -----------------------+------------+-----------
        yesterday    109.39 MB |   92.08 MB |  201.47 MB
            today     44.30 MB |   42.55 MB |   86.86 MB
        -----------------------+------------+-----------
        estimated       110 MB |     105 MB |     215 MB

$ vnstat-eth1 -m

        eth1

           month        rx      |       tx      |    total
        ------------------------+---------------+---------------
          Mar '04    628.07 MB  |    298.45 MB  |    926.52 MB
          Apr '04     3,793 MB  |     1,189 MB  |     4,982 MB
          May '04     3,243 MB  |     1,916 MB  |     5,159 MB
          Jun '04     2,568 MB  |     1,415 MB  |     3,983 MB
        ------------------------+---------------+---------------
        estimated     2,622 MB  |     1,445 MB  |     4,067 MB

$ vnstat-eth1 -d

        eth1

            day         rx      |     tx      |  total
        ------------------------+-------------+--------------
           01.06.    113.69 MB  |   55.42 MB  |  169.12 MB
           02.06.    113.55 MB  |   54.73 MB  |  168.28 MB
           03.06.    130.42 MB  |   53.92 MB  |  184.35 MB
           04.06.    121.90 MB  |   51.18 MB  |  173.08 MB
           05.06.    109.29 MB  |   17.41 MB  |  126.70 MB
           06.06.    132.68 MB  |   14.20 MB  |  146.89 MB
           07.06.     82.54 MB  |   42.67 MB  |  125.22 MB
           08.06.     97.28 MB  |   63.38 MB  |  160.67 MB
           09.06.     95.96 MB  |   65.29 MB  |  161.25 MB
           10.06.    101.92 MB  |   74.46 MB  |  176.38 MB
           11.06.    123.68 MB  |  109.23 MB  |  232.91 MB
           12.06.     82.51 MB  |   47.83 MB  |  130.34 MB
           13.06.     49.64 MB  |    9.30 MB  |   58.94 MB
           14.06.     83.63 MB  |   48.73 MB  |  132.36 MB
           15.06.     64.12 MB  |   30.81 MB  |   94.93 MB
           16.06.     68.01 MB  |   47.18 MB  |  115.20 MB
           17.06.     69.38 MB  |   41.79 MB  |  111.17 MB
           18.06.     63.69 MB  |   27.17 MB  |   90.86 MB
           19.06.     51.91 MB  |   10.50 MB  |   62.42 MB
           20.06.     53.63 MB  |   10.54 MB  |   64.18 MB
           21.06.     84.77 MB  |   60.95 MB  |  145.72 MB
           22.06.     83.01 MB  |   60.98 MB  |     144 MB
           23.06.     49.68 MB  |   57.53 MB  |  107.22 MB
           24.06.     95.58 MB  |   79.03 MB  |  174.61 MB
           25.06.     92.69 MB  |   70.15 MB  |  162.85 MB
           26.06.     64.53 MB  |   12.19 MB  |   76.72 MB
           27.06.     54.97 MB  |   11.99 MB  |   66.96 MB
           28.06.     79.98 MB  |   52.11 MB  |  132.10 MB
           29.06.    109.39 MB  |   92.08 MB  |  201.47 MB
           30.06.     44.30 MB  |   42.55 MB  |   86.86 MB
        ------------------------+-------------+--------------
         estimated      110 MB  |     105 MB  |     215 MB



-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Peter Marshall
Sent: Wednesday, June 30, 2004 9:07 AM
To: netfilter
Subject: track bandwith used

Hi again,

I was also wondering if anyone knows a way to track bandwith being used
through the firewall .......
I use squid as a proxy behind the firewall if that helps at all ...

Thank you again,
Peter




