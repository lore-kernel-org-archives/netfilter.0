From: "Mark E. Donaldson" <markee@bandwidthco.com>
Subject: RE: how to block packets with specific words inside udp datagram???
Date: Sun, 12 Oct 2003 11:59:20 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <LFEHKEBEBHAFGJBMNKAOOELBCCAA.markee@bandwidthco.com>
References: <000d01c390d6$89b13900$0201a8c0@leonardo>
Reply-To: <markee@bandwidthco.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <000d01c390d6$89b13900$0201a8c0@leonardo>
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
To: "Piotr P." <peterp@poczta.onet.pl>, netfilter@lists.netfilter.org

It's not easy to block.  Take a look at http://www.lowth.com/p2pwall/.  This
will help you immensely.

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Piotr P.
Sent: Sunday, October 12, 2003 8:35 AM
To: netfilter@lists.netfilter.org
Subject: how to block packets with specific words inside udp datagram???


Does anybody know how to block kaza with iptables ?

    Kazza jump over ports, and hosts (if yopu block destinations to
kazza.com, rr1.kazza.com & rr2.kazza.com kazza uses ip's of other users that
was cached during last downloading anything from anyone). The key is, kazza
use tah same word "KaZaA" inside an uupd datagram. Does any body know how to
block traffic with this word using iptables?
Below is the sample dump:

a sample dump using udp to communicate with the other users from its
internal table and take note of different port  numbers used because these
are the ports that had been previously connected...

11:03:23.343988 IP fooler.ilo.skyinet.net.1962 >
cable-202-8-230-222.d-one.net.2911: udp 12
0x0000  4500 0028 a377 0000 8011 a5d5 ca4e 7642 E..(.w.......NvB
0x0010  ca08 e6de 07aa 0b5f 0014 c401 2700 0000 ......._....'...
0x0020  2980 4b61 5a61 4100                     ).KaZaA.

11:03:23.344282 IP fooler.ilo.skyinet.net.1962 > 202.8.251.31.1278: udp 12
0x0000  4500 0028 a378 0000 8011 9193 ca4e 7642 E..(.x.......NvB
0x0010  ca08 fb1f 07aa 04fe 0014 b621 2700 0000 ...........!'...
0x0020  2980 4b61 5a61 4100                     ).KaZaA.

11:03:23.344524 IP fooler.ilo.skyinet.net.1962 > 202.163.194.3.2844: udp 12
0x0000  4500 0028 a379 0000 8011 ca13 ca4e 7642 E..(.y.......NvB
0x0010  caa3 c203 07aa 0b1c 0014 e884 2700 0000 ............'...
0x0020  2980 4b61 5a61 4100                     ).KaZaA.

11:03:23.344762 IP fooler.ilo.skyinet.net.1962 > 202.69.170.153.3377: udp 12
0x0000  4500 0028 a37a 0000 8011 e1da ca4e 7642 E..(.z.......NvB
0x0010  ca45 aa99 07aa 0d31 0014 fe37 2700 0000 .E.....1...7'...
0x0020  2980 4b61 5a61 4100                     ).KaZaA.




best regards,
PeterP

gadu-gadu: 818854
        e-mail: peterp@poczta.onet.pl
         www:  http://republika.pl/peterp
            cell:  (++48) 606 675 729  (Mon - Fri, 8am-16pm ONLY!)
           ICQ: 217990807

-----------------------------------------------------------------------
-----              Zapraszam na moje aukcje internetowe
  -----
-----         Lista auktualnych aukcji, zawsze pod adresem:            -----
----- http://www.allegro.pl/show_user_auctions.php?uid=11609  -----
-----------------------------------------------------------------------




