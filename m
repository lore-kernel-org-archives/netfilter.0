From: saravanan sakthi <lxsara@yahoo.com>
Subject: NAT problem
Date: Mon, 21 Oct 2002 06:04:13 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021021130413.79139.qmail@web12906.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
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
Content-Transfer-Encoding: 7bit
To: nf <netfilter@lists.samba.org>

  Here is my sinario...
        |             
     ___v__________________
    | eth0: 192.168.1.3/24 |
    |                      |
    |     Linux Box        |
    |                      |
    | eth1: 10.1.1.1/16    |
    `---|------------------'
        |
    ____v________________________________________
   /                                             \
  |   10.1.0.0 network                            \
  |                                                \
  |       ____________         __________           |
  |      /            \       /           \         |
  |     | 10.1.11.0/16 |     | 10.1.9.0/16 |        |
  |     |   network    |     |   network   |        |
  |      \____________/       \___________/         |
  |                                                 |
  |       _____________________________             |
  |      /                             \            |
  |     | 10.1.12.0 (My Network)        \           |
  |     |         |                      \          |
  |     |         |                       \         |
  |     |      ___v________________        |        |
  |     |     | eth0: 10.1.12.1/16 |       |       /
  |     |     |                    |       |      /
  |     |     |    Linux Box       |       |     /
  |     |     |                    |      /     /
  |     |     | eth1: 10.0.0.1/8   |     /     /
  |     |     `---|----------------'    /     /
  |     |         |                    /     /
  |     |        _v________           /     /
  |     |       /          \         /     /
  |     |      | 10.0.0.0/8 |       /     /
  |     |      | network    |      /     /
  |      \      \__________/      /     /
   \      \                      /     /
    \      \____________________/     /
     \                               /
      \_____________________________/

Here

  * The Linux box at the beginning acts as a gateway
and DNS forwarder
    for the entire network (installed with
rc.firewall-2.4).

  * My network is 10.1.12.0, I have implemented my
Linux box as a
    router for my network (installed with
rc.firewall-2.4).also acts
    as DNS forwarder (forwards requests to 10.1.1.1).

  * I have a subnet inside (10.0.0.0).my Linux box
acts as a gateway
    for these computers.

What I want is.....

   Connect a computer from 10.0.0.0 network to connect
computers at
   10.1.0.0 network.

Please tell me what are the rules should be added to
rc.firewall-2.4
file to accomplish this.

Thanks for time

Regards,

Saravanan.V

__________________________________________________
Do you Yahoo!?
Y! Web Hosting - Let the expert host your web site
http://webhosting.yahoo.com/

